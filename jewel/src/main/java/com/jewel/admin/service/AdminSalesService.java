package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminSalesService {
	List<Map<String,Object>> adminItemDaySaleList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> adminItemMonthSaleList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> adminCateDaySaleList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> adminCateMonthSaleList(Map<String,Object>map) throws Exception;
}
