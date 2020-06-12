package com.jewel.service.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QNAService {
	
	List<Map<String,Object>> selectQNAList(Map<String,Object> map) throws Exception;
	
	void insertQNA(Map<String,Object> map) throws Exception;

	Map<String,Object> selectQNADetail(Map<String,Object> map) throws Exception ;
	
	Map<String,Object> selectConfirm(Map<String,Object> map) throws Exception ;
	
	void updateQNA(Map<String, Object> map) throws Exception;
	
	void qnaDelete(Map<String,Object>map )throws Exception;
	
	int getTotalList(Map<String,Object> map);
}
