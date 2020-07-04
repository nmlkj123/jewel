package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	List<Map<String,Object>> selectMemberList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectMemberDetail(Map<String,Object>map)throws Exception;
	void ignoreMember(Map<String,Object>map)throws Exception;
	void updateMemberPoint(Map<String,Object>map)throws Exception;
	void insertPoint(Map<String,Object>map)throws Exception;
	void deleteMember(Map<String,Object>map )throws Exception;
	int memberTotalList(Map<String,Object>map)throws Exception;
}
