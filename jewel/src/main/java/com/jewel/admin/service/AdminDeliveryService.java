package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminDeliveryService {
	List<Map<String,Object>> selectNormalList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectRefundList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectDeliveryDetail(Map<String,Object>map)throws Exception;
	void updateDelivery(Map<String,Object>map)throws Exception;
	void deleteRefund(Map<String,Object>map )throws Exception;
	int normalTotalList(Map<String,Object>map)throws Exception;
	int refundTotalList(Map<String,Object>map)throws Exception;
	Map<String,Object> selectWeek(Map<String,Object>map)throws Exception;
	int selectSaleCnt(String map)throws Exception;
}
