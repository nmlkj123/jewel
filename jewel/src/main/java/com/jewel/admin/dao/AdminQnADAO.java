package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminQnADAO")
public class AdminQnADAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectQnAList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnADetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectQnADetail",map);
		
	}
	public void qnaReply(Map<String,Object> map)throws Exception{
		update("admin.qnaReply",map);
	}
	
	
	
	
	public void qnaReplyDelete(Map<String, Object> map) throws Exception{
		update("admin.qnaReplyDelete", map);
	}
	
	public void deleteQnA(Map<String, Object> map) throws Exception{
		update("admin.deleteQnA", map);
	}
}
