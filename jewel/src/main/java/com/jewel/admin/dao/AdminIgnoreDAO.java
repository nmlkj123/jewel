package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminIgnoreDAO")
public class AdminIgnoreDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIgnoreList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectIgnoreList", map);
	}
	public int IgnoreTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.IgnoreTotalList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectIgnoreDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectIgnoreDetail",map);
		
	}
	public void deleteIgnore(Map<String, Object> map) throws Exception{
		update("admin.deleteIgnore", map);
	}
}
