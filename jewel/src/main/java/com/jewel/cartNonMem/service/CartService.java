package com.jewel.cartNonMem.service;

import java.util.List;
import java.util.Map;

public interface CartService {

	List<Map<String, Object>> selectCartList(Map<String, Object> map) throws Exception;
	int cartTotal(Map<String,Object> map) throws Exception;
	void updateCart(Map<String, Object> map) throws Exception;
	void insertCart(Map<String, Object> map) throws Exception;
	void deleteCart(Map<String, Object> map) throws Exception;
}
