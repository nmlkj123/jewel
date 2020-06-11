package com.jewel.cartNonMem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO {
	
	//나의 장바구니 리스트
	public List<Map<String, Object>> selectCartList(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>) selectList("cartNonMem.selectCartList", map);
	}

	//나의장바구니개수
	public int cartTotal(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("cartNonMem.cartTotal", map);		
	}
	//장바구니추가
	public void insertCart(Map<String, Object> map) throws Exception {
		update("cartNonMem.insertCart", map);
	}
	
	//장바구니수정
	public void updateCart(Map<String, Object> map) throws Exception {
		update("cartNonMem.updateCart", map);
	}
	//장바구니 삭제
	public void deleteCart(Map<String, Object> map) throws Exception {
		update("cartNonMem.deleteCart", map);
	}

}
