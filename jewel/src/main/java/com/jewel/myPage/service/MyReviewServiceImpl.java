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
	
	@Override
	public int myReviewTotalList(Map<String, Object> map) {
		return myReviewDAO.myReviewTotalList(map);
	}
	@Override
	public Map<String, Object> selectMyReviewDetail(Map<String, Object> map) throws Exception {
		return myReviewDAO.selectMyReviewDetail(map);
	}
	@Override
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		myReviewDAO.updateHitCnt(map);
		
	}
	@Override
	public Map<String, Object> selectMyReviewModifyForm(Map<String, Object> map) throws Exception {
		return myReviewDAO.selectMyReviewModifyForm(map);
	}
	@Override
	public void updateMyReview(Map<String, Object> map) throws Exception {
		myReviewDAO.updateMyReview(map);
	}
	
	@Override
	public void deleteMyReview(Map<String, Object> map) throws Exception {
		myReviewDAO.deleteMyReview(map);	
	}
	

}
