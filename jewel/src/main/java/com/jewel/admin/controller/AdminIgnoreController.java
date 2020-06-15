package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.paging.AdminIgnoreListPaging;
import com.jewel.admin.paging.AdminItemListPaging;
import com.jewel.admin.service.AdminIgnoreService;
import com.jewel.admin.service.AdminItemService;
import com.jewel.common.CommandMap;

@Controller
public class AdminIgnoreController {

	
	@Resource(name="AdminIgnoreListPaging")
	AdminIgnoreListPaging AdminIgnoreListPaging;
	@Resource(name="AdminIgnoreService")
	private AdminIgnoreService AdminIgnoreService; 
	
	
	
	
	@RequestMapping(value="/adminIgnoreList", method=RequestMethod.GET)
	public ModelAndView adminIgnoreList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("adminIgnoreList");  
			
			int show=12;
	    	int block=5;
	    	int pg;
	    	if(commandMap.get("pg")==null) {
		    	  pg=1;
		      }
	    	else {
	    	pg=Integer.parseInt((String)commandMap.get("pg"));
	    	}
	    	
	    	int endNum = pg*show;
			int startNum = endNum-(show-1);
			
			commandMap.put("START_NUM", startNum);
			commandMap.put("END_NUM", endNum);
			
	    	@SuppressWarnings("unused")
			int totalList=AdminIgnoreService.IgnoreTotalList(commandMap.getMap());
			AdminIgnoreListPaging.setPath(request.getContextPath());
			AdminIgnoreListPaging.setCurrentPage(pg);
			AdminIgnoreListPaging.setTotalList(totalList);
			AdminIgnoreListPaging.setPageBlock(block);
			AdminIgnoreListPaging.setPageSize(show);
	    	
			AdminIgnoreListPaging.makePagingHTML();
	    	
	    	mv.addObject("AdminIgnoreListPaging",AdminIgnoreListPaging);
			
			List<Map<String,Object>>list=AdminIgnoreService.selectIgnoreList(commandMap.getMap());
		  mv.addObject("list",list);
		 
		return mv;
	}
	
	@RequestMapping(value="/adminIgnoreDetail")
	public ModelAndView openIgnoreDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminIgnoreDetail");
		Map<String,Object> map=AdminIgnoreService.selectIgnoreDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	
	@RequestMapping(value="/adminIgnoreDelete")
	public ModelAndView deleteIgnore(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminIgnoreList");
		
		AdminIgnoreService.deleteIgnore(commandMap.getMap());
		
		return mv;
	}
}
