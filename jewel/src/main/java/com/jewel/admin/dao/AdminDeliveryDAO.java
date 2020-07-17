package com.jewel.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;
@Repository("AdminDeliveryDAO")
public class AdminDeliveryDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNormalList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectNormalList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRefundList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectRefundList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDeliveryDetail(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectDeliveryDetail",map);
		
	}
	public void updateDelivery(Map<String, Object> map) throws Exception{
		update("admin.updateDelivery", map);
	}
	
	public void deleteRefund(Map<String, Object> map) throws Exception{
		update("admin.deleteRefund", map);
	}
	public int normalTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.normalTotalList", map);
	}
	public int refundTotalList(Map<String, Object> map)throws Exception{
		return (Integer) selectOne("admin.refundTotalList", map);
	}
	public Map<String, Object> selectWeek(Map<String,Object>map)throws Exception{
	
		return (Map<String,Object>) selectOne("admin.selectWeek",map);
		
	}
	public int selectSaleCnt(String map)throws Exception{
		return (Integer) selectOne("admin.selectSaleCnt", map);
	}
}
