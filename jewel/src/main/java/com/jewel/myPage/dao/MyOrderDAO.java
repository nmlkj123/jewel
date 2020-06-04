package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myOrderDAO")
public class MyOrderDAO extends AbstractDAO {
	
	//나의 주문내역
	public List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) {
		return(List<Map<String, Object>>) selectList("myPage.selectMyOrderList", map);
	}
	//나의정보
	public Map<String, Object> selectMyInfo(Map<String, Object> map){
		return(Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}

}
