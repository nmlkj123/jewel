package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyjjimListService {
	List<Map<String, Object>> selectMyjjimList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	
	int myJJimTotalList(Map<String,Object> map);
}
