package com.jewel.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.member.service.JoinService;



@Controller
public class JoinController {


   @Resource(name="joinService")
   private JoinService joinService;
   
   @RequestMapping(value="/join/joinForm")
   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
      ModelAndView mv=new ModelAndView("joinForm");
      return mv;      
   }
   
   @RequestMapping(value="/join/idCheck")
   public String idCheck(CommandMap commandMap) throws Exception{
      String idCheck = String.valueOf(joinService.selectIdCheck(commandMap.getMap()));
      return idCheck;
   }
   
   
   @RequestMapping(value="/join/nickCheck")
   public String nickCheck(CommandMap commandMap) throws Exception{
      String nickCheck = String.valueOf(joinService.selectNickCheck(commandMap.getMap()));
   return nickCheck;
   }
   
   @RequestMapping(value="/join/emailAuth", method=RequestMethod.POST)
   public ModelAndView emailAuth(CommandMap commandMap) throws Exception{
      ModelAndView mv=new ModelAndView("/join/joinConfirm");
      joinService.insertMember(commandMap.getMap());
      return mv;
   }
}