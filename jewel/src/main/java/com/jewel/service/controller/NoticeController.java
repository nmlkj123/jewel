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
import com.jewel.paging.NoticeListPaging;
import com.jewel.service.service.NoticeService;

@Controller
public class NoticeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="noticeListPaging")
	 NoticeListPaging noticeListPaging;

	@RequestMapping(value="/notice/noticeList")
    public ModelAndView NoticeList(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("noticeList");
    	
    	Map<String, Object> map =commandMap.getMap();
		String pg=(String) commandMap.get("pg");  
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		
		int show=5;
    	int block=5;
    	int endNum = Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);
		
		commandMap.put("START_NUM",startNum);
		commandMap.put("END_NUM",endNum);
		
		@SuppressWarnings("unused")
		int totalList=noticeService.getTotalList(map);
		noticeListPaging.setPath(request.getContextPath());
		noticeListPaging.setCurrentPage(pg);
		noticeListPaging.setTotalList(totalList);
		noticeListPaging.setPageBlock(block);
		noticeListPaging.setPageSize(show);
    		
		noticeListPaging.makePagingHTML();
	      mv.addObject("noticeListPaging",noticeListPaging);
	      
    	List<Map<String,Object>> list = noticeService.SelectNoticeList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	return mv;
	}
	
	@RequestMapping(value="/notice/noticeDetail")
	public ModelAndView NoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("noticeDetail");
		
		Map<String,Object> map = noticeService.NoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	
}
