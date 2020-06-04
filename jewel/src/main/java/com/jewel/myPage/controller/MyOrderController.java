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

@Controller
public class MyOrderController {
	
	@Resource(name="myOrderService")
	private MyOrderListService myOrderListService;
	
	@RequestMapping(value="/myPage/myOrderList")
	public ModelAndView myOrderList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myOrderList");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",id);
		
		Map<String, Object> myInfo = myOrderListService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> orderList = myOrderListService.selectMyOrderList(commandMap.getMap());
		mv.addObject("myOrder", orderList);
		
		return mv;
		
		
	}
	
	
	
	
}
