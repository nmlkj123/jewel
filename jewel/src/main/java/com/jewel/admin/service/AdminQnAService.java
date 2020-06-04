package com.jewel.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminQnAService {
	List<Map<String,Object>> selectQnAList(Map<String,Object>map) throws Exception;
	Map<String,Object> selectQnADetail(Map<String,Object>map)throws Exception;
	void qnaReply(Map<String,Object>map)throws Exception;
	
	void qnaReplyDelete(Map<String,Object>map)throws Exception;
	void deleteQnA(Map<String,Object>map )throws Exception;
}
