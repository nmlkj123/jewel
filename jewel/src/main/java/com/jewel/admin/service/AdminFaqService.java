package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminFaqService {
	List<Map<String,Object>> selectFaqList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectFaqDetail(Map<String,Object>map)throws Exception;
	void insertFaqWrite(Map<String,Object>map)throws Exception;
	void updateFaqModify(Map<String,Object>map)throws Exception;
	void deleteFaq(Map<String,Object>map )throws Exception;
	int faqTotalList(Map<String,Object>map)throws Exception;
}
