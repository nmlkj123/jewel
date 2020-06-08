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
		<caption>차단회원 상세</caption>
		<tbody>
			<tr>
				<th scope="row">회원 번호</th>
				<td>${map.MEM_NUM}</td>
				
			</tr>
			<tr>
			<th scope="row">회원 ID</th>
				<td>${map.IG_MEM_ID}</td>
				
				
			</tr>
			<tr>
				<th scope="row">차단 날짜</th>
				<td>${map.IG_DATE}</td>
			</tr>
			<tr>
				<th scope="row">차단사유</th>
				<td><textarea rows="7" cols="40">${map.IG_WHY}</textarea></td>
				
			</tr>
			
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='<c:url value="/adminIgnoreList"/>'" value="목록으로">
	<input type="button" onclick="location.href='<c:url value="/adminIgnoreDelete?MEM_NUM=${map.MEM_NUM}"/>'" value="삭제하기">

	
</body>
</html>