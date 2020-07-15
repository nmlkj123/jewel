package com.jewel.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public interface ReviewService {

	List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception;
	
	void insertReviewWrite(Map<String, Object> map) throws Exception;

	Map<String, Object> selectReviewDetail(Map<String, Object> map) throws Exception;

	int selectCountMember(Map<String, Object> map) throws Exception;
	
	int ReviewDate(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> ReviewCommentsList(Map<String, Object> map) throws Exception;
	
	void insertPoints(Map<String, Object> map) throws Exception;
	
	void insertComments(Map<String, Object> map) throws Exception;
	
	void reviewPoint(Map<String, Object> map) throws Exception;

	void updateComments(Map<String, Object> map) throws Exception;
	
	void deleteComments(Map<String,Object>map )throws Exception;
	
	int getTotalList(Map<String,Object> map);



	

	
}
