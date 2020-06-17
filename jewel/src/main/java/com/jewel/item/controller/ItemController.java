package com.jewel.item.controller;

import java.util.ArrayList;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;
import org.springframework.web.util.HttpSessionMutexListener;

import com.jewel.common.CommandMap;
import com.jewel.item.dao.ItemDAO;
import com.jewel.item.service.ItemService;
import com.jewel.member.service.LoginService;
import com.jewel.paging.ItemListPaging;
import com.thoughtworks.xstream.mapper.Mapper.Null;


@Controller
public class ItemController {
	@Resource(name="itemService")
	ItemService itemService;
	@Resource(name="itemListPaging")
	ItemListPaging itemListPaging;
	@Resource(name="loginService")
	LoginService loginService;
	
	@RequestMapping(value="/item/itemList")
	   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("itemList");
	      Map<String, Object> map =commandMap.getMap();

	      String pg=(String) commandMap.get("pg");
	      String type=(String) commandMap.get("type");
	      String sort=(String) commandMap.get("sort");
	      String keyword=(String)commandMap.get("keyword");
	      if(map.get("pg")==null|| map.get("pg").equals("")) {
	    	  pg="1";
	      }
	      if(map.get("sort")==null|| map.get("sort").equals("")) {
	    	  sort="1";
	      }

	      mv.addObject("pg",pg);
	      mv.addObject("type",type);
	      mv.addObject("sort",sort);
	      
	      if(keyword!=null && !keyword.isEmpty()) {
	    	  mv.addObject("keyword",keyword);
	      }
	      
