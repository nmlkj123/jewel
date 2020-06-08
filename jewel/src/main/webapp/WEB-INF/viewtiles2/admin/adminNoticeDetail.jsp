<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<table>
		<!-- <colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup> -->
		<caption>공지 상세</caption>
		<tbody>
			<tr>
				<th scope="row">공지 번호</th>
				<td>${map.NT_NUM}</td>
			</tr>
			<tr>	
				<th scope="row">공지 유형</th>
				<td>${map.NT_TYPE}</td>
			</tr>
			<tr>	
				<th scope="row">공지사항 등록일</th>
				<td>${map.NT_DATE}</td>
			</tr>
			<tr>
				<th scope="row">공지사항 제목</th>
				<td>${map.NT_TITLE}</td>
				
			</tr>
			<tr>
				<th scope="row">공지사항 내용</th>
				<td>${map.NT_CONTENT}</td>
				
			</tr>
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='<c:url value="/adminNoticeList"/>'" value="목록으로">
	<input type="button" onclick="location.href='<c:url value="/openAdminNoticeUpdate?NT_NUM=${map.NT_NUM}"/>'" value="내용 수정">
	<input type="button" onclick="location.href='<c:url value="/adminNoticeDelete?NT_NUM=${map.NT_NUM}"/>'" value="삭제하기"/>

	
</body>
</html>