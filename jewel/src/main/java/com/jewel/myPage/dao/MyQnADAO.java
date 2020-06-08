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
	public int myQnATotalList(Map<String, Object> map) {
		return (Integer) selectOne("myPage.myQnATotalList", map);
	}
	
	//나의 QNA 상세정보
	public Map<String, Object> selectMyQnADetail(Map<String, Object> map){
		return(Map<String, Object>) selectOne("myPage.selectMyQnADetail", map);
	}
	//나의 QNA 수정폼
	public Map<String, Object> selectMyQnAModifyForm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("myPage.selectMyQnADetail", map);
	}
	
	//수정
	public void updateMyQnA(Map<String, Object> map) throws Exception {
		update("myPage.updateMyQnA", map);
	}
	
	//삭제
	public void deleteMyQnA(Map<String, Object> map) throws Exception{
		update("myPage.deleteMyQnA", map);
	}


}
