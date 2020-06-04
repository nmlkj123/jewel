package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.dao.AdminQnADAO;
import com.jewel.admin.service.AdminQnAService;
import com.jewel.common.CommandMap;

@Controller
public class AdminQnAController {
	@Resource(name="AdminQnAService")
	private AdminQnAService AdminQnAService;
	
	@RequestMapping(value="/adminQnAList")
	public ModelAndView adminQnAList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminQnAList");  
		List<Map<String,Object>>list=AdminQnAService.selectQnAList(commandMap.getMap());
		mv.addObject("list",list);
	 
	return mv;
}
	
	@RequestMapping(value="/adminQnADetail")
	public ModelAndView adminQnADetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminQnADetail");
		Map<String,Object> map=AdminQnAService.selectQnADetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	
	@RequestMapping(value="/openAdminQnAReply")
	public ModelAndView adminQnAReply(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminQnAReply");
		Map<String,Object> map=AdminQnAService.selectQnADetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	
	@RequestMapping(value="/adminQnAReply")
	public ModelAndView updateBoard(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminQnAList");
	
		AdminQnAService.qnaReply(commandMap.getMap());
		
		
		return mv;
	}
	
	@RequestMapping(value="/adminQnAReplyDelete")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminQnAList");
		
		AdminQnAService.qnaReplyDelete(commandMap.getMap());
		
		return mv;
	}
	@RequestMapping(value="/deleteQnA")
	public ModelAndView adminQnADelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminQnAList");
		
		AdminQnAService.deleteQnA(commandMap.getMap());
		
		return mv;
	}

}
