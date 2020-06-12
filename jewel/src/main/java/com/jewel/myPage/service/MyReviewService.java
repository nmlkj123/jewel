package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

public interface MyReviewService {
	
	List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception;
	int myReviewTotalList(Map<String, Object> map);
	Map<String, Object> selectMyReviewDetail(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyReviewModifyForm(Map<String, Object> map) throws Exception;
	void updateHitCnt(Map<String, Object> map) throws Exception;
	void updateMyReview(Map<String, Object> map) throws Exception;	
	void deleteMyReview(Map<String, Object> map) throws Exception;
	
}
