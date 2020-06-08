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
	
	
	
	public void updateItemModify(Map<String, Object> map) throws Exception{
		update("admin.updateItemModify", map);
	}

	public void deleteItem(Map<String, Object> map) throws Exception{
		update("admin.deleteItem", map);
	}
	
}