	      return mv;      
	   }
	
	@RequestMapping(value="/item/getItemList", method=RequestMethod.POST)
    public ModelAndView openBoardList(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	

    	int show=12;//�������� ������ ��ǰ ����
    	int block=5;//�������� ������ ����������

    	int pg=Integer.parseInt((String)commandMap.get("pg"));
    	String keyword=(String) commandMap.get("keyword");
    	String sort=(String)commandMap.get("sort");
    	String type=(String)commandMap.get("type");
    	
    	int endNum = pg*show;
		int startNum = endNum-(show-1);
		
		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);
		
    	@SuppressWarnings("unused")
		int totalList=itemService.getTotalList(commandMap.getMap());//ī�װ� �� ��ǰ �� ����

    	itemListPaging.setPath(request.getContextPath());
    	itemListPaging.setCurrentPage(pg);
    	itemListPaging.setSort(sort);
    	itemListPaging.setType(type);
    	itemListPaging.setTotalList(totalList);
    	itemListPaging.setPageBlock(block);
    	itemListPaging.setPageSize(show);
    	if(keyword!=null && !keyword.isEmpty()) {
    		itemListPaging.setKeyword(keyword);
    		itemListPaging.makeKeywordPagingHTML();
    		mv.addObject("itemListPaging",itemListPaging);
    		
    	}
    	else if(type!=null && !type.isEmpty()){

    		itemListPaging.makePagingHTML();//StringBuffer�뿉 �럹�씠吏� 泥섎━

    		mv.addObject("itemListPaging",itemListPaging);
    	}

    	
    	List<Map<String,Object>> list = itemService.getItemList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	return mv;
    }
	@RequestMapping(value="/item/itemDetail")
	   public ModelAndView joinDetail(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("itemDetail");
	      
	      Map<String, Object> item= itemService.getItem(commandMap.getMap());
	      
	      mv.addObject("item",item);
	      return mv;      
	   }
	@RequestMapping(value="/item/getOption", method=RequestMethod.POST)
    public ModelAndView getOption(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String, Object>> option=itemService.getOption(commandMap.getMap());
    	
    	mv.addObject("list",option);
    	return mv;
	}
	@RequestMapping(value="/item/getSelectOption", method=RequestMethod.POST)
    public ModelAndView getSelectOption(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	System.out.println(commandMap.get("list"));

    	List<Map<String, Object>> option=itemService.getSelectOption(commandMap.getMap());
    	
    	mv.addObject("list",option);
    	return mv;
	}
	
	@RequestMapping(value="/item/addCart", method=RequestMethod.POST)
	@ResponseBody
    public boolean addCart(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response, @CookieValue(value="Guest_ID", required = false) Cookie cookie) throws Exception{
    	
    	HttpSession session = request.getSession(true);
    	CookieGenerator cg = new CookieGenerator();

    	
    	
    	String Guest_ID="";
    	String MEM_ID="";
    	
    	if(session.getAttribute("MEM_ID")!=null) {
    		MEM_ID=(String)session.getAttribute("MEM_ID");
    	}
		
    	if(MEM_ID.isEmpty()) {
			if(cookie==null) {
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
				cg.setCookieName("Guest_ID");
		    	cg.addCookie(response, Guest_ID);
	    		
			}else {
				Guest_ID=cookie.getValue();
			}
			commandMap.put("MEM_ID", Guest_ID);
		
    	}else {
    		commandMap.put("MEM_ID", MEM_ID);
    	}

    	
    	int i=itemService.addCart(commandMap.getMap());
    	if(i==0) {
    		return false;
    	}
    	return true;
	}
	@RequestMapping(value="/item/buyItemCart", method=RequestMethod.POST)
    public ModelAndView buyItemCart(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response, @CookieValue(value="TEMP_ID", required = false) Cookie cookie) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView"); 	
    	String TEMP_ID="";
    	CookieGenerator cg = new CookieGenerator();

		if(cookie==null) {
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
					TEMP_ID=buf.toString();
					break;
				}
			}
			cg.setCookieName("TEMP_ID");
			cg.addCookie(response, TEMP_ID);
		}else {
			TEMP_ID=cookie.getValue();
		}
		commandMap.put("MEM_ID", TEMP_ID);	
    	System.out.println(commandMap.getMap());
    	itemService.buyItemCart(commandMap.getMap());
    	return mv;
	}
	@RequestMapping(value="/item/delBuyItemCart", method=RequestMethod.POST)
    public ModelAndView delBuyItemCart(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response, @CookieValue(value="TEMP_ID", required = false) Cookie cookie) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView"); 	
    	if(cookie==null) {
    		return mv;
    	}
    	commandMap.put("MEM_ID", cookie.getValue());	
		itemService.delBuyItemCart(commandMap.getMap());
	
    	return mv;
	}
	
	@RequestMapping(value="/item/qmember")
	public ModelAndView qmember(CommandMap commandMap,HttpServletRequest request) throws Exception{
		HttpSession session =request.getSession();
		ModelAndView mv;
		if(session.getAttribute("MEM_ID")!=null) {
			mv= new ModelAndView("itemOrder");
		}else {
			mv= new ModelAndView("qmember");
		}

		
		return mv;
	}
	
	@RequestMapping(value="/item/itemLoginCheck")
	@ResponseBody
	public boolean itemLoginCheck(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		HttpSession session = request.getSession(true);
		Map<String,Object> result = loginService.loginCheck(commandMap.getMap());
		if(result == null) { //아이디가 있는지 확인
			return false;
			
		} else { 
			if(result.get("MEM_PWD").equals(commandMap.get("MEM_PWD"))){ //비밀번호가 같다면
				session.setAttribute("MEM_ID", commandMap.get("MEM_ID")); 
				session.setAttribute("MEM_RANK", result.get("MEM_RANK"));
				return true;
			}
		}
		return false;
		
	}
	
	@RequestMapping(value="/item/itemOrder")
	public ModelAndView itemOrder(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mv= new ModelAndView("itemOrder");
		if(commandMap.get("OR_PWD")!=null) {
			mv.addObject("OR_PWD",commandMap.get("OR_PWD"));
		}
		return mv;
	}
	@RequestMapping(value="/item/getOrderList", method=RequestMethod.POST)
    public ModelAndView getOrderList(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response, @CookieValue(value="TEMP_ID", required = false) Cookie cookie) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	HttpSession session=request.getSession();
    	String MEM_ID="";
    	
    	if(session.getAttribute("MEM_ID")!=null) {
    		MEM_ID=(String) session.getAttribute("MEM_ID");
    		commandMap.put("MEM_ID", MEM_ID);
    		
    		Map<String,Object> map=loginService.loginCheck(commandMap.getMap());
    		if(!map.isEmpty()) {
        		mv.addObject("member",map);
        	}
    	}
    	
    	
    	System.out.println(cookie.getValue());
    	commandMap.put("MEM_ID", cookie.getValue());
    	List<Map<String, Object>> cart=itemService.getOrderList(commandMap.getMap());
    	mv.addObject("list",cart);
    	
    	
    	return mv;
	}
	
	@RequestMapping(value="/item/payment", method=RequestMethod.POST)
    public ModelAndView payment(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");

		itemService.setOrder(commandMap.getMap());
    	
    	return mv;
	}
	@RequestMapping(value="/item/delPoint")
	public ModelAndView delPoint(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
 
		if(commandMap.getMap().get("MEM_NUM")!=null) {
			itemService.delPoint(commandMap.getMap());
		}

		
		return mv;
	}
	@RequestMapping(value="/item/getItemMatch", method=RequestMethod.POST)
    public ModelAndView getItemMatch(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response, @CookieValue(value="TEMP_ID", required = false) Cookie cookie) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String, Object>> list=itemService.getItemMatch(commandMap.getMap());
    	mv.addObject("list",list);
    	
    	
    	return mv;
	}
	@RequestMapping(value="/item/pwdOrder")
	   public ModelAndView pwdOrder(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("pwdOrder");
	      
	      return mv;      
	   }
	@RequestMapping(value="/item/orderSuccess")
	   public ModelAndView orderSuccess(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("orderSuccess");
	      mv.addObject("OR_NUM",commandMap.get("OR_NUM"));
	      return mv;      
	   }
}
