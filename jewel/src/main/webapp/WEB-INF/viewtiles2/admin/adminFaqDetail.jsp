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
		<caption>FAQ 상세</caption>
		<tbody>
			<tr>
				<th scope="row">FAQ 번호</th>
				<td>${map.FAQ_NUM}</td>
			</tr>
			<tr>	
				<th scope="row">카테고리 종류</th>
				<td>${map.FAQ_CATE}</td>
			</tr>
			<tr>	
				<th scope="row">FAQ 제목</th>
				<td>${map.FAQ_TITLE}</td>
			</tr>
			<tr>
				<th scope="row">FAQ 내용</th>
				<td>${map.FAQ_CONTENT}</td>
				
			</tr>
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='<c:url value="/adminFaqList"/>'" value="목록으로">
	<input type="button" onclick="location.href='<c:url value="/openAdminFaqUpdate?FAQ_NUM=${map.FAQ_NUM}"/>'" value="내용 수정">
	<input type="button" onclick="location.href='<c:url value="/adminFaqDelete?FAQ_NUM=${map.FAQ_NUM}"/>'" value="삭제하기"/>

	
</body>
</html>