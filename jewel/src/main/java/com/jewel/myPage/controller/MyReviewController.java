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
import com.jewel.myPage.service.MyQnAService;
import com.jewel.myPage.service.MyReviewService;
import com.jewel.paging.MyReviewListPaging;

@Controller
public class MyReviewController {
	@Resource(name="myReviewService")
	MyReviewService myReviewService;
	
	@Resource(name="myReviewListPaging")
	MyReviewListPaging myReviewListPaging;
	
	@RequestMapping(value="/myPage/myReviewList")
	public ModelAndView myQnAList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myReview");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> map =commandMap.getMap();
		
		String pg= (String) commandMap.get("pg");  
		
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		
		int show=5;//페이지당 보여줄 상품 개수
    	int block=5;//페이지당 보여줄 페이지개수
    	int endNum =Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);

		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList =  myReviewService.myReviewTotalList(map);
    	myReviewListPaging.setPath(request.getContextPath());
    	myReviewListPaging.setCurrentPage(pg);
    	myReviewListPaging.setTotalList(totalList);
    	myReviewListPaging.setPageBlock(block);
    	myReviewListPaging.setPageSize(show);

    	myReviewListPaging.makePagingHTML();
		mv.addObject("myReviewListPaging",myReviewListPaging);
		
		Map<String, Object> myInfo = myReviewService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> reviewList = myReviewService.selectMyReviewList(commandMap.getMap());
		mv.addObject("reviewList", reviewList);
		
		return mv;	
	}
	
	@RequestMapping(value="/myPage/myReviewDetail")
	public ModelAndView myReviewDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myPage/myReviewDetail");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> myReview = myReviewService.selectMyReviewDetail(commandMap.getMap());
		
		myReviewService.updateHitCnt(commandMap.getMap());
		
		mv.addObject("myReview",myReview);
		return mv;	
	}
	@RequestMapping(value="/myPage/myReviewModifyForm")
	public ModelAndView myReviewModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myPage/myReviewModifyForm");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> myReviewModifyForm = myReviewService.selectMyReviewModifyForm(commandMap.getMap());
		mv.addObject("myReview",myReviewModifyForm);
		return mv;
	
	}
	@RequestMapping(value="/myPage/myReviewModify")
	public ModelAndView myReviewModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myReviewModify");
		
		myReviewService.updateMyReview(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/myPage/myReviewDelete")
	public ModelAndView myReviewDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myReviewDelete");
		
		myReviewService.deleteMyReview(commandMap.getMap());
		
		return mv;
	}

}
