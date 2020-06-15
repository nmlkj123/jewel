package com.jewel.service.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.paging.EventListPaging;
import com.jewel.paging.NoticeListPaging;
import com.jewel.service.service.EventService;

@Controller
public class EventController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="eventService")
	private EventService eventService;
	
	@Resource(name="eventListPaging")
	 EventListPaging eventListPaging;

	@RequestMapping(value="/event/eventList")
	public ModelAndView Eventlist(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("eventList");
		 Map<String, Object> map =commandMap.getMap();
		 
		 String pg=(String) commandMap.get("pg");
		 if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";
	    	  
	    	  mv.addObject("pg",pg);
	      }
		 
		 
		return mv;
	}
	@RequestMapping(value="/event/event")
    public ModelAndView EventList(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String, Object> map =commandMap.getMap();
		String pg=(String) commandMap.get("pg");  
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		String type=(String) commandMap.get("type");
		 if(map.get("type")==null|| map.get("type").equals("")) {
			 type="1";
	    	  
	    	  mv.addObject("type",type);
	      }
		int show=5;
    	int block=5;
    	int endNum = Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);
		
		commandMap.put("START_NUM",startNum);
		commandMap.put("END_NUM",endNum);
		
		@SuppressWarnings("unused")
		int totalList=eventService.getTotalList(map);
		eventListPaging.setPath(request.getContextPath());
		eventListPaging.setCurrentPage(pg);
		eventListPaging.setTotalList(totalList);
		eventListPaging.setPageBlock(block);
		eventListPaging.setPageSize(show);
		eventListPaging.setType(type);
		
    		
		eventListPaging.makePagingHTML();
	      mv.addObject("eventListPaging",eventListPaging);
	      
    	List<Map<String,Object>> list = eventService.SelectEventList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	return mv;
	}
	
	@RequestMapping(value="/event/eventDetail")
	public ModelAndView NoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("eventDetail");
		
		Map<String,Object> map = eventService.EventDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	
}
