package com.jewel.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jewel.service.dao.FaqDAO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="faqDAO")
	private FaqDAO faqDAO;
	
	@Override
	public List<Map<String, Object>> faqlist(Map<String, Object> map) throws Exception {
		return faqDAO.faqlist(map);
		
	}
		
	@Override
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = faqDAO.faqDetail(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	
	@Override
	public int getTotalList(Map<String, Object> map) {
		return faqDAO.getTotalList(map);
	}


	


}
