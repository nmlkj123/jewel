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
<div class="container">
<table class="board_view" style="width: 100%;">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.QNA_NUM }</td>
				<th scope="row">카테고리</th>
				<td>${map.QNA_CATE }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>
				<c:choose>
				<c:when test="${map.MEM_ID eq null}">
				${map.QNA_NAME}
				</c:when>
				<c:otherwise>
				${map.MEM_ID}
				</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">작성시간</th>
				<td>${map.QNA_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.QNA_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.QNA_CONTENT }</td>
			</tr>
			
			<tr>
				<th scope="row">관리자답변</th>
				<td colspan="3">${map.QNA_RCONTENT}</td>
			</tr>
		</tbody>
	</table>
	<br/>
	<a href="<c:url value='/item/itemDetail?ITEM_NUM=${map.ITEM_NUM }'/>" class="btn1" id="list">목록으로</a>
	<a href="<c:url value='/qna/qnaUpdateForm?QNA_NUM=${map.QNA_NUM}'/>" class="btn1" id="update">수정하기</a>
	<a href="<c:url value='/qna/qnaDelete?QNA_NUM=${map.QNA_NUM}&ITEM_NUM=${map.ITEM_NUM }'/>" class="btn1" id="update">삭제하기</a>
</div>
</body>
</html>