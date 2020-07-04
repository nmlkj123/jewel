package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminMemberDAO;
@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	@Resource(name="AdminMemberDAO")
	AdminMemberDAO AdminMemberDAO;
	
	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminMemberDAO.selectMemberList(map);
	}

	@Override
	public Map<String, Object> selectMemberDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminMemberDAO.selectMemberDetail(map);
	}

	@Override
	public void ignoreMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminMemberDAO.ignoreMember(map);
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminMemberDAO.deleteMember(map);
	}

	@Override
	public int memberTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminMemberDAO.memberTotalList(map);
	}

	@Override
	public void updateMemberPoint(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		 AdminMemberDAO.updateMemberPoint(map);
	}

	@Override
	public void insertPoint(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminMemberDAO.insertPoint(map);
	}

}
