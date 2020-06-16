package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyOrderListService {

	List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	int orderTotalList(Map<String,Object> map) throws Exception;
	void deliveryUpdate(Map<String,Object> map) throws Exception;

}
