package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myReviewDAO")
public class MyReviewDAO extends AbstractDAO {
	
	//나의정보
	public Map<String, Object> selectMyInfo(Map<String, Object> map){
		return(Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}
	
	//나의 Review
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map){
		return(List<Map<String, Object>>) selectList("myPage.selectMyReviewList", map);
	}
	

}
