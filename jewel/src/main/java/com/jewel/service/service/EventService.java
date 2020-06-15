package com.jewel.service.service;

import java.util.List;
import java.util.Map;

public interface EventService {

	
	List<Map<String, Object>> SelectEventList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> EventDetail(Map<String, Object> map) throws Exception;
	
	int getTotalList(Map<String,Object> map);
	
}
