package com.jewel.myPage.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jewel.common.dao.AbstractDAO;


@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO {

	//회원수정폼
	public Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myPage.selectMyInfoDetail",map);
	}
	//회원수정
	public void updateMyInfo(Map<String, Object> map) throws Exception {
		update("myPage.updateMyInfo",map);
	}
	//회원 탈퇴
	public void myInfoDelete(Map<String, Object> map) throws Exception {
		update("myPage.myInfoDelete",map);
	}

}
