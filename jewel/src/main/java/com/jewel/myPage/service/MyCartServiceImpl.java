package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyCartDAO;

@Service("myCartService")
public class MyCartServiceImpl implements MyCartService {
	
	@Resource(name="myCartDAO")
	private MyCartDAO myCartDAO;
	
	@Override
	public List<Map<String, Object>> selectMyCartList(Map<String, Object> map) throws Exception {
		return myCartDAO.selectMyCartList(map);
	}
	
	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception {
		return myCartDAO.selectMyInfo(map);
	}
	@Override
	public int myCartTotal(Map<String, Object> map) throws Exception {
		return myCartDAO.myCartTotal(map);
	}
	@Override
	public void updateMyCart(Map<String, Object> map) throws Exception {
		myCartDAO.updateMyCart(map);
		
	}

	@Override
	public void deleteMyCart(Map<String, Object> map) throws Exception {
		myCartDAO.deleteMyCart(map);
	}
}
