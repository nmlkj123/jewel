package com.jewel.cartNonMem.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.cartNonMem.dao.CartDAO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Resource(name="cartDAO")
	private CartDAO cartDAO;
	
	@Override
	public List<Map<String, Object>> selectCartList(Map<String, Object> map) throws Exception {
		return cartDAO.selectCartList(map);
	}
	
	@Override
	public int cartTotal(Map<String, Object> map) throws Exception {
		return cartDAO.cartTotal(map);
	}
	
	@Override
	public void insertCart(Map<String, Object> map) throws Exception {
		cartDAO.insertCart(map);		
	}
	
	@Override
	public void updateCart(Map<String, Object> map) throws Exception {
		cartDAO.updateCart(map);	
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		cartDAO.deleteCart(map);
	}
	
}
