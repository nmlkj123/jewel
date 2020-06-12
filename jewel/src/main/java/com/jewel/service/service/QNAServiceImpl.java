package com.jewel.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.service.dao.QNADAO;

@Service("qnaService")
public class QNAServiceImpl implements QNAService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private QNADAO qnaDAO;
	
	@Override
	public List<Map<String, Object>> selectQNAList(Map<String, Object> map) throws Exception {
		return qnaDAO.selectQNAList(map);
	}

	@Override
	public void insertQNA(Map<String, Object> map) throws Exception {
		qnaDAO.insertQNA(map);	
		
	}

	@Override
	public Map<String, Object> selectConfirm(Map<String, Object> map) throws Exception {
	return qnaDAO.selectConfirm(map);
	}
	
	@Override
	public Map<String, Object> selectQNADetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = qnaDAO.selectQNADetail(map);
		resultMap.put("map", tempMap);
		return resultMap;
	}

	@Override
	public void updateQNA(Map<String, Object> map) throws Exception {
		qnaDAO.updateQNA(map);
		
	}
	
	@Override
	public void qnaDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		qnaDAO.qnaDelete(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) {
		return qnaDAO.getTotalList(map);
	}

}
