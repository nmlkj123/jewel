package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminFaqDao")
public class AdminFaqDao extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectFaqList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFaqDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectFaqDetail",map);
		
	}
	public void insertFaqWrite(Map<String,Object> map)throws Exception{
		insert("admin.insertFaqWrite",map);
	}
	
	
	
	public void updateFaqModify(Map<String, Object> map) throws Exception{
		update("admin.updateFaqModify", map);
	}

	public void deleteFaq(Map<String, Object> map) throws Exception{
		update("admin.deleteFaq", map);
	}
	public int faqTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.faqTotalList", map);
	}
}
