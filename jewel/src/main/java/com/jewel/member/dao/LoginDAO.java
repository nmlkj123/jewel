package com.jewel.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{ 

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.selectId", map);
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findIdWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("login.findIdWithEmail", map);
	}

	public int PwdEmailCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)selectOne("login.PwdEmailCheck",map);
	}

	public void updateTempPw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("login.updateTempPw",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIgnoredUsers(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return selectList("login.selectIgnoredUsers", map);
	}


}
