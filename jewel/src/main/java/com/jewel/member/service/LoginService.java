package com.jewel.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface LoginService {

	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> findIdWithEmail(Map<String, Object> map) throws Exception;

	public int PwdEmailCheck(Map<String, Object> map) throws Exception;

	public void updateTempPw(Map<String,Object> map) throws Exception;
}