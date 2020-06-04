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
import com.jewel.myPage.service.MyOrderListService;
import com.jewel.myPage.service.MyjjimListService;

@Controller
public class MyjjimController {
	@Resource(name="myJJimService")
	MyjjimListService myJJimListService;
	
	@RequestMapping(value="/myPage/myjjimList")
	public ModelAndView myJJimList(CommandMap commandMap, HttpServletRequest request)
			throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myJJim");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID", id);
		
		Map<String, Object> myInfo = myJJimListService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> jjimList = myJJimListService.selectMyjjimList(commandMap.getMap());
		mv.addObject("jjimList", jjimList);
		
		return mv;
	}
	
}
