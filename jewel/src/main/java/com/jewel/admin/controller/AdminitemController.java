package com.jewel.admin.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.admin.paging.AdminItemListPaging;
import com.jewel.admin.service.AdminItemService;
import com.jewel.common.CommandMap;
import com.jewel.item.service.ItemService;
import com.jewel.paging.ItemListPaging;





@Controller
public class AdminitemController {
	
	@Resource(name="AdminItemListPaging")
	AdminItemListPaging AdminItemListPaging;
	@Resource(name="AdminItemService")
	private AdminItemService AdminItemService;
	
	
	
	
	@RequestMapping(value="/adminItemList", method=RequestMethod.GET)
	public ModelAndView adminItemList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView("adminItemList");  
			

			int show=12;
	    	int block=5;
	    	int pg;
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
			int totalList=AdminItemService.getTotalList(commandMap.getMap());//ī�װ� �� ��ǰ �� ����
	    	AdminItemListPaging.setPath(request.getContextPath());
	    	AdminItemListPaging.setCurrentPage(pg);
	    	AdminItemListPaging.setTotalList(totalList);
	    	AdminItemListPaging.setPageBlock(block);
	    	AdminItemListPaging.setPageSize(show);
	    	
	    	AdminItemListPaging.makePagingHTML();
	    
	    	mv.addObject("AdminItemListPaging",AdminItemListPaging);
	    	  String path="/images/item";
				String uploadPath=request.getSession().getServletContext().getRealPath("/");
				System.out.println(uploadPath);
				mv.addObject("path", uploadPath);
				
			List<Map<String,Object>>list=AdminItemService.selectItemList(commandMap.getMap());
		  mv.addObject("list",list);
		  
		 
		return mv;
	}
	@RequestMapping(value="/adminItemDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("adminItemDetail");
		Map<String,Object> map=AdminItemService.selectItemDetail(commandMap.getMap());
		List<Map<String,Object>>list=AdminItemService.selectOptionList(commandMap.getMap());
		mv.addObject("list",list);
		mv.addObject("map",map);
		String path="/images/item";
		String uploadPath=request.getSession().getServletContext().getRealPath(path);
		mv.addObject("path", uploadPath);
		return mv;
		
	}
	@RequestMapping(value="/openAdminItemWrite")
	public ModelAndView OpenadminItemWrite(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminItemWrite");  
			
		 
		return mv;
	}
	@RequestMapping(value="/openAdminMain")
	public ModelAndView openAdminMain(CommandMap commandMap)throws Exception{
			ModelAndView mv=new ModelAndView("adminMain");  
			
		 
		return mv;
	}
	@RequestMapping(value="/adminItemWrite")
	public ModelAndView adminItemWrite(CommandMap commandMap,HttpServletRequest request,@RequestParam("ITEM_IMAGE1") MultipartFile file1,@RequestParam("ITEM_IMAGE2") MultipartFile file2)throws Exception{
			commandMap.put("ITEM_IMAGE1", file1.getOriginalFilename());
			commandMap.put("ITEM_IMAGE2", file2.getOriginalFilename());
			AdminItemService.insertItemWrite(commandMap.getMap());
			ModelAndView mv=new ModelAndView("jsonView");
			String path="/images/item";
			  String uploadPath=request.getSession().getServletContext().getRealPath(path);
			  String ITEM_IMAGE1 = AdminItemService.restore(file1,uploadPath);
			  String ITEM_IMAGE2 = AdminItemService.restore(file2,uploadPath);
			  
				mv.addObject("img1", ITEM_IMAGE1);
				mv.addObject("img2",ITEM_IMAGE2);
			
		return mv;
	}
	@RequestMapping(value="/openAdminItemUpdate")
	public ModelAndView openBoardUpdate(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("adminItemUpdate");
		Map<String,Object> map=AdminItemService.selectItemDetail(commandMap.getMap());
		List<Map<String,Object>>list=AdminItemService.selectOptionList(commandMap.getMap());
		mv.addObject("list",list);
		mv.addObject("map",map);
	
		return mv;
	}
	@RequestMapping(value="/adminItemUpdate")
	public ModelAndView updateBoard(CommandMap commandMap,HttpServletRequest request,@RequestParam("ITEM_IMAGE1") MultipartFile file1,@RequestParam("ITEM_IMAGE2") MultipartFile file2) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		commandMap.put("ITEM_IMAGE1", file1.getOriginalFilename());
		commandMap.put("ITEM_IMAGE2", file2.getOriginalFilename());
		String path="/images/item";
		  String uploadPath=request.getSession().getServletContext().getRealPath(path);
		  String ITEM_IMAGE1 = AdminItemService.restore(file1,uploadPath);
		  String ITEM_IMAGE2 = AdminItemService.restore(file2,uploadPath);
		  
			mv.addObject("img1", ITEM_IMAGE1);
			mv.addObject("img2",ITEM_IMAGE2);
		AdminItemService.updateItemModify(commandMap.getMap());
		AdminItemService.deleteOption(commandMap.getMap());
		
		return mv;
	}
	@RequestMapping(value="/adminItemDelete")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:adminItemList");
		
		AdminItemService.deleteItem(commandMap.getMap());
		
		return mv;
	}
	@RequestMapping(value="/selectItemNum",method=RequestMethod.POST)
	public ModelAndView selectItemNum(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		String ITEM_NUM=AdminItemService.selectItemNum(commandMap.getMap());
		mv.addObject("ITEM_NUM",ITEM_NUM);
		
		return mv;
	}
	@RequestMapping(value="/insertOption",method=RequestMethod.POST)
	public ModelAndView insertOption(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		AdminItemService.insertOption(commandMap.getMap());
		
		
		return mv;
	}
	@RequestMapping(value="/selectOptionList",method=RequestMethod.POST)
	public ModelAndView selectOptionList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>>list=AdminItemService.selectOptionList(commandMap.getMap());
		mv.addObject("list",list);
		
		
		
		return mv;
	}

}
