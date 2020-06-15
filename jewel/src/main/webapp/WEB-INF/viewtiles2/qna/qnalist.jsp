<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA</title>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<div class="button">
<input type="button" value="공지사항" class="btn4" onClick="location.href='<c:url value='/event/eventList'/>';">	    
<input type="button" value="이벤트" class="btn4" onClick="location.href='<c:url value='/faq/faqlist'/>';">	    
	<input type="button" value="QnA" class="btn4" onClick="location.href='<c:url value='/qna/qnalist'/>';">	    
	<input type="button" value="FAQ"  class="btn4" onClick="location.href='<c:url value='/notice/noticeList'/>';">
	
</div>    

<br/><br/><br/><br/>
	<h2>QNA</h2>

	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">답변확인</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.QNA_NUM }</td>
							<td><c:choose>
							<c:when test="${row.ITEM_NUM eq null}">
							
							</c:when>
							<c:otherwise>
							${row.ITEM_NUM}
							</c:otherwise>
							</c:choose>
							</td>
							<td class="title">
							<a href="../qna/qnaPwConfirmForm?QNA_NUM=${row.QNA_NUM}">[${row.QNA_CATE}]${row.QNA_TITLE }</a>		
							<input type="hidden" id="FAQ_NUM" value="${row.FAQ_NUM }">
							</td>
							
							<td><c:choose>
							<c:when test="${row.MEM_ID eq null}">
							${row.QNA_NAME}
							</c:when>
							<c:otherwise>
							${row.MEM_ID}
							</c:otherwise>
							</c:choose>
							</td>
							<td>${row.QNA_DATE }</td>
							<td>${row.QNA_RSTATE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	
	
	<a href="<c:url value='/qna/qnaWriteForm'/>" class="btn1" id="write">글쓰기</a>
	
		<div align="center"class="container pt-5" id="categoryPaging" >
		${qnaListPaging.pagingHTML}
		</div>
</body>
</html>