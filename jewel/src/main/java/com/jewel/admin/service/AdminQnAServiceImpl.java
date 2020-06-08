package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminQnADAO;


@Service("AdminQnAService")

public class AdminQnAServiceImpl implements AdminQnAService{
	@Resource(name="AdminQnADAO")
	private AdminQnADAO adminQnADAO;
	
	@Override
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnADAO.selectQnAList(map);
	}

	@Override
	public Map<String, Object> selectQnADetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnADAO.selectQnADetail(map);
	}

	@Override
	public void qnaReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminQnADAO.qnaReply(map);
	}

	

	@Override
	public void qnaReplyDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminQnADAO.qnaReplyDelete(map);
	}

	@Override
	public void deleteQnA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminQnADAO.deleteQnA(map);
	}

}
