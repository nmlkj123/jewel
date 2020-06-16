package com.jewel.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.member.service.LoginService;
import com.jewel.member.service.MailService;


@Controller
public class LoginController {
   
   String sendEmailId="nmlkj66@gmail.com";
   
   //로깅을 위한 변수
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name = "loginService")
   private LoginService loginService;
   
   
    @Resource(name="mailService")
    private MailService mailService;

   
   
   @RequestMapping(value="/login/loginForm") 
   public String loginForm() throws Exception{
      return "loginForm";
}
   //로그인 처리
   @RequestMapping(value = "/login/login", method = RequestMethod.POST)
   public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView("login");
      HttpSession session = request.getSession(true);
      String message="";
      String url="";
      Map<String,Object> result = loginService.loginCheck(commandMap.getMap());
      if(result == null) { //아이디가 있는지 확인
         message="해당 아이디가 존재하지 않습니다.";
         
      } else { 
      if(result.get("MEM_PWD").equals(commandMap.get("MEM_PWD"))){ //비밀번호가 같다면

         session.setAttribute("MEM_ID", commandMap.get("MEM_ID")); 

         session.setAttribute("MEM_RANK", result.get("MEM_RANK"));
         session.setAttribute("MEM_NUM", result.get("MEM_NUM")); 
         session.setAttribute("MEM_ADMIN", result.get("MEM_ADMIN"));
      }
      else {//비밀번호가 일치하지않을 때
         message="비밀번호가 맞지 않습니다.";
      }
      }
      mav.addObject("message",message);
      
      
      
      return mav;
}
   
   @RequestMapping(value="/login/logout")//로그아웃
   public void logout(HttpServletRequest request,HttpServletResponse response,CommandMap commandMap) throws Exception {
      HttpSession session = request.getSession(false);
      if (session != null)
         session.invalidate();
      
      
      response.setCharacterEncoding("UTF-8");
	  response.setContentType("text/html; charset=utf-8");
	  PrintWriter out = response.getWriter();
	
	  out.println("<script>alert('로그아웃 됬습니다.'); location.href='"+request.getContextPath()+"/main/main';</script>");
	 
	  out.flush();
      
      
   }
   
   @RequestMapping(value = "/login/findId") // 아이디 찾기 폼을 보여주는 메소드
   public ModelAndView findId(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("findId");
      return mv;
   }

   @RequestMapping(value = "/login/findIdResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
   public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
         ModelAndView mv = new ModelAndView("findIdResult");
      
         List<Map<String, Object>> list = loginService.findIdWithEmail(commandMap.getMap());
         mv.addObject("list", list);
         return mv;
      }
   

      

   @RequestMapping(value = "/login/findPw") // 비밀번호 찾기 폼을 보여주는 메소드
   public ModelAndView findPw(CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("findPw");
      return mav;
   }

   
   @RequestMapping(value="/login/findPwConfirm", method=RequestMethod.GET)
   @ResponseBody
   public boolean sendNewPw(CommandMap commandMap) throws Exception{
         //임시비밀번호 이메일로 보내기 
      System.out.println("ddd");
      int count=loginService.PwdEmailCheck(commandMap.getMap());
      if(count>0) {
         Random rnd =new Random();

         StringBuffer buf =new StringBuffer();

         for(int i=0;i<8;i++){
             // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
             if(rnd.nextBoolean()){
                 buf.append((char)((int)(rnd.nextInt(26))+97));
             }else{
                 buf.append((rnd.nextInt(10)));
             }
         }
         
         String subject = "[JEWELS]임시비밀번호입니다.";
         StringBuilder sb = new StringBuilder();
         sb.append("귀하의 임시 비밀번호 는  <span style=\"color:red;font-weight:bold;font-size:15px; \">" + buf.toString() + " </span>입니다.");
         if( mailService.send(subject, sb.toString(), sendEmailId,(String)commandMap.get("MEM_EMAIL"), null)) {
            
            commandMap.getMap().put("MEM_PWD", buf.toString());
            
            loginService.updateTempPw(commandMap.getMap());
            return true;
         }else {
            return false;
         }
      }
      
      return false;

   }
      
   
   @RequestMapping("/needLogin")
   //로그인 인터셉터
   public ModelAndView needLogin(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView("/login");
      String message = "로그인이 필요한 서비스입니다.";
      String url = "/loginForm";
      mv.addObject("message",message);
      mv.addObject("url",url);
      return mv;
   }
}