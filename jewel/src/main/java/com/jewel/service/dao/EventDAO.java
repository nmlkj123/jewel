package com.jewel.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository
public class EventDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SelectEventList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("event.SelectEventList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> EventDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("event.EventDetail", map);
	}
	public int getTotalList(Map<String, Object> map) {
		return  (Integer) selectOne("event.getTotalList", map);
}
}