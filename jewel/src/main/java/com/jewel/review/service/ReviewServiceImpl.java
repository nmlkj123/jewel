package com.jewel.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.common.util.FileUtils;
import com.jewel.review.dao.ReviewDAO;



@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception {
		return reviewDAO.selectReviewList(map);
	}

	@Override
	public void insertReviewWrite(Map<String, Object> map) throws Exception {
		reviewDAO.insertReviewWrite(map);

		
	}

	@Override
	public Map<String, Object> selectReviewDetail(Map<String, Object> map) throws Exception {
		reviewDAO.ReviewHit(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = reviewDAO.selectReviewDetail(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> ReviewCommentsList(Map<String, Object> map) throws Exception {
		return reviewDAO.ReviewCommentsList(map);
	}

	
	@Override
	public void insertComments(Map<String, Object> map) throws Exception {
		reviewDAO.insertComments(map);
		
	}
	
	@Override
	public void deleteComments(Map<String, Object> map) throws Exception {
		reviewDAO.deleteComments(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) {
		return reviewDAO.getTotalList(map);
	}

	@Override
	public void updateComments(Map<String, Object> map) throws Exception {
		reviewDAO.updateComments(map);	
	}



}
