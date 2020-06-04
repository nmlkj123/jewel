package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyQnAService {
	
	List<Map<String, Object>> selectMyQnAList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMyQnADetail(Map<String, Object> map) throws Exception;
}
