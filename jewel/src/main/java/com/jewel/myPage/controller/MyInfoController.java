/* MyInfoService MyInfoController MyInfoDAO
http://localhost:8080/ninaebang/myPage/MyInfoDetail		내 정보 보기	/myInfo/MyInfoDetail		MyInfoDetail()		selectInfoDetail	MyInfoDetail.jsp
http://localhost:8080/ninaebang/myPage/MyInfoModifyForm	정보 수정 폼	/myInfo/MyInfoModifyForm	MyInfoModify()		selectInfoDetail	MyInfoModifyForm.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoModify		내 정보 수정	/myInfo/MyInfoModify		MyInfoModify()-post	updateInfoModify	MyInfoModify.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDeleteComfirm회원탈퇴-비밀번호확인						MyInfoDelete.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDelete		회원탈퇴	/myInfo/MyInfoDelete		MyInfoDelete()		deleteInfo			redirect: main	*/
package com.jewel.myPage.controller;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jewel.common.CommandMap;
import com.jewel.myPage.service.MyInfoService;


@Controller
public class MyInfoController {
	@Resource(name="myInfoService") 
	
	private MyInfoService myInfoService;
	

	///회원정보수정폼(myPageModifyForm)
	@RequestMapping(value="/myPage/myInfoModify", method=RequestMethod.GET)
	public ModelAndView myInfoModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPage/myInfoModify");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",id);
		
		Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap());	
		mv.addObject("myInfo",map);
		 
		return mv;
	}
	
	///회원정보수정(MyInfoModify)
	@RequestMapping(value="/myPage/myInfoModify", method=RequestMethod.POST)
	public ModelAndView myInfoModify(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myOrderList");			
		myInfoService.updateMyInfo(commandMap.getMap());
		
		return mv;
	}

	///회원탈퇴(MyInfoDelete)
	@RequestMapping(value="/myPage/myInfoDelete")
	public ModelAndView myInfoDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/login/logout");
		
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		myInfoService.myInfoDelete(commandMap.getMap());
		return mv;
	}


}   
  