<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>faq</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
	
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.FAQ_NUM}</td>
				<th scope="row">카테고리</th>
				<td>${map.FAQ_CATE}</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.FAQ_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.FAQ_CONTENT }</td>
			</tr>
			
		</tbody>
	</table>
	<br/>
	
	
	<a href="<c:url value='/faq/faqlist?'/>" class="btn1" id="list">목록으로</a>
	
</body>
</html>