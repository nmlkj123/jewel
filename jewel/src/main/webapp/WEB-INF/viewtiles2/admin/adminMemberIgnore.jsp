<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<form id="frm" name="frm" action="<c:url value='/adminMemberIgnore'/>" method="post">
	<input type="hidden" name="MEM_NUM" value="${map.MEM_NUM}">
	<input type="hidden"  name="MEM_ID" value="${map.MEM_ID}">
		<table class="board_view">
		
			
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
				<th scope="row">차단 사유</th>
				<td><textarea rows="10" cols="40" name="IG_WHY"></textarea></td>
			</tr>
			
		<%-- 	<tr>	
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
			 --%>
		</tbody>
		</table>
	
	<input type="submit" value="회원 차단">
	<input type="button" onclick="location.href='<c:url value="/adminNoticelist"/>'" value="목록으로">
	

	</form>
</body>
</html>