package com.jewel.orderChk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.orderChk.dao.OrderChkDAO;

@Service("orderChkService")
public class OrderChkServiceImpl implements OrderChkService{
	
	@Resource(name="orderChkDAO")
	private OrderChkDAO orderChkDAO; 
	
	@Override
	public List<Map<String, Object>> selectOrderChkList(Map<String, Object> map) throws Exception {	
		return orderChkDAO.selectOrderChkList(map);
	}
	
	@Override
	public int selectOrderChk(Map<String, Object> map) throws Exception {		
		return orderChkDAO.selectOrderChk(map);
	}
}
