package com.jewel.member.service;

import java.util.Map;

public interface JoinService {

	int selectIdCheck(Map<String, Object> map) throws Exception;

	void insertMember(Map<String, Object> map) throws Exception;

	int selectNickCheck(Map<String, Object> map) throws Exception;

}