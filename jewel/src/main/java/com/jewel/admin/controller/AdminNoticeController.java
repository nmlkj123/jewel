package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.paging.AdminNoticeListPaging;
import com.jewel.admin.service.AdminNoticeService;
import com.jewel.common.CommandMap;

@Controller
public class AdminNoticeController {
	@Resource(name="AdminNoticeListPaging")
	AdminNoticeListPaging AdminNoticeListPaging;
	@Resource(name="AdminNoticeService")
	private AdminNoticeService AdminNoticeService; 
	
	
	
	
	@RequestMapping(value="/adminNoticeList", method=RequestMethod.GET)
	public ModelAndView adminNoticeList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("adminNoticeList");  
			
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
			int totalList=AdminNoticeService.noticeTotalList(commandMap.getMap());
	    	AdminNoticeListPaging.setPath(request.getContextPath());
	    	AdminNoticeListPaging.setCurrentPage(pg);
	    	AdminNoticeListPaging.setTotalList(totalList);
	    	AdminNoticeListPaging.setPageBlock(block);
	    	AdminNoticeListPaging.setPageSize(show);
	    	
	    	AdminNoticeListPaging.makePagingHTML();
	    	
	    	mv.addObject("AdminNoticeListPaging",AdminNoticeListPaging);
			
			List<Map<String,Object>>list=AdminNoticeService.selectNoticeList(commandMap.getMap());
		  mv.addObject("list",list);
		 
		return mv;
	}
	@RequestMapping(value="/adminNoticeDetail")
	public ModelAndView adminNoticeDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminNoticeDetail");
		Map<String,Object> map=AdminNoticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/openAdminNoticeWrite")
	public ModelAndView openAdminNoticeWrite(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminNoticeWrite");  
			
		 
		return mv;
	}
	@RequestMapping(value="/adminNoticeWrite")
	public ModelAndView adminNoticeWrite(CommandMap commandMap)throws Exception{
			
			AdminNoticeService.insertNoticeWrite(commandMap.getMap());
			ModelAndView mv=new ModelAndView("redirect:adminNoticeList");
			
		return mv;
	}
	@RequestMapping(value="/openAdminNoticeUpdate")
	public ModelAndView openAdminNoticeUpdate(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminNoticeUpdate");
		Map<String,Object> map=AdminNoticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/adminNoticeUpdate")
	public ModelAndView updateBoard(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminNoticeList");
	
		AdminNoticeService.updateNoticeModify(commandMap.getMap());
		
		
		return mv;
	}
	@RequestMapping(value="/adminNoticeDelete")
	public ModelAndView deleteNotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminNoticeList");
		
		AdminNoticeService.deleteNotice(commandMap.getMap());
		
		return mv;
	}
}
