package com.jewel.service.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	
	List<Map<String, Object>> SelectNoticeList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> NoticeDetail(Map<String, Object> map) throws Exception;
	
	int getTotalList(Map<String,Object> map);
	
}
