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
		<caption>이벤트 상세</caption>
		<tbody>
			<tr>
				<th scope="row">이벤트 번호</th>
				<td>${map.ET_NUM}</td>
			</tr>
			
			<tr>	
				<th scope="row">이벤트 시작일</th>
				<td>${map.ET_SD}</td>
				<th scope="row">이벤트 종료일</th>
				<td>${map.ET_FD}</td>
			</tr>
			
			<tr>	
				<th scope="row">이벤트 제목</th>
				<td>${map.ET_TITLE}</td>
			</tr>
			<tr>
				<th scope="row">이벤트 내용</th>
				<td><textarea rows="7" cols="40" readonly>${map.ET_CONTENT}</textarea> </td>
				
			</tr>
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='<c:url value="/adminEventList"/>'" value="목록으로">
	<input type="button" onclick="location.href='<c:url value="/openAdminEventUpdate?ET_NUM=${map.ET_NUM}"/>'" value="내용 수정">
	<input type="button" onclick="location.href='<c:url value="/adminEventDelete?ET_NUM=${map.ET_NUM}"/>'" value="삭제하기"/>

	
</body>
</html>