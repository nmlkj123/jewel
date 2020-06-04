package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("AdminSalesDAO")
public class AdminSalesDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminItemDaySaleList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectDaySaleList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminItemMonthSaleList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectMonthSaleList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminCateDaySaleList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectCateDaySaleList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminCateMonthSaleList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectCateMonthSaleList", map);
	}
}
