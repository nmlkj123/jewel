package com.jewel.member.service;

import java.util.Map;

public interface JoinService {

	int selectIdCheck(String id) throws Exception;

	void insertMember(Map<String, Object> map) throws Exception;

	int selectNickCheck(String nick) throws Exception;
	


}