package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminEventDAO;
@Service("AdminEventService")
public class AdminEventServiceImpl implements AdminEventService{
@Resource(name="AdminEventDAO")
AdminEventDAO AdminEventDAO;
	@Override
	public List<Map<String, Object>> selectEventList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminEventDAO.selectEventList(map);
	}

	@Override
	public Map<String, Object> selectEventDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminEventDAO.selectEventDetail(map);
	}

	@Override
	public void insertEventWrite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminEventDAO.insertEventWrite(map);
	}

	@Override
	public void updateEventModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminEventDAO.updateEventModify(map);
	}

	@Override
	public void deleteEvent(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminEventDAO.deleteEvent(map);
	}

	@Override
	public int eventTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminEventDAO.eventTotalList(map);
	}

}
