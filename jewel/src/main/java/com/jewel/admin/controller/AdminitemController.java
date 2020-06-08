package com.jewel.admin.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.service.AdminItemService;
import com.jewel.common.CommandMap;





@Controller
public class AdminitemController {
		
	@Resource(name="AdminItemService")
	private AdminItemService AdminItemService;
	
	
	@RequestMapping(value="/adminItemList")
	public ModelAndView adminItemList(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminItemList");  
			List<Map<String,Object>>list=AdminItemService.selectItemList(commandMap.getMap());
		  mv.addObject("list",list);
		 
		return mv;
	}
	@RequestMapping(value="/adminItemDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminItemDetail");
		Map<String,Object> map=AdminItemService.selectItemDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/openAdminItemWrite")
	public ModelAndView OpenadminItemWrite(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminItemWrite");  
			
		 
		return mv;
	}
	@RequestMapping(value="/adminItemWrite")
	public ModelAndView adminItemWrite(CommandMap commandMap)throws Exception{
			
			AdminItemService.insertItemWrite(commandMap.getMap());
			ModelAndView mv=new ModelAndView("redirect:adminItemList");
			
		return mv;
	}
	@RequestMapping(value="/openAdminItemUpdate")
	public ModelAndView openBoardUpdate(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminItemUpdate");
		Map<String,Object> map=AdminItemService.selectItemDetail(commandMap.getMap());
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/adminItemUpdate")
	public ModelAndView updateBoard(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminItemList");
	
		AdminItemService.updateItemModify(commandMap.getMap());
		
		
		return mv;
	}
	@RequestMapping(value="/adminItemDelete")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminItemList");
		
		AdminItemService.deleteItem(commandMap.getMap());
		
		return mv;
	}


}
