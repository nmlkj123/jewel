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
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getItem(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("item.getItem", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getOption(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("item.getOption",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getSelectOption(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("item.getSelectOption",map);
	}
	public int checkGID(String id) {
		return (Integer) selectOne("item.checkGID",id);
	}
	public int addCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Integer) insert("item.addCart",map);
	}
	public int delItemCart(Map<String, Object> map) {
		return (Integer) delete("item.delItemCart",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("item.getOrderList",map);
	}
	public int setOrder(Map<String, Object> map) {
		return (Integer) insert("item.setOrder",map);
	}
	public int setDelivery(Map<String, Object> map) {
		return (Integer) insert("item.setDelivery",map);
	}
	public int addPrice(Map<String, Object> map) {
		return (Integer) update("item.addPrice",map);
	}
	public int delPoint(Map<String, Object> map) {
		return (Integer) update("item.delPoint",map);
	}
	public int findCart(Map<String, Object> map) {
		return (Integer) selectOne("item.findCart",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getItemMatch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("item.getItemMatch",map);
	}

}
