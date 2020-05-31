package com.jewel.member.controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.member.service.JoinService;
import com.jewel.member.service.MailService;



@Controller
public class JoinController {
	String sendEmailId="nmlkj66@gmail.com";

   @Resource(name="joinService")
   private JoinService joinService;
   @Resource(name="mailService")
   private MailService mailService;
   
   @RequestMapping(value="/join/joinForm")
   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
      ModelAndView mv=new ModelAndView("joinForm");
      int ran = new Random().nextInt(900000) + 100000;
      mv.addObject("random", ran);
      return mv;      
   }
   /* 메인 */
   @RequestMapping(value="/main/main", method=RequestMethod.GET)
   public ModelAndView main(CommandMap commandMap) throws Exception{
      ModelAndView mv=new ModelAndView("main");
      return mv;
   }
   
	/* 회원가입 */
   @RequestMapping(value="/join/memberVerify", method=RequestMethod.POST)
   public ModelAndView memberVerify(CommandMap commandMap) throws Exception{
      ModelAndView mv=new ModelAndView("main");
	  joinService.insertMember(commandMap.getMap()); 
      return mv;
   }

	/* 이메일인증 코드 보내기 */
   @RequestMapping(value="/join/createEmailCheck", method=RequestMethod.GET)
   @ResponseBody
   public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random, HttpServletRequest req){
	   //이메일 인증
	   
	   int ran = new Random().nextInt(900000) + 100000;
	   HttpSession session = req.getSession(true);
	   String authCode = String.valueOf(ran);
	   session.setAttribute("authCode", authCode);
	   session.setAttribute("random", random);
	   session.setAttribute("userEmail", userEmail);
	   String subject = "회원가입 인증 코드 발급 안내 입니다.";
	   StringBuilder sb = new StringBuilder();
	   sb.append("귀하의 인증 코드는 <span style=\"color:red;font-weight:bold;font-size:15px; \">" + authCode + " </span>입니다.");
	   return mailService.send(subject, sb.toString(), sendEmailId, userEmail, null);
   }

	/* 이메일인증코드 확인 */
   @RequestMapping(value="/join/emailAuth", method=RequestMethod.GET)
   @ResponseBody
   public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session){
	   String originalJoinCode = (String) session.getAttribute("authCode");
	   String originalRandom = Integer.toString((Integer)session.getAttribute("random"));
	   
	   if(originalJoinCode.equals(authCode) && originalRandom.equals(random))
		   return new ResponseEntity<String>("complete", HttpStatus.OK);
	   else 
		   return new ResponseEntity<String>("false", HttpStatus.OK);
   }

	/* id중복체크 */
   @RequestMapping(value="/join/checkId", method=RequestMethod.POST)
   @ResponseBody
   public boolean checkId(@RequestParam String id)throws Exception{
	   
	   int check=joinService.selectIdCheck(id);
	   
	   if(check>0) {
		   return true;
	   }else 
		   return false;
   }
   /* 닉네임 중복체크 */
   @RequestMapping(value="/join/checkNick", method=RequestMethod.POST)
   @ResponseBody
   public boolean checkNick(@RequestParam String nick)throws Exception{
	   
	   int check=joinService.selectNickCheck(nick);
	   if(check>0) {
		   return true;
	   }else 
		   return false;
   }


}