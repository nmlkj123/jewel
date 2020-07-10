package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myOrderDAO")
public class MyOrderDAO extends AbstractDAO {
	
	//나의 주문내역
	public List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) throws Exception{
		return(List<Map<String, Object>>) selectList("myPage.selectMyOrderList", map);
	}
	//나의정보
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception{
		return(Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}
	//나의주문총개수
	public int orderTotalList(Map<String, Object> map) throws Exception{
		return  (Integer) selectOne("myPage.orderTotalList", map);		
	}
	public void deliveryInsert(Map<String, Object> map) throws Exception{
		insert("myPage.deliveryInsert", map);
	}
	//배송상태 내역
	public List<Map<String, Object>> selectDelivery(Map<String, Object> map) throws Exception{
		return(List<Map<String, Object>>) selectList("myPage.selectDelivery", map);
	}
	
	
	

}
