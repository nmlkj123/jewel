package com.jewel.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("review.selectReviewList", map);
	}
	
		
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReviewDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("review.selectReviewDetail",map);
		
	}
	
	public void insertReviewWrite(Map<String, Object> map) throws Exception{
		insert("review.insertReviewWrite", map);
	}
	
	public int selectCountMember(Map<String,Object>map) throws Exception{
		return (Integer) selectOne("review.selectCountMember",map);
	}
	
	public void ReviewHit(Map<String, Object> map) throws Exception{
		update("review.ReviewHit", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ReviewCommentsList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("review.ReviewCommentsList", map);
	}
	public void insertComments(Map<String, Object> map) throws Exception{
		insert("review.insertComments", map);
	}
	
	
	public void reviewPoint(Map<String, Object> map) throws Exception{
		update("review.reviewPoint", map);
	}
	
	
	public void updateComments(Map<String, Object> map) throws Exception{
		update("review.updateComments", map);
	}
	
	public void deleteComments(Map<String, Object> map) throws Exception{
		update("review.deleteComments", map);
	}
	
	public int getTotalList(Map<String, Object> map) {
		return  (Integer) selectOne("review.getTotalList", map);
    }
	
	public int ReviewDate(Map<String,Object>map) throws Exception{
		return (Integer) selectOne("review.ReviewDate",map);
	}
	
}