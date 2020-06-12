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
	<h2>FAQ</h2>
	<input type="button" value="전체" class="btn3" onClick="location.href='<c:url value='/faq/faqlist'/>';">	    
<input type="button" value="상품관련" class="btn3" onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=goods'/>';">	    
<input type="button" value="문의관련" class="btn3" onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=inquire'/>';">	    
<input type="button" value="교환/반품관련" class="btn3" onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=change'/>';">    
<input type="button" value="배송/환불관련" class="btn3" onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=delivery'/>';">	    
<input type="button" value="포인트관련" class="btn3" onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=point'/>';">	    
	    
	<br><br><br>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="*"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
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
							<td>${row.FAQ_NUM }</td>
							<td>
							<input type="hidden" id="FAQ_CATE" name="FAQ_CATE">${row.FAQ_CATE}</td>
							<td class="title">
								<a href="../faq/faqDetail?FAQ_NUM=${row.FAQ_NUM}">${row.FAQ_TITLE}</a>
								<input type="hidden" id="FAQ_NUM" value="${row.FAQ_NUM }">
							</td>
							
							<td>${row.FAQ_DATE }</td>
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
	<div align="center"class="container pt-5" id="categoryPaging" >
		${faqListPaging.pagingHTML}
		</div>
	</form>
	<br/>

</body>
</html>