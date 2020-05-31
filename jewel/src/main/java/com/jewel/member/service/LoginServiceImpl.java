package com.jewel.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.member.dao.LoginDAO;

import com.jewel.member.service.LoginService;



@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectId(map);
	}

	@Override
	public List<Map<String, Object>> findIdWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findIdWithEmail(map);
	}

	@Override
	public int PwdEmailCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.PwdEmailCheck(map);
	}

	@Override
	public void updateTempPw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		loginDAO.updateTempPw(map);
	}

}

