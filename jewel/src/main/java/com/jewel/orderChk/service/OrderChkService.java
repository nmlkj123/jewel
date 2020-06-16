package com.jewel.orderChk.service;

import java.util.List;
import java.util.Map;

public interface OrderChkService  {
	public List<Map<String, Object>> selectOrderChkList(Map<String, Object> map) throws Exception;
	public int selectOrderChk(Map<String, Object> map) throws Exception;
	
}
