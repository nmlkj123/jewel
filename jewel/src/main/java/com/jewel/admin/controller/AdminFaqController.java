package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.paging.AdminFaqListPaging;
import com.jewel.admin.service.AdminFaqService;
import com.jewel.common.CommandMap;
@Controller
public class AdminFaqController {
	@Resource(name="AdminFaqListPaging")
	AdminFaqListPaging AdminFaqListPaging;
	@Resource(name="AdminFaqService")
	private AdminFaqService AdminFaqService; 
	
	
	
	
	@RequestMapping(value="/adminFaqList", method=RequestMethod.GET)
	public ModelAndView adminFaqList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("adminFaqList");  
			
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
			int totalList=AdminFaqService.faqTotalList(commandMap.getMap());
	    	AdminFaqListPaging.setPath(request.getContextPath());
	    	AdminFaqListPaging.setCurrentPage(pg);
	    	AdminFaqListPaging.setTotalList(totalList);
	    	AdminFaqListPaging.setPageBlock(block);
	    	AdminFaqListPaging.setPageSize(show);
	    	
	    	AdminFaqListPaging.makePagingHTML();
	    	
	    	mv.addObject("AdminFaqListPaging",AdminFaqListPaging);
			
			List<Map<String,Object>>list=AdminFaqService.selectFaqList(commandMap.getMap());
		  mv.addObject("list",list);
		 
		return mv;
	}
	@RequestMapping(value="/adminFaqDetail")
	public ModelAndView adminFaqDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminFaqDetail");
		Map<String,Object> map=AdminFaqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/openAdminFaqWrite")
	public ModelAndView openAdminFaqWrite(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminFaqWrite");  
			
		 
		return mv;
	}
	@RequestMapping(value="/adminFaqWrite")
	public ModelAndView adminFaqWrite(CommandMap commandMap)throws Exception{
			
			AdminFaqService.insertFaqWrite(commandMap.getMap());
			ModelAndView mv=new ModelAndView("redirect:adminFaqList");
			
		return mv;
	}
	@RequestMapping(value="/openAdminFaqUpdate")
	public ModelAndView openAdminFaqUpdate(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminFaqUpdate");
		Map<String,Object> map=AdminFaqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/adminFaqUpdate")
	public ModelAndView updateBoard(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminFaqList");
	
		AdminFaqService.updateFaqModify(commandMap.getMap());
		
		
		return mv;
	}
	@RequestMapping(value="/adminFaqDelete")
	public ModelAndView deleteFaq(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminFaqList");
		
		AdminFaqService.deleteFaq(commandMap.getMap());
		
		return mv;
	}
}
