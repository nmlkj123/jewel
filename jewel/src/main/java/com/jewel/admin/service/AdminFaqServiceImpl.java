package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminFaqDao;

@Service("AdminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService{
	@Resource(name="AdminFaqDao")
	AdminFaqDao AdminFaqDao;

	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminFaqDao.selectFaqList(map);
	}

	@Override
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminFaqDao.selectFaqDetail(map);
	}

	@Override
	public void insertFaqWrite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminFaqDao.insertFaqWrite(map);
	}

	@Override
	public void updateFaqModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminFaqDao.updateFaqModify(map);
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminFaqDao.deleteFaq(map);
	}

	@Override
	public int faqTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminFaqDao.faqTotalList(map);
	}

}
