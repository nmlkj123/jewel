package com.jewel.member.service;


import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.jewel.member.dao.JoinDAO;





@Service("joinService")
public class JoinServiceImpl implements JoinService{


	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public int selectIdCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(id);
	}

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertMember(map);
	}


	@Override
	public int selectNickCheck(String nick) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectNickCheck(nick);
	}

}