package com.jewel.myPage.service;


import java.util.List;
import java.util.Map;

public interface MyInfoService {

	Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception;
	void updateMyInfo(Map<String, Object> map) throws Exception;
	void myInfoDelete(Map<String, Object> map) throws Exception;

}

  