package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("AdminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectMemberList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectMemberDetail",map);
		
	}
	public void ignoreMember(Map<String, Object> map) throws Exception{
		update("admin.ignoreMember", map);
	}

	public void deleteMember(Map<String, Object> map) throws Exception{
		update("admin.deleteMember", map);
	}
	public int memberTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.memberTotalList", map);
	}
	public void updateMemberPoint(Map<String, Object> map) throws Exception{
		update("admin.updateMemberPoint", map);
	}
}
