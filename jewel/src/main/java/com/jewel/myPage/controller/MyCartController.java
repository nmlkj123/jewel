package com.jewel.myPage.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;

import com.jewel.common.CommandMap;
import com.jewel.item.service.ItemService;
import com.jewel.myPage.service.MyCartService;
import com.jewel.paging.MyCartPaging;

@Controller
public class MyCartController {
	
	@Resource(name="myCartService")
	private MyCartService myCartService;
	
	@Resource(name="myCartPaging")
	private MyCartPaging myCartPaging;
	@Resource(name="itemService")
	private ItemService itemService;
	
	@RequestMapping(value="/myPage/myCart")
	public ModelAndView myCartList(CommandMap commandMap, HttpServletRequest request,HttpServletResponse response, @CookieValue(value="Guest_ID", required = false) Cookie cookie) throws Exception{
		ModelAndView mv = new ModelAndView("myCart");
		
		Map<String, Object> map =commandMap.getMap();
		CookieGenerator cg = new CookieGenerator();
		HttpSession session = request.getSession();
		String Guest_ID="";

		if(session.getAttribute("MEM_ID")!=null) {	
			commandMap.put("MEM_ID",(String) session.getAttribute("MEM_ID"));
		}else {
			if(cookie!=null) {
				System.out.println(cookie.getValue());
				commandMap.put("MEM_ID",cookie.getValue());
			}else {
				Random rnd =new Random();
				StringBuffer buf;
				
				while(true) {
				buf=new StringBuffer();
				for(int i=0;i<8;i++){
				    // rnd.nextBoolean() �뒗 �옖�뜡�쑝濡� true, false 瑜� 由ы꽩. true�씪 �떆 �옖�뜡 �븳 �냼臾몄옄瑜�, false �씪 �떆 �옖�뜡 �븳 �닽�옄瑜� StringBuffer �뿉 append �븳�떎.
				    if(rnd.nextBoolean()){
				        buf.append((char)((int)(rnd.nextInt(26))+97));
				    }else{
				        buf.append((rnd.nextInt(10)));
				    }
				}
				
				int num=itemService.checkGID(buf.toString());
					if(num==0) {
						Guest_ID=buf.toString();
						break;
					}
				}
				commandMap.put("MEM_ID", Guest_ID);
				cg.setCookieName("Guest_ID");
				cg.addCookie(response, Guest_ID);
				
			}
		}
		
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
		int totalList =  myCartService.myCartTotal(map);
    	myCartPaging.setPath(request.getContextPath());
    	myCartPaging.setCurrentPage(pg);
    	myCartPaging.setTotalList(totalList);
    	myCartPaging.setPageBlock(block);
    	myCartPaging.setPageSize(show);

    	myCartPaging.makePagingHTML();
		mv.addObject("myCartPaging",myCartPaging);
		
		
		List<Map<String, Object>> myCart = myCartService.selectMyCartList(commandMap.getMap());
		mv.addObject("myCart", myCart);
		return mv;
			
	}
	
	@RequestMapping(value="/myPage/myCartUpdate", method=RequestMethod.POST)
	public ModelAndView myCartUpdate(CommandMap commandMap, HttpServletRequest request, @CookieValue(value="Guest_ID", required = false) Cookie cookie) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();

		if(session.getAttribute("MEM_ID")!=null) {	
			commandMap.put("MEM_ID",(String) session.getAttribute("MEM_ID"));
		}else {
			if(cookie!=null) {
				System.out.println(cookie.getValue());
				commandMap.put("MEM_ID",cookie.getValue());
			}
		}
		myCartService.updateMyCart(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/myPage/myCartDelete")
	public ModelAndView myCartDelete(CommandMap commandMap, HttpServletRequest request, @CookieValue(value="Guest_ID", required = false) Cookie cookie) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		if(session.getAttribute("MEM_ID")!=null) {	
			commandMap.put("MEM_ID",(String) session.getAttribute("MEM_ID"));
		}else {
			if(cookie!=null) {
				System.out.println(cookie.getValue());
				commandMap.put("MEM_ID",cookie.getValue());
			}
		}
		myCartService.deleteMyCart(commandMap.getMap());
		
		return mv;
	}
	
}
