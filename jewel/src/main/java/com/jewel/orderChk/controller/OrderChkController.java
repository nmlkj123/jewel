package com.jewel.orderChk.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.orderChk.service.OrderChkService;

@Controller
public class OrderChkController {
	
	@Resource(name="orderChkService")
	private OrderChkService orderChkService;
	
	@RequestMapping(value="/orderChkPage")
	public ModelAndView orderChkList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("orderChkPage");
		
		int cnt=orderChkService.selectOrderChk(commandMap.getMap());

		HttpSession session = request.getSession();		
		if(session.getAttribute("MEM_ID")!= null) {
			ModelAndView mv1 = new ModelAndView("redirect:/myPage/myOrderList");
			return mv1;
			
		} else if(cnt > 0){						

			List<Map<String, Object>> orderChkList = orderChkService.selectOrderChkList(commandMap.getMap());
			mv.addObject("map",orderChkList);
			return mv;
			
		} else {
			ModelAndView mv2 = new ModelAndView("orderChk");
			String message = "다시입력해주세요.";
		    mv2.addObject("message",message);
			return mv2;
		}
		


	}
	
	//폼화면
	@RequestMapping(value="/orderChkForm")
	public ModelAndView orderChkForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("orderChkForm");
		return mv;		 
	}
	@RequestMapping(value="/orderExchange")
	public ModelAndView orderExchange(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		orderChkService.deliveryUpdate(commandMap.getMap());		
		return mv;
	}
	@RequestMapping(value="/orderReturn")
	public ModelAndView orderReturn(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		orderChkService.deliveryUpdate(commandMap.getMap());		
		return mv;
	}
	@RequestMapping(value="/orderCancel")
	public ModelAndView orderCancel(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		orderChkService.deliveryUpdate(commandMap.getMap());		
		return mv;
	}
	


}
