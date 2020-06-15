package com.jewel.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.service.dao.EventDAO;

@Service("eventService")
public class EventServiceImpl implements EventService {

Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="eventDAO")
	private EventDAO eventDAO;
	
	@Override
	public List<Map<String, Object>> SelectEventList(Map<String, Object> map) throws Exception {
		return eventDAO.SelectEventList(map);
		
	}
		
	@Override
	public Map<String, Object> EventDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = eventDAO.EventDetail(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}
	
	@Override
	public int getTotalList(Map<String, Object> map) {
		return eventDAO.getTotalList(map);
	}


	


}