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

@Controller
public class MyReviewController {
	@Resource(name="myReviewService")
	MyReviewService myReviewService;
	
	@RequestMapping(value="/myPage/myReviewList")
	public ModelAndView myQnAList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myReview");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> myInfo = myReviewService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> reviewList = myReviewService.selectMyReviewList(commandMap.getMap());
		mv.addObject("reviewList", reviewList);
		
		return mv;
		
	}

}
