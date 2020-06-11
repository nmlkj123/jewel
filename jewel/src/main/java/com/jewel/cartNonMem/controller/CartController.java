package com.jewel.cartNonMem.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.cartNonMem.service.CartService;
import com.jewel.common.CommandMap;
import com.jewel.paging.CartPaging;
import com.jewel.paging.MyCartPaging;

@Controller
public class CartController {
	
	@Resource(name="cartService")
	private CartService cartService;
	
	@Resource(name="cartPaging")
	private CartPaging cartPaging;
	
	@RequestMapping(value="/cartList") //비회원 장바구니 목록
	public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("cart");
		
		Map<String, Object> map =commandMap.getMap();
		
		/* 쿠키값을 받아오기!
		 * HttpSession session = request.getSession(); String id = (String)
		 * session.getAttribute("MEM_ID"); commandMap.put("MEM_ID",id);
		 */

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
		int totalList =  cartService.cartTotal(map);
    	cartPaging.setPath(request.getContextPath());
    	cartPaging.setCurrentPage(pg);
    	cartPaging.setTotalList(totalList);
    	cartPaging.setPageBlock(block);
    	cartPaging.setPageSize(show);

    	cartPaging.makePagingHTML();
		mv.addObject("cartPaging",cartPaging);
		
		List<Map<String, Object>> cart = cartService.selectCartList(commandMap.getMap());
		mv.addObject("cart", cart);
		
		return mv;
			
	}
	
	@RequestMapping(value="/cart/cartInsert")
	public ModelAndView cartInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		cartService.insertCart(commandMap.getMap());
		
		return mv;
	}
	
	
	
	
	
	@RequestMapping(value="/cart/cartUpdate", method=RequestMethod.POST)
	public ModelAndView cartUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		//쿠키값받아오기.
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("MEM_ID");		
		//commandMap.put("MEM_ID",id);
		
		cartService.updateCart(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/cart/cartDelete")
	public ModelAndView cartDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		//쿠키값받아오기.
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("MEM_ID");		
		//commandMap.put("MEM_ID",id);
		
		cartService.deleteCart(commandMap.getMap());
		
		return mv;
	}
	
}
