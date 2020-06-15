package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myJJimDAO")
public class MyjjimDAO extends AbstractDAO {
	public List<Map<String, Object>> selectMyjjimList(Map<String, Object> map) {
		return(List<Map<String, Object>>) selectList("myPage.selectMyjjimList", map);
	}

	public Map<String, Object> selectMyInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}
	
	//나의 총찜개수
	public int myJJimTotalList(Map<String, Object> map) {
		return (Integer) selectOne("myPage.myJJimTotalList", map);
	}
	
	public void deleteMyJJim(Map<String, Object> map) throws Exception {
		update("myPage.deleteMyJJim", map);
	}
	public int addJjim(Map<String,Object> map) {
		return (Integer)insert("myPage.addJjim",map);
	}
	public int findJjim(Map<String,Object> map) {
		return (Integer)selectOne("myPage.findJjim", map);
	}
	
}
