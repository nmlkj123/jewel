package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyQnADAO;

@Service("myQnAService")
public class MyQnAServiceImpl implements MyQnAService {
	@Resource(name="myQnADAO")
	private MyQnADAO myQnADAO;
	
	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception {
		return myQnADAO.selectMyInfo(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMyQnAList(Map<String, Object> map) throws Exception {
		return myQnADAO.selectMyQnAList(map);
	}
	
	@Override
	public Map<String, Object> selectMyQnADetail(Map<String, Object> map) throws Exception {
		return myQnADAO.selectMyQnADetail(map);
	}
	

}
