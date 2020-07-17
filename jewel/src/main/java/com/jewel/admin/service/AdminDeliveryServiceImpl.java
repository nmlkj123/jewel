package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jewel.admin.dao.AdminDeliveryDAO;
import com.jewel.admin.dao.AdminEventDAO;
@Service("AdminDeliveryService")
public class AdminDeliveryServiceImpl implements AdminDeliveryService{
	@Resource(name="AdminDeliveryDAO")
	AdminDeliveryDAO AdminDeliveryDAO;
	@Override
	public List<Map<String, Object>> selectNormalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.selectNormalList(map);
	}

	@Override
	public List<Map<String, Object>> selectRefundList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.selectRefundList(map);
	}

	@Override
	public void updateDelivery(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminDeliveryDAO.updateDelivery(map);
	}

	@Override
	public void deleteRefund(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		AdminDeliveryDAO.deleteRefund(map);
	}

	@Override
	public int normalTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.normalTotalList(map);
	}

	@Override
	public int refundTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.refundTotalList(map);
	}

	@Override
	public Map<String, Object> selectDeliveryDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.selectDeliveryDetail(map);
	}

	@Override
	public Map<String, Object> selectWeek(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.selectWeek(map);
	}

	@Override
	public int selectSaleCnt(String  map) throws Exception {
		// TODO Auto-generated method stub
		return AdminDeliveryDAO.selectSaleCnt(map);
	}

}
