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
<div class="container">
<div class="button text-center">
<input type="button" value="공지사항" class="btn4" onClick="location.href='<c:url value='/notice/noticeList'/>';">|	    
<input type="button" value="이벤트" class="btn4" onClick="location.href='<c:url value='/event/eventList'/>';">|	    
<input type="button" value="FAQ"  class="btn4" onClick="location.href='<c:url value='/faq/faqlist'/>';">
	
</div>
	<br/><br/><br/>
	<h3 class="title">공지사항</h3>
<br/><br/>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="*"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">카테고리</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.NT_NUM }</td>
							<td>${row.NT_TYPE }</td>
							<td class="title"><a href="../notice/noticeDetail?NT_NUM=${row.NT_NUM}">${row.NT_TITLE}</a></td>

							<td>${row.NT_DATE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	
		<div align="center"class="container pt-5" id="categoryPaging" >
		${noticeListPaging.pagingHTML}
		</div>
</div>
</body>
</html>