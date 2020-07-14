package com.jewel.myPage.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.item.service.ItemService;
import com.jewel.myPage.dao.MyOrderDAO;
import com.jewel.myPage.service.MyOrderListService;
import com.jewel.paging.MyOrderListPaging;
import com.jewel.review.service.ReviewService;

@Controller
public class MyOrderController {
	Logger log = Logger.getLogger(this.getClass());

	
	@Resource(name="myOrderService")
	private MyOrderListService myOrderListService;
	@Resource(name="itemService")
	ItemService itemService;
	
	
	@Resource(name="myOrderListPaging")
	private MyOrderListPaging myOrderListPaging;
	
	@RequestMapping(value="/myPage/myOrderList")
	public ModelAndView myOrderList(CommandMap commandMap, HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("myOrderList");
		
		Map<String, Object> map =commandMap.getMap();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");		
		commandMap.put("MEM_ID",id);
		commandMap.put("MEM_NUM", session.getAttribute("MEM_NUM"));
	   
		String pg=(String) commandMap.get("pg");  
		
		if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";   	  
		}
		
		int show=7;//페이지당 보여줄 상품 개수
    	int block=5;//페이지당 보여줄 페이지개수
    	int endNum = Integer.parseInt(pg)*show;
		int startNum = endNum-(show-1);

		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList =  myOrderListService.orderTotalList(map);
    	myOrderListPaging.setPath(request.getContextPath());
    	myOrderListPaging.setCurrentPage(pg);
    	myOrderListPaging.setTotalList(totalList);
    	myOrderListPaging.setPageBlock(block);
    	myOrderListPaging.setPageSize(show);

    	myOrderListPaging.makePagingHTML();
		mv.addObject("myOrderListPaging",myOrderListPaging);
		
		Map<String, Object> myInfo = myOrderListService.selectMyInfo(commandMap.getMap());
		mv.addObject("myInfo", myInfo);
		
		List<Map<String, Object>> orderList = myOrderListService.selectMyOrderList(commandMap.getMap());
		mv.addObject("myOrder", orderList);
		
	
		return mv;
			
	}
	
	
	
	
	@RequestMapping(value="/myPage/myOrderExchange")
	public ModelAndView myOrderExchange(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		myOrderListService.deliveryInsert(commandMap.getMap());		
		return mv;
	}
	@RequestMapping(value="/myPage/myOrderReturn")
	public ModelAndView myOrderReturn(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		myOrderListService.deliveryInsert(commandMap.getMap());		
		return mv;
	}
	@RequestMapping(value="/myPage/myOrderCancel")
	public ModelAndView myOrderCancel(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		myOrderListService.deliveryInsert(commandMap.getMap());		
		return mv;
	}
	
	@RequestMapping(value="/myPage/myDelDetail")
	public ModelAndView myDeliveryList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myDelDetail");
				
		List<Map<String, Object>> myDelivery = myOrderListService.selectDelivery(commandMap.getMap());
		mv.addObject("myDelivery", myDelivery);
		
		return mv;
	}
	
	@RequestMapping(value="/myPage/myOrderConfirm")
	public ModelAndView myOrderConfirm(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		myOrderListService.deliveryInsert(commandMap.getMap());
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("MEM_NUM")!=null) {
    		commandMap.put("MEM_NUM", session.getAttribute("MEM_NUM"));
    	}
		if(session.getAttribute("MEM_ID")!=null) {
    		commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));
    	}
		if(session.getAttribute("MEM_POINT")!=null) {
    		commandMap.put("MEM_POINT", session.getAttribute("MEM_POINT"));
    	}
		
		
		if(commandMap.getMap().get("MEM_ID")!=null) {
			 itemService.insertPoint(commandMap.getMap());
		 }
		if(commandMap.getMap().get("MEM_NUM")!=null && commandMap.getMap().get("MEM_POINT")!=null) {
			 itemService.updatePoint(commandMap.getMap());
			 itemService.updateRank(commandMap.getMap());
		 }
		return mv;
	}
	
}
