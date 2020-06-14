package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyCartService {

	List<Map<String, Object>> selectMyCartList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	int myCartTotal(Map<String,Object> map) throws Exception;
	void updateMyCart(Map<String, Object> map) throws Exception;
	void deleteMyCart(Map<String, Object> map) throws Exception;
	int checkOrderId(Map<String,Object> map) throws Exception;
}
