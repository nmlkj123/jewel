package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.paging.AdminMemberListPaging;
import com.jewel.admin.service.AdminMemberService;
import com.jewel.common.CommandMap;

@Controller
public class AdminMemberController {
	@Resource(name="AdminMemberListPaging")
	AdminMemberListPaging AdminMemberListPaging;
	@Resource(name="AdminMemberService")
	AdminMemberService AdminMemberService;
	
	
	
	@RequestMapping(value="/adminMemberList", method=RequestMethod.GET)
	public ModelAndView adminMemberList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("adminMemberList");  
			
			int show=12;//페이지당 보여줄 상품 개수
	    	int block=5;//페이지당 보여줄 페이지개수
	    	int pg;
	    	String keyword=(String)commandMap.get("keyword");;
	    	if(commandMap.get("pg")==null) {
		    	  pg=1;
		      }
	    	else {
	    	pg=Integer.parseInt((String)commandMap.get("pg"));
	    	}
	    	
	    	int endNum = pg*show;
			int startNum = endNum-(show-1);
			
			commandMap.put("START_NUM", startNum);
			commandMap.put("END_NUM", endNum);
			
	    	@SuppressWarnings("unused")
			int totalList=AdminMemberService.memberTotalList(commandMap.getMap());
	    	AdminMemberListPaging.setPath(request.getContextPath());
	    	AdminMemberListPaging.setCurrentPage(pg);
	    	AdminMemberListPaging.setTotalList(totalList);
	    	AdminMemberListPaging.setPageBlock(block);
	    	AdminMemberListPaging.setPageSize(show);
	    	 if(keyword!=null && !keyword.isEmpty()) {
	    		 AdminMemberListPaging.setKeyword(keyword);
	    		 AdminMemberListPaging.makeKeywordPagingHTML();
	     		 mv.addObject("AdminMemberListPaging",AdminMemberListPaging);
		      }
	    	 else {
	    	AdminMemberListPaging.makePagingHTML();
	    	mv.addObject("AdminMemberListPaging",AdminMemberListPaging);
	    	 }
			List<Map<String,Object>>list=AdminMemberService.selectMemberList(commandMap.getMap());
		  mv.addObject("list",list);
		 
		return mv;
	}
	@RequestMapping(value="/adminMemberDetail")
	public ModelAndView adminMemberDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminMemberDetail");
		Map<String,Object> map=AdminMemberService.selectMemberDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/openAdminMemberIgnore")
	public ModelAndView openAdminMemberWrite(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminMemberIgnore");  
			Map<String,Object> map=AdminMemberService.selectMemberDetail(commandMap.getMap());
			mv.addObject("map",map);
		 
		return mv;
	}


	@RequestMapping(value="/adminMemberIgnore")
	public ModelAndView ignoreMember(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminMemberList");
	
		AdminMemberService.ignoreMember(commandMap.getMap());
		
		
		return mv;
	}
	@RequestMapping(value="/adminMemberDelete")
	public ModelAndView deleteMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminMemberList");
		
		AdminMemberService.deleteMember(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/openAdminMemberPoint")
	public ModelAndView openAdminMemberPoint(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminMemberPointUpdate");  
			Map<String,Object> map=AdminMemberService.selectMemberDetail(commandMap.getMap());
			mv.addObject("map",map);
		 
		return mv;
	}


	@RequestMapping(value="/adminMemberPointUpdate")
	public ModelAndView adminMemberPoint(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminMemberList");
	
		AdminMemberService.updateMemberPoint(commandMap.getMap());
		
		
		return mv;
	}
	
}
