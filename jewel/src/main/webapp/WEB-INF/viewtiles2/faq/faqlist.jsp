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

<div class="button">
<input type="button" value="공지사항" class="btn4" onClick="location.href='<c:url value='/notice/noticeList'/>';">|	    
<input type="button" value="이벤트" class="btn4" onClick="location.href='<c:url value='/event/eventList'/>';">|   	    
<input type="button" value="FAQ"  class="btn4" onClick="location.href='<c:url value='/faq/faqlist'/>';">
	
</div>
<br><br><br>
	<h3 class="title">FAQ</h3>
	<br><br>
	<table class="catelist">
<tr>

<td><input type="button" value="전체" class="btn btn-block btn-outline-primary"  onClick="location.href='<c:url value='/faq/faqlist'/>';"></td>	    
<td><input type="button" value="상품관련" class="btn btn-block btn-outline-primary"  onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=goods'/>';"></td>		    
<td><input type="button" value="문의관련" class="btn btn-block btn-outline-primary"  onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=inquire'/>';"></td>		    
<td><input type="button" value="교환/반품관련" class="btn btn-block btn-outline-primary"  onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=change'/>';"></td>	    
<td><input type="button" value="배송/환불관련" class="btn btn-block btn-outline-primary"  onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=delivery'/>';"></td>		    
<td><input type="button" value="포인트관련" class="btn btn-block btn-outline-primary"  onClick="location.href='<c:url value='/faq/faqlist?FAQ_CATE=point'/>';"></td>		    
	  </tr>
	   </table> 
	<br/><br/>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="40"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">카테고리</th>
				<th scope="col">제목</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.FAQ_NUM }</td>
							<td>	
							<c:choose>
							<c:when test="${row.FAQ_CATE eq 'goods'}">
							상품
							</c:when>
							
							
							<c:when test="${row.FAQ_CATE eq 'change'}">
							교환/반품
							</c:when>
						
							
							<c:when test="${row.FAQ_CATE == 'inquire'}">
							문의
							</c:when>
							
						
							<c:when test="${row.FAQ_CATE eq 'point'}">
							포인트
							</c:when>
							<c:otherwise>
        					    배달
       						  </c:otherwise>
							</c:choose>
							</td>
							
							<td class="title">
								<a href="../faq/faqDetail?FAQ_NUM=${row.FAQ_NUM}">${row.FAQ_TITLE}</a>
								<input type="hidden" id="FAQ_NUM" value="${row.FAQ_NUM }">
							</td>
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