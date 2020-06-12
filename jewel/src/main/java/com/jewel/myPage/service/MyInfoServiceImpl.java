package com.jewel.myPage.service;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.myPage.dao.MyInfoDAO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="myInfoDAO")
	private MyInfoDAO myInfoDAO;
	
	@Override
	public Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception {
	return myInfoDAO.selectMyInfoDetail(map);
	}
	
	@Override
	public void updateMyInfo(Map<String, Object> map) throws Exception {
		myInfoDAO.updateMyInfo(map);
		
	}
	@Override
	public void myInfoDelete(Map<String, Object> map) throws Exception {
		myInfoDAO.myInfoDelete(map);
	}
		
}  