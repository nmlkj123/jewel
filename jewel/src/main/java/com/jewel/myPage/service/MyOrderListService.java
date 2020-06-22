package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyOrderListService {

	List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	int orderTotalList(Map<String,Object> map) throws Exception;
	void deliveryInsert(Map<String,Object> map) throws Exception;
	List<Map<String, Object>> selectDelivery(Map<String, Object> map) throws Exception;
}
