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

@Controller
public class MyQnAController {
	@Resource(name="myQnAService")
	MyQnAService myQnAService;
	
	@RequestMapping(value="/myPage/myQnAList")
	public ModelAndView myQnAList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myQnA");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> myInfo = myQnAService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> qnaList = myQnAService.selectMyQnAList(commandMap.getMap());
		mv.addObject("qnaList", qnaList);
		
		return mv;
		
	}
	
	//나의 QNA상세보기
	@RequestMapping(value="/myPage/myQnADetail")
	public ModelAndView myQnADetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myPage/myQnADetail");
		Map<String, Object> myQnADetail = myQnAService.selectMyQnADetail(commandMap.getMap());
		mv.addObject("myQnADetail", myQnADetail);
		
		return mv;
	}

}
