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
		<caption>회원정보 상세</caption>
		<tbody>
			<tr>
				<th scope="row">회원 번호</th>
				<td>${map.MEM_NUM}</td>
			</tr>
			<tr>	
				<th scope="row">회원 ID</th>
				<td>${map.MEM_ID}</td>
			</tr>
			<tr>	
				<th scope="row">회원 이름</th>
				<td>${map.MEM_NAME}</td>
			</tr>
			<tr>	
				<th scope="row">회원 닉네임</th>
				<td>${map.MEM_NICK}</td>
			</tr>
			<tr>	
				<th scope="row">회원 이메일</th>
				<td>${map.MEM_EMAIL}</td>
			</tr>
			<tr>	
				<th scope="row">회원 연락처</th>
				<td>${map.MEM_PHONE}</td>
			</tr>
			<tr>	
				<th scope="row">회원 주소</th>
				<td>${map.MEM_ADDR1}</td>
			</tr>
			<tr>	
				<th scope="row">상세 주소</th>
				<td>${map.MEM_ADDR2}</td>
			</tr>
			<tr>	
				<th scope="row">회원 등급</th>
				<td>${map.MEM_RANK}</td>
			</tr>
			<tr>	
				<th scope="row">회원 가입일</th>
				<td>${map.MEM_JOINDATE}</td>
			</tr>
			<tr>	
				<th scope="row">회원 포인트</th>
				<td>${map.MEM_POINT}</td>
			</tr>
			<tr>	
				<th scope="row">회원 누적금액</th>
				<td>${map.MEM_STACK}</td>
			</tr>
			
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='<c:url value="/adminMemberList"/>'" value="목록으로">
	<input type="button" onclick="location.href='<c:url value="/openAdminMemberPoint?MEM_NUM=${map.MEM_NUM}"/>'" value="포인트 변경">
	<input type="button" onclick="location.href='<c:url value="/openAdminMemberIgnore?MEM_NUM=${map.MEM_NUM}"/>'" value="회원 차단">
	<input type="button" onclick="location.href='<c:url value="/adminMemberDelete?MEM_NUM=${map.MEM_NUM}"/>'" value="삭제하기"/>

	
</body>
</html>