package com.jewel.myPage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyOrderDAO;
import com.jewel.myPage.dao.MyjjimDAO;

@Service("myJJimService")
public class MyjjimListServiceImpl implements MyjjimListService {
	
	@Resource(name="myJJimDAO")
	MyjjimDAO myJJimDAO;
	
	@Override
	public List<Map<String, Object>> selectMyjjimList(Map<String, Object> map) throws Exception {
		return myJJimDAO.selectMyjjimList(map);
	}

	@Override
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception {
		return myJJimDAO.selectMyInfo(map);
	}

}
