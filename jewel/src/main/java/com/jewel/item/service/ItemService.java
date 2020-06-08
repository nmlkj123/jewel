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
}
