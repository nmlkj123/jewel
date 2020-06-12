<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<body>
<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.NT_NUM }</td>
				<th scope="row">카테고리</th>
				<td>${map.NT_TYPE }</td>
				<th scope="row">작성시간</th>
				<td>${map.NT_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="5">${map.NT_TITLE }</td>
			</tr>
			<tr>
				<td colspan="6">${map.NT_CONTENT }</td>
			</tr>
		</tbody>
	</table>
	<br/>
	<a href="<c:url value='/notice/noticeList'/>" class="btn1" id="list">목록으로</a>
</body>
</html>