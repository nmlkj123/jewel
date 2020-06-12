package com.jewel.service.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.paging.FAQListPaging;
import com.jewel.paging.QNAListPaging;
import com.jewel.service.service.FaqService;


@Controller
public class FAQController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="faqService")
	private FaqService faqService;
	
	@Resource(name="faqListPaging")
	 FAQListPaging faqListPaging;
	
	@RequestMapping(value="/faq/faqlist")
    public ModelAndView faqlist(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("faqlist");
    	List<Map<String,Object>> list = faqService.faqList(commandMap.getMap());
    	mv.addObject("FAQ_CATE",commandMap.get("FAQ_CATE"));
    	mv.addObject("list", list);
    	
    	return mv;
	}
	
	@RequestMapping(value="/faq/faqlistAll")
    public ModelAndView faqlistAll(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("faqlistAll");
    	
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
		int totalList=faqService.getTotalList(map);
		faqListPaging.setPath(request.getContextPath());
		faqListPaging.setCurrentPage(pg);
		faqListPaging.setTotalList(totalList);
		faqListPaging.setPageBlock(block);
		faqListPaging.setPageSize(show);
    		
		faqListPaging.makePagingHTML();
	      mv.addObject("faqListPaging",faqListPaging);
	      
    	List<Map<String,Object>> list = faqService.faqListAll(commandMap.getMap());
    	mv.addObject("FAQ_CATE",commandMap.get("FAQ_CATE"));
    	mv.addObject("list", list);
    	
    	return mv;
	}



	
	
	
	@RequestMapping(value="/faq/faqDetail")
	public ModelAndView faqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("faqDetail");
		
		Map<String,Object> map = faqService.faqDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	
}