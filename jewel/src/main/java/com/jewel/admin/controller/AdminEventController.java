package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.paging.AdminEventListPaging;
import com.jewel.admin.service.AdminEventService;
import com.jewel.admin.service.AdminEventService;
import com.jewel.common.CommandMap;
@Controller
public class AdminEventController {
	@Resource(name="AdminEventListPaging")
	AdminEventListPaging AdminEventListPaging;
	@Resource(name="AdminEventService")
	private AdminEventService AdminEventService; 
	
	
	
	
	@RequestMapping(value="/adminEventList", method=RequestMethod.GET)
	public ModelAndView adminEventList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("adminEventList");  
			
			int show=12;//페이지당 보여줄 상품 개수
	    	int block=5;//페이지당 보여줄 페이지개수
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
			int totalList=AdminEventService.eventTotalList(commandMap.getMap());
	    	AdminEventListPaging.setPath(request.getContextPath());
	    	AdminEventListPaging.setCurrentPage(pg);
	    	AdminEventListPaging.setTotalList(totalList);
	    	AdminEventListPaging.setPageBlock(block);
	    	AdminEventListPaging.setPageSize(show);
	    	
	    	AdminEventListPaging.makePagingHTML();
	    
	    	mv.addObject("AdminEventListPaging",AdminEventListPaging);
			
			List<Map<String,Object>>list=AdminEventService.selectEventList(commandMap.getMap());
		  mv.addObject("list",list);
		 
		return mv;
	}
	@RequestMapping(value="/adminEventDetail")
	public ModelAndView adminEventDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminEventDetail");
		Map<String,Object> map=AdminEventService.selectEventDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/openAdminEventWrite")
	public ModelAndView openAdminEventWrite(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminEventWrite");  
			
		 
		return mv;
	}
	@RequestMapping(value="/adminEventWrite")
	public ModelAndView adminEventWrite(CommandMap commandMap)throws Exception{
			
			AdminEventService.insertEventWrite(commandMap.getMap());
			ModelAndView mv=new ModelAndView("redirect:adminEventList");
			
		return mv;
	}
	@RequestMapping(value="/openAdminEventUpdate")
	public ModelAndView openAdminEventUpdate(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminEventUpdate");
		Map<String,Object> map=AdminEventService.selectEventDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/adminEventUpdate")
	public ModelAndView updateBoard(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminEventList");
	
		AdminEventService.updateEventModify(commandMap.getMap());
		
		
		return mv;
	}
	@RequestMapping(value="/adminEventDelete")
	public ModelAndView deleteEvent(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminEventList");
		
		AdminEventService.deleteEvent(commandMap.getMap());
		
		return mv;
	}

}
