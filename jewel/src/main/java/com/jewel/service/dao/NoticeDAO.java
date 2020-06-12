package com.jewel.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository
public class NoticeDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SelectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.SelectNoticeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> NoticeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("notice.NoticeDetail", map);
	}
	public int getTotalList(Map<String, Object> map) {
		return  (Integer) selectOne("notice.getTotalList", map);
}
}