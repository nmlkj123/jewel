package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyOrderDAO;

@Service("myOrderService")
public class MyOrderListServiceImpl implements MyOrderListService {
	
	@Resource(name="myOrderDAO")
	private MyOrderDAO myOrderDAO;
	
	@Override
	public List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) throws Exception {
		return myOrderDAO.selectMyOrderList(map);
	}
	
	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception {
		return myOrderDAO.selectMyInfo(map);
	}
	
}
