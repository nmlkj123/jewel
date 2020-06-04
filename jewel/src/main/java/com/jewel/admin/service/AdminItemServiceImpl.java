package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminItemDAO;


@Service("AdminItemService")



public class AdminItemServiceImpl implements AdminItemService {
	@Resource(name="AdminItemDAO")
	private AdminItemDAO adminItemDAO;

	
	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectItemList(map);
	}

	@Override
	public Map<String, Object> selectItemDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectItemDetail(map);
	}

	@Override
	public void insertItemWrite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.insertItemWrite(map);
	}

	@Override
	public void updateItemModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.updateItemModify(map);
	}

	@Override
	public void deleteItem(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.deleteItem(map);
	}

}
