package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminNoticeDao;

@Service("AdminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService{
	@Resource(name="AdminNoticeDao")
	AdminNoticeDao AdminNoticeDao;
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminNoticeDao.selectNoticeList(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminNoticeDao.selectNoticeDetail(map);
	}

	@Override
	public void insertNoticeWrite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminNoticeDao.insertNoticeWrite(map);
	}

	@Override
	public void updateNoticeModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminNoticeDao.updateNoticeModify(map);
	}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminNoticeDao.deleteNotice(map);
	}

	@Override
	public int noticeTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminNoticeDao.noticeTotalList(map);
	}

}
