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
	public int myReviewTotalList(Map<String, Object> map) {
		return (Integer) selectOne("myPage.myReviewTotalList", map);
	}
	//상세보기
	public Map<String, Object> selectMyReviewDetail(Map<String, Object> map){
		return (Map<String, Object>) selectOne("myPage.selectMyReviewDetail", map);
	}
	
	//조회수 증가
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("myPage.updateHitCnt", map);
	}
	
	//나의 리뷰 수정폼
	public Map<String, Object> selectMyReviewModifyForm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("myPage.selectMyReviewDetail", map);
	}
	
	//수정
	public void updateMyReview(Map<String, Object> map) throws Exception {
		update("myPage.updateMyReview", map);
	}
		
	//삭제
	public void deleteMyReview(Map<String, Object> map) throws Exception{
		update("myPage.deleteMyReview", map);
	}
	
}
