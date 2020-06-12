package com.jewel.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository
public class QNADAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectQNAList(Map<String, Object>map) throws Exception{
		return (List<Map<String, Object>>) selectList("qna.selectQNAList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectConfirm(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("qna.selectConfirm", map);
	}
	
	public void insertQNA(Map<String, Object> map) throws Exception{
		insert("qna.insertQNA", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQNADetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("qna.selectQNADetail", map);
	}

	public void updateQNA(Map<String, Object> map) throws Exception{
		update("qna.updateQNA", map);
	}
	
	public int getTotalList(Map<String, Object> map) {
		return  (Integer) selectOne("qna.getTotalList", map);
}
	public void qnaDelete(Map<String, Object> map) throws Exception{
		update("qna.qnaDelete", map);
	}
}