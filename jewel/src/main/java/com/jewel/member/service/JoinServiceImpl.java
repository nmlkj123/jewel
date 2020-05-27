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
	public int selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(map);
	}

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertMember(map);
	}


	@Override
	public int selectNickCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectNickCheck(map);
	}

}