package com.jewel.myPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;

@Repository("myQnADAO")
public class MyQnADAO extends AbstractDAO {
	
	//나의정보
	public Map<String, Object> selectMyInfo(Map<String, Object> map){
		return(Map<String, Object>) selectOne("myPage.selectMyInfo", map);
	}
	
	//나의 QNA
	public List<Map<String, Object>> selectMyQnAList(Map<String, Object> map){
		return(List<Map<String, Object>>) selectList("myPage.selectMyQnAList", map);
	}
	//나의 QNA 상세정보
	public Map<String, Object> selectMyQnADetail(Map<String, Object> map){
		return(Map<String, Object>) selectOne("myPage.selectMyQnADetail", map);
	}

}
