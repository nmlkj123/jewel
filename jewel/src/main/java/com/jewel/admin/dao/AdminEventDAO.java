package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminEventDAO")
public class AdminEventDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectEventList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectEventDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectEventDetail",map);
		
	}
	public void insertEventWrite(Map<String,Object> map)throws Exception{
		insert("admin.insertEventWrite",map);
	}
	
	
	
	public void updateEventModify(Map<String, Object> map) throws Exception{
		update("admin.updateEventModify", map);
	}

	public void deleteEvent(Map<String, Object> map) throws Exception{
		update("admin.deleteEvent", map);
	}
	public int eventTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.eventTotalList", map);
	}
}
