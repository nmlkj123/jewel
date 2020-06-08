package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminIgnoreDAO;
import com.jewel.admin.dao.AdminItemDAO;



@Service("AdminIgnoreService")
public class AdminIgnoreServiceImpl implements AdminIgnoreService{
	@Resource(name="AdminIgnoreDAO")
	private AdminIgnoreDAO AdminIgnoreDAO;

	@Override
	public List<Map<String, Object>> selectIgnoreList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminIgnoreDAO.selectIgnoreList(map);
	}

	@Override
	public Map<String, Object> selectIgnoreDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminIgnoreDAO.selectIgnoreDetail(map);
	}

	@Override
	public void deleteIgnore(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminIgnoreDAO.deleteIgnore(map);
	}

	@Override
	public int IgnoreTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminIgnoreDAO.IgnoreTotalList(map);
	}
	

}
