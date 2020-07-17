package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface AdminItemService {
	List<Map<String,Object>> selectItemList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectItemDetail(Map<String,Object>map)throws Exception;
	void insertItemWrite(Map<String,Object>map)throws Exception;
	void updateItemModify(Map<String,Object>map)throws Exception;
	void deleteItem(Map<String,Object>map )throws Exception;
	int getTotalList(Map<String,Object>map)throws Exception;
	String restore(MultipartFile multipartFile, String uploadPath) throws Exception;
	String selectItemNum(Map<String,Object>map)throws Exception;
	void insertOption(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectOptionList(Map<String,Object>map) throws Exception;
	void deleteOption(Map<String,Object>map )throws Exception;
	int getOrderCount(Map<String,Object>map)throws Exception;
	int getQnACount(Map<String,Object>map)throws Exception;
	int getMemberCount(Map<String,Object>map)throws Exception;
	int getRefundCount(Map<String,Object>map)throws Exception;
}
