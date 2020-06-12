package com.jewel.myPage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.myPage.service.MyOrderListService;
import com.jewel.myPage.service.MyjjimListService;
import com.jewel.paging.MyJJimListPaging;
import com.jewel.paging.MyOrderListPaging;

@Controller
public class MyjjimController {
	@Resource(name="myJJimService")
	MyjjimListService myJJimListService;
	
	@Resource(name="myJJimListPaging")
	private MyJJimListPaging myJJimListPaging;
	
	
	@RequestMapping(value="/myPage/myJJimList")
	public ModelAndView myJJimList(CommandMap commandMap, HttpServletRequest request)
			throws Exception{
		ModelAndView mv = new ModelAndView("myJJim");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> map =commandMap.getMap();
		
		String pg=(String) commandMap.get("pg");  
		
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		
		int show=7;//페이지당 보여줄 상품 개수
    	int block=5;//페이지당 보여줄 페이지개수
    	int endNum = Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);

		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList =  myJJimListService.myJJimTotalList(map);
    	myJJimListPaging.setPath(request.getContextPath());
    	myJJimListPaging.setCurrentPage(pg);
    	myJJimListPaging.setTotalList(totalList);
    	myJJimListPaging.setPageBlock(block);
    	myJJimListPaging.setPageSize(show);

    	myJJimListPaging.makePagingHTML();
		mv.addObject("myJJimListPaging",myJJimListPaging);
		
		Map<String, Object> myInfo = myJJimListService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> jjimList = myJJimListService.selectMyjjimList(commandMap.getMap());
		mv.addObject("jjimList", jjimList);
		
		return mv;
	}
	
}
