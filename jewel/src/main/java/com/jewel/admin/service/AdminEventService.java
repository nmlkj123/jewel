package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminEventService {
	List<Map<String,Object>> selectEventList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectEventDetail(Map<String,Object>map)throws Exception;
	void insertEventWrite(Map<String,Object>map)throws Exception;
	void updateEventModify(Map<String,Object>map)throws Exception;
	void deleteEvent(Map<String,Object>map )throws Exception;
	int eventTotalList(Map<String,Object>map)throws Exception;
}
