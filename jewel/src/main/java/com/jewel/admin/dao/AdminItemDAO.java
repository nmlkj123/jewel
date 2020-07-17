package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminItemDAO")
public class AdminItemDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectitemList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectItemDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectItemDetail",map);
		
	}
	public void insertItemWrite(Map<String,Object> map)throws Exception{
		insert("admin.insertItemWrite",map);
	}
	
	public String selectItemNum(Map<String,Object> map)throws Exception{
		return (String)selectOne("admin.selectItemNum",map);
	}
	
	public void updateItemModify(Map<String, Object> map) throws Exception{
		update("admin.updateItemModify", map);
	}

	public void deleteItem(Map<String, Object> map) throws Exception{
		update("admin.deleteItem", map);
	}
	public int getTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.getTotalList", map);
	}
	public void insertOption(Map<String, Object> map) throws Exception{
		insert("admin.insertOption",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOptionList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectOptionList", map);
	}
	public void deleteOption(Map<String, Object> map) throws Exception{
		update("admin.deleteOption", map);
	}
	public int getOrderCount(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.selectOrder", map);
	}
	public int getQnACount(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.selectQnA", map);
	}
	public int getMemberCount(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.selectMember", map);
	}
	public int getRefundCount(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.selectRefund", map);
	}
}
