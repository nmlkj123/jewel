package com.jewel.myPage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.myPage.service.MyQnAService;
import com.jewel.paging.MyJJimListPaging;
import com.jewel.paging.MyQnAListPaging;

@Controller
public class MyQnAController {
	@Resource(name="myQnAService")
	MyQnAService myQnAService;
	
	@Resource(name="myQnAListPaging")
	private MyQnAListPaging myQnAListPaging;
	
	@RequestMapping(value="/myPage/myQnAList")
	public ModelAndView myQnAList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myQnA");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> map =commandMap.getMap();
		
		String pg=(String) commandMap.get("pg");  
		
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		
		int show=5;//페이지당 보여줄 상품 개수
    	int block=5;//페이지당 보여줄 페이지개수
    	int endNum = Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);

		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList =  myQnAService.myQnATotalList(map);
    	myQnAListPaging.setPath(request.getContextPath());
    	myQnAListPaging.setCurrentPage(pg);
    	myQnAListPaging.setTotalList(totalList);
    	myQnAListPaging.setPageBlock(block);
    	myQnAListPaging.setPageSize(show);

    	myQnAListPaging.makePagingHTML();
		mv.addObject("myQnAListPaging",myQnAListPaging);
		
		
		
		Map<String, Object> myInfo = myQnAService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> qnaList = myQnAService.selectMyQnAList(commandMap.getMap());
		mv.addObject("qnaList", qnaList);
		
		return mv;
		
	}
	
	//나의 QNA상세보기
	@RequestMapping(value="/myPage/myQnADetail")
	public ModelAndView myQnADetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("myPage/myQnADetail");
		Map<String, Object> myQnADetail = myQnAService.selectMyQnADetail(commandMap.getMap());
		mv.addObject("myQnADetail", myQnADetail);
		//jsp에서 값을 보내면 자동으로 받아서 처리.
		return mv;
	}
	//1.수정하기 : Detail화면이동->myQnAModifyForm으로
	@RequestMapping(value="/myPage/myQnAModifyForm")
	public ModelAndView myQnAModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("myPage/myQnAModifyForm");
		
		Map<String, Object> myQnAModifyForm = myQnAService.selectMyQnAModifyForm(commandMap.getMap());
		mv.addObject("modifyForm", myQnAModifyForm);
		
		return mv;
	}
	//2. 수정처리
	@RequestMapping(value="/myPage/myQnAModify")
	public ModelAndView myQnAModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myQnAModify");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		myQnAService.updateMyQnA(commandMap.getMap());
			
		return mv;
	}
	
	@RequestMapping(value="/myPage/myQnADelete")
	public ModelAndView myQnADelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myQnADelete");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		myQnAService.deleteMyQnA(commandMap.getMap());
		
		return mv;
		
	}
	

}
