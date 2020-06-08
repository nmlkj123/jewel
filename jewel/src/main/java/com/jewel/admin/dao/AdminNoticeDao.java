package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminNoticeDao")
public class AdminNoticeDao extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectNoticeList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectNoticeDetail",map);
		
	}
	public void insertNoticeWrite(Map<String,Object> map)throws Exception{
		insert("admin.insertNoticeWrite",map);
	}
	
	
	
	public void updateNoticeModify(Map<String, Object> map) throws Exception{
		update("admin.updateNoticeModify", map);
	}

	public void deleteNotice(Map<String, Object> map) throws Exception{
		update("admin.deleteNotice", map);
	}
	public int noticeTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.noticeTotalList", map);
	}
}
