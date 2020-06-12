package com.jewel.service.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.paging.QNAListPaging;
import com.jewel.service.service.QNAService;

@Controller
public class QNAController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	 QNAService qnaService;
	
	@Resource(name="qnaListPaging")
	 QNAListPaging qnaListPaging;
	
	@RequestMapping(value="/qna/qnalist")
	public ModelAndView qnalist(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("qnalist");
		
		Map<String, Object> map =commandMap.getMap();
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
		int totalList=qnaService.getTotalList(map);
		qnaListPaging.setPath(request.getContextPath());
		qnaListPaging.setCurrentPage(pg);
		qnaListPaging.setTotalList(totalList);
		qnaListPaging.setPageBlock(block);
		qnaListPaging.setPageSize(show);
    		
		qnaListPaging.makePagingHTML();
	      mv.addObject("qnaListPaging",qnaListPaging);


    	
		List<Map<String,Object>> list = qnaService.selectQNAList(commandMap.getMap());
    	mv.addObject("list", list);
	
    	return mv;
	}

	@RequestMapping(value="/qna/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qnaWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/qna/qnaWrite", method=RequestMethod.POST)
	public ModelAndView qnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna/qnalist");
		System.out.println(commandMap.getMap());
		qnaService.insertQNA(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/qna/qnaDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qnaDetail");
		
		Map<String,Object> map = qnaService.selectQNADetail(commandMap.getMap());
	   
	    		mv.addObject("map", map.get("map"));
	  
	    
		return mv;
}
	@RequestMapping(value="/qna/qnaPwConfirmForm")
	public ModelAndView qnaPwConfirm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qnaPwConfirmForm");
		mv.addObject("QNA_NUM",commandMap.get("QNA_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/qna/qnaPwConfirm", method = RequestMethod.POST)
	public ModelAndView qnaPwConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("qnaPwConfirm");
		System.out.println(commandMap.get("QNA_NUM"));
		String message="";
		Map<String,Object> chk= qnaService.selectConfirm(commandMap.getMap());
			if(chk.get("QNA_PWD").equals(commandMap.get("QNA_PWD"))){
			
			}
			else {
				message="비밀번호가 일치하지않습니다.";
			}
			mv.addObject("message",message);
			mv.addObject("QNA_NUM",chk.get("QNA_NUM"));
		return mv;
		
	}
	
	@RequestMapping(value="/qna/qnaUpdateForm")
	public ModelAndView updateBoardForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("qnaUpdateForm");
		
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		return mv;
	}
	
	
	@RequestMapping(value="/qna/qnaUpdate" , method = RequestMethod.POST)
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna/qnaDetail");
		
		qnaService.updateQNA(commandMap.getMap());
		
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/qna/qnaDelete")
	public ModelAndView adminQnADelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/qna/qnalist");
		
		qnaService.qnaDelete(commandMap.getMap());
		
		return mv;
	}
}