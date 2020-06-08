package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminIgnoreService {
	List<Map<String,Object>> selectIgnoreList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectIgnoreDetail(Map<String,Object>map)throws Exception;
	void deleteIgnore(Map<String,Object>map )throws Exception;
	int IgnoreTotalList(Map<String,Object>map)throws Exception;
}
