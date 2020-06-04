package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyQnADAO;
import com.jewel.myPage.dao.MyReviewDAO;

@Service("myReviewService")
public class MyReviewServiceImpl implements MyReviewService {
	
	@Resource(name="myReviewDAO")
	private MyReviewDAO myReviewDAO;
	
	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception {
		return myReviewDAO.selectMyInfo(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception {
		return myReviewDAO.selectMyReviewList(map);
	}
	
	

}
