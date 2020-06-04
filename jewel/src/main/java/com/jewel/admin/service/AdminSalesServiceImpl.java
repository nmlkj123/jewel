package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminSalesDAO;

@Service("AdminSalesService")
public class AdminSalesServiceImpl implements AdminSalesService{
	@Resource(name="AdminSalesDAO")
	private AdminSalesDAO AdminSalesDAO;
	
	
	@Override
	public List<Map<String, Object>> adminItemDaySaleList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return AdminSalesDAO.adminItemDaySaleList(map);
	}

	@Override
	public List<Map<String, Object>> adminItemMonthSaleList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminSalesDAO.adminItemMonthSaleList(map);
	}

	@Override
	public List<Map<String, Object>> adminCateDaySaleList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminSalesDAO.adminCateDaySaleList(map);
	}

	@Override
	public List<Map<String, Object>> adminCateMonthSaleList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminSalesDAO.adminCateMonthSaleList(map);
	}

}
