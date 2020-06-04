package com.jewel.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.service.AdminQnAService;
import com.jewel.admin.service.AdminSalesService;
import com.jewel.common.CommandMap;

@Controller
public class AdminSalesController {
	@Resource(name="AdminSalesService")
	private AdminSalesService AdminSalesService;
	
	
	@RequestMapping(value="/graph")
	public ModelAndView graph(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("graph");  
		
	 
	return mv;
}
	
	@RequestMapping(value="/openAdminItemDaySaleList")
	public ModelAndView openAdminItemDaySaleList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("openAdminItemDaySaleList");  
		
	 
	return mv;
}
	
	@RequestMapping(value="/adminItemDaySaleList" ,method=RequestMethod.POST)
	public ModelAndView adminItemDaySaleList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");  
		List<Map<String,Object>>list=AdminSalesService.adminItemDaySaleList(commandMap.getMap());
		mv.addObject("list",list);
		
	 
	return mv;
}
	@RequestMapping(value="/adminItemMonthSaleList",method=RequestMethod.POST)
	public ModelAndView adminItemMonthSaleList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");  
		List<Map<String,Object>>list=AdminSalesService.adminItemMonthSaleList(commandMap.getMap());
		mv.addObject("list",list);
	 
	return mv;
}
	@RequestMapping(value="/adminCateDaySaleList",method=RequestMethod.POST)
	public ModelAndView adminCateDaySaleList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");  
		List<Map<String,Object>>list=AdminSalesService.adminCateDaySaleList(commandMap.getMap());
		mv.addObject("list",list);
	 
	return mv;
}
	@RequestMapping(value="/adminCateMonthSaleList",method=RequestMethod.POST)
	public ModelAndView adminCateMonthSaleList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");  
		List<Map<String,Object>>list=AdminSalesService.adminCateMonthSaleList(commandMap.getMap());
		mv.addObject("list",list);
	 
	return mv;
}
	
}
