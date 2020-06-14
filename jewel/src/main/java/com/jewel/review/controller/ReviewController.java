package com.jewel.review.controller;


import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.jewel.common.CommandMap;

import com.jewel.paging.ReviewListPaging;
import com.jewel.review.service.ReviewService;

@Controller
public class ReviewController {
	Logger log = Logger.getLogger(this.getClass());

	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	@Resource(name="reviewListPaging")
	 ReviewListPaging reviewListPaging;
	
	@RequestMapping(value="/review/reviewList")
	
	public ModelAndView reviewList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
 
    
    
    Map<String, Object> map =commandMap.getMap();
    if(map.get("ITEM_NUM")==null) {
    	return mv;
    }
	String pg=(String) commandMap.get("pg");  
	if(map.get("pg")==null|| map.get("pg").equals("")) {
    	  pg="1";   	  
	}
	
	int show=5;
	int block=5;
	int endNum = Integer.parseInt(pg)*show;
	int startNum = endNum-(show-1);
	
	commandMap.put("START_NUM",startNum);
	commandMap.put("END_NUM",endNum);
	
	@SuppressWarnings("unused")
	int totalList=reviewService.getTotalList(map);
	reviewListPaging.setPath(request.getContextPath());
	reviewListPaging.setCurrentPage(pg);
	reviewListPaging.setTotalList(totalList);
	reviewListPaging.setPageBlock(block);
	reviewListPaging.setPageSize(show);
		
	reviewListPaging.makePagingHTML();
    mv.addObject("reviewListPaging",reviewListPaging);
    
    HttpSession session = request.getSession();
    String id = (String) session.getAttribute("MEM_ID");
    commandMap.put("MEM_ID", id);
    commandMap.put("MEM_NUM",session.getAttribute("MEM_NUM"));
	List<Map<String,Object>> list = reviewService.selectReviewList(commandMap.getMap());


	System.out.println(commandMap.getMap());
	mv.addObject("list", list);

	return mv;
}
	@RequestMapping(value="/review/reviewWriteForm")
	public ModelAndView reviewWriteForm(CommandMap commandMap,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("reviewWriteForm");
		String message="";
		String url="";
		
		 HttpSession session = request.getSession();
	      String id = (String) session.getAttribute("MEM_ID");
	      commandMap.put("MEM_ID",id);
	      commandMap.put("MEM_NUM",session.getAttribute("MEM_NUM"));
	      
	      mv.addObject("ITEM_NUM",commandMap.get("ITEM_NUM"));
			

	      if(commandMap.getMap().get("MEM_ID")!= null) {
	    	  	mv.addObject("MEM_NUM",commandMap.get("MEM_NUM"));
				url="/review/reviewWriteForm";
	}
	      else{
	    	  
	    	 message="비회원은 사용할 수 없습니다."; 
	    	 url="/login/loginForm";
	      }
	      mv.addObject("message",message);
	      mv.addObject("url",url);
			System.out.println(commandMap.getMap());
			
	     return mv;
	}
	@RequestMapping(value="/review/contentImage",method=RequestMethod.POST)
	@ResponseBody
	public String contentImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("\\images\\reviewImage");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder +"\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		return new String(  URLEncoder.encode( str_filename, "UTF-8" ));
	}
	@RequestMapping(value="/review/reviewWrite",method=RequestMethod.POST)
	public ModelAndView reviewWrite(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("main");

		reviewService.insertReviewWrite(commandMap.getMap());
		mv.addObject("RE_CONTENT",commandMap.get("RE_CONTENT"));
		mv.addObject("ITEM_NUM",commandMap.get("ITEM_NUM"));
		mv.addObject("MEM_NUM",commandMap.get("MEM_NUM"));
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>alert('리뷰가등록되었습니다.'); location.href='"+request.getContextPath()+"/item/itemDetail?ITEM_NUM="+commandMap.get("ITEM_NUM")+"';</script>");
		 
		out.flush();

		System.out.println(commandMap.getMap());
		return mv;
	}
	

	
	@RequestMapping(value="/review/reviewDetail")
	public ModelAndView reviewDetail(CommandMap commandMap,HttpServletRequest request) throws Exception{
	ModelAndView mv= new ModelAndView("reviewDetail");
	Map<String,Object> map = reviewService.selectReviewDetail(commandMap.getMap());
	List<Map<String,Object>> comment = reviewService.ReviewCommentsList(commandMap.getMap());
	  HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("MEM_ID");
	    commandMap.put("MEM_ID", id);
	    commandMap.put("MEM_NUM",session.getAttribute("MEM_NUM"));
	    mv.addObject("MEM_ID",commandMap.get("MEM_ID"));
	mv.addObject("RE_NUM",commandMap.get("RE_NUM"));
	mv.addObject("comment", comment);
	mv.addObject("map",map.get("map"));
	System.out.println(commandMap.getMap());

	return mv;
	}
	
	
	 @RequestMapping("/review/insertComment")
	    public ModelAndView insertComments(CommandMap commandMap,HttpServletRequest request) throws Exception{
			ModelAndView mv= new ModelAndView("jsonView");
			
		
		    mv.addObject("MEM_NUM",commandMap.get("MEM_NUM"));
		    mv.addObject("MEM_ID",commandMap.get("MEM_ID"));
		    mv.addObject("RE_NUM",commandMap.get("RE_NUM"));
			System.out.println(commandMap.getMap());
		    reviewService.insertComments(commandMap.getMap());
		   
		    
			return mv;
	    }
	 
	 @RequestMapping("/review/deleteComment")
	    public ModelAndView reviewComments(CommandMap commandMap,HttpServletRequest request) throws Exception{
			ModelAndView mv= new ModelAndView("jsonView");
			
			HttpSession session = request.getSession();
		    String id = (String) session.getAttribute("MEM_ID");
		    commandMap.put("MEM_ID", id);
		    commandMap.put("MEM_NUM",session.getAttribute("MEM_NUM"));
		    
		    reviewService.deleteComments(commandMap.getMap());
		    mv.addObject("RE_NUM",commandMap.get("RE_NUM"));
		    mv.addObject("CO_NUM",commandMap.get("CO_NUM"));
		    System.out.println(commandMap.getMap());

			return mv;
	    }
	
	 @RequestMapping("/review/updateComment")
	    public ModelAndView updateComments(CommandMap commandMap) throws Exception{
			ModelAndView mv= new ModelAndView("redirect:/review/reviewDetail");
		    reviewService.updateComments(commandMap.getMap());
		    mv.addObject("RE_NUM",commandMap.get("RE_NUM"));
		    mv.addObject("CO_NUM",commandMap.get("CO_NUM"));
		    System.out.println(commandMap.getMap());

			return mv;
	    }
}