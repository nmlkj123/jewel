package com.jewel.item.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("itemDAO")
public class ItemDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getItemList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("item.getItemList",map);
	}
	
	public int getTotalList(Map<String, Object> map) {
		return  (Integer) selectOne("item.getTotalList", map);
		
	}

}
