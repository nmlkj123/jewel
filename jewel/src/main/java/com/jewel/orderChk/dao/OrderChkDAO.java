package com.jewel.orderChk.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("orderChkDAO")
public class OrderChkDAO extends AbstractDAO {
	//비회원 주문베송조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderChkList(Map<String, Object> map) throws Exception {
		return(List<Map<String, Object>>) selectList("orderChk.selectOrderChkList", map);
	}
	
	public int selectOrderChk(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("orderChk.selectOrderChk",map);
	}
}
