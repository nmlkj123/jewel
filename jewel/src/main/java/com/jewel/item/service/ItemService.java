package com.jewel.item.service;

import java.util.List;
import java.util.Map;

public interface ItemService {

	List<Map<String, Object>> getItemList(Map<String, Object> map);
	
	int getTotalList(Map<String,Object> map);
}
