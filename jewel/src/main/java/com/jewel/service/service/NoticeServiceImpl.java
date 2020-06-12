package com.jewel.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.service.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, Object>> SelectNoticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.SelectNoticeList(map);
		
	}
		
	@Override
	public Map<String, Object> NoticeDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = noticeDAO.NoticeDetail(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}
	
	@Override
	public int getTotalList(Map<String, Object> map) {
		return noticeDAO.getTotalList(map);
	}


	


}