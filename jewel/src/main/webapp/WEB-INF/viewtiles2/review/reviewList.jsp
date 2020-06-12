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

<script>

$.fn.generateStars = function() {
    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};


// 숫자 평점을 별로 변환하도록 호출하는 함수
$(function() {

	$('.star-prototype').generateStars();
});


</script>
<body>
	<h2>Review</h2>

	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">평점</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.RE_NUM }</td>
							<td class="title">
							<a href="<c:url value='/review/reviewDetail?ITEM_NUM=${row.ITEM_NUM}&RE_NUM=${row.RE_NUM}'/>"
							 id="write">${row.RE_TITLE }</a>
							<input type="hidden" id="ITEM_NUM" value="${row.ITEM_NUM }">
							</td>
							<td>${row.MEM_ID}</td>
							<td>${row.RE_HIT}</td>
							<td><span class="star-prototype">${row.RE_LIKE}</span></td>
							<td>${row.RE_DATE }</td>
					
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
	
	<a href="<c:url value='/review/reviewWriteForm?ITEM_NUM=${list.get(0).ITEM_NUM}&MEM_NUM=${MEM_NUM}'/>" class="btn1" id="write">글쓰기</a>
	
	<div align="center"class="container pt-5" id="categoryPaging" >
		${reviewListPaging.pagingHTML}
		</div>

</body>

</html>