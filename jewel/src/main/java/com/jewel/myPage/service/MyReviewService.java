package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyReviewService {
	
	List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
}
