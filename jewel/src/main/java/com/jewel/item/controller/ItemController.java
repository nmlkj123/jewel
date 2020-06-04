package com.jewel.item.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.item.dao.ItemDAO;
import com.jewel.item.service.ItemService;
import com.jewel.paging.ItemListPaging;
import com.thoughtworks.xstream.mapper.Mapper.Null;


@Controller
public class ItemController {
	@Resource(name="itemService")
	ItemService itemService;
	@Resource(name="itemListPaging")
	ItemListPaging itemListPaging;
	
	@RequestMapping(value="/item/itemList")
	   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("itemList");
	      Map<String, Object> map =commandMap.getMap();
			/* sort=신상품:1,인기순:2,가격높은순:3,가격낮은순:4 리뷰순:5*/
	      String pg=(String) commandMap.get("pg");
	      String type=(String) commandMap.get("type");
	      String sort=(String) commandMap.get("sort");
	      String keyword=(String)commandMap.get("keyword");
	      if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";
	      }
	      if(map.get("sort")==null|| map.get("sort").equals("")) {
	    	  sort="1";
	      }

	      mv.addObject("pg",pg);
	      mv.addObject("type",type);
	      mv.addObject("sort",sort);
	      
	      if(keyword!=null && !keyword.isEmpty()) {
	    	  mv.addObject("keyword",keyword);
	      }
	      
	      return mv;      
	   }
	
	@RequestMapping(value="/item/getItemList", method=RequestMethod.POST)
    public ModelAndView openBoardList(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
		/*3조 팀원들 의 페이징 처리 시작*/
    	int show=12;//페이지당 보여줄 상품 개수
    	int block=5;//페이지당 보여줄 페이지개수
    	int pg=Integer.parseInt((String)commandMap.get("pg"));
    	String keyword=(String) commandMap.get("keyword");
    	String sort=(String)commandMap.get("sort");
    	String type=(String)commandMap.get("type");
    	int endNum = pg*show;
		int startNum = endNum-(show-1);
		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList=itemService.getTotalList(commandMap.getMap());//카테고리 의 상품 총 개수
    	itemListPaging.setPath(request.getContextPath());
    	itemListPaging.setCurrentPage(pg);
    	itemListPaging.setSort(sort);
    	itemListPaging.setType(type);
    	itemListPaging.setTotalList(totalList);
    	itemListPaging.setPageBlock(block);
    	itemListPaging.setPageSize(show);
    	if(keyword!=null && !keyword.isEmpty()) {
    		itemListPaging.setKeyword(keyword);
    		itemListPaging.makeKeywordPagingHTML();
    		mv.addObject("itemListPaging",itemListPaging);
    		
    	}
    	else if(type!=null && !type.isEmpty()){
    		itemListPaging.makePagingHTML();//StringBuffer에 페이징 처리
    		mv.addObject("itemListPaging",itemListPaging);
    	}
    	
		/* 페이징처리 끝 */
    	
    	List<Map<String,Object>> list = itemService.getItemList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	return mv;
    }
	
	
}
