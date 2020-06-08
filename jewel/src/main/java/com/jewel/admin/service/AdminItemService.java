package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminItemService {
	List<Map<String,Object>> selectItemList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectItemDetail(Map<String,Object>map)throws Exception;
	void insertItemWrite(Map<String,Object>map)throws Exception;
	void updateItemModify(Map<String,Object>map)throws Exception;
	void deleteItem(Map<String,Object>map )throws Exception;
}
