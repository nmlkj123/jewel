package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myCartDAO")
public class MyCartDAO extends AbstractDAO {
	
	//나의 장바구니 리스트
	public List<Map<String, Object>> selectMyCartList(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>) selectList("myPage.selectMyCartList", map);
	}
	//나의정보
	public Map<String, Object> selectMyInfo(Map<String, Object> map) throws Exception{
		return(Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}
	//나의장바구니개수
	public int myCartTotal(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("myPage.myCartTotal", map);		
	}
	//장바구니 수량바꿀때마다 업데이트처리
	public void updateMyCart(Map<String, Object> map) throws Exception {
		update("myPage.updateMyCart", map);
	}
	public void deleteMyCart(Map<String, Object> map) throws Exception {
		update("myPage.deleteMyCart", map);
	}
	//주문페이지 유효성 검사
	public int checkOrderId(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("myPage.checkOrderId", map);
	}

}
