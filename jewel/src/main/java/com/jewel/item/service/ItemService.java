package com.jewel.item.service;

import java.util.List;
import java.util.Map;

public interface ItemService {

	List<Map<String, Object>> getItemList(Map<String, Object> map);
	
	int getTotalList(Map<String,Object> map);
	
	Map<String, Object> getItem(Map<String, Object> map);
	
	List<Map<String, Object>> getOption(Map<String, Object> map);
	
	List<Map<String, Object>> getSelectOption(Map<String, Object> map);
	
	int addCart(Map<String, Object> map);
	int buyItemCart(Map<String,Object>map);
	int delBuyItemCart(Map<String,Object>map);
	int checkGID(String id);
	
	List<Map<String, Object>> getOrderList(Map<String, Object> map);
	int setOrder(Map<String,Object> map);
	
	int addPoint(Map<String,Object> map);
	int delPoint(Map<String,Object> map);
	List<Map<String, Object>> getItemMatch(Map<String, Object> map);
}
