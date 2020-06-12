package com.jewel.service.service;

import java.util.List;
import java.util.Map;

public interface FaqService {

	

	List<Map<String, Object>> faqlist(Map<String, Object> map) throws Exception;
	
	Map<String, Object> faqDetail(Map<String, Object> map) throws Exception;
	
	int getTotalList(Map<String,Object> map);

}
