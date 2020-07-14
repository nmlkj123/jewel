<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lumen/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>나의 배송상태확인</title>
</head>
<style>
table{
	font-size:18px;
}

</style>

<body>
<c:set var="sum" value="0"></c:set>
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<c:forEach items="${myDelivery}" var="items">
        	
        		<c:set var="sum" value="${sum+1}"/>    		
        	</c:forEach>        	
		<br>
		
		<h2 style="margin-left:10%;">주문배송처리내역</h2>
		<br>
		<img src="<c:url value="/images/myPage/결제완료.png"/>" style="margin-left:10%; margin-bottom:3%; width:105px;">
		<c:choose>
			<c:when test="${sum>=2}">
			<img src="<c:url value="/images/myPage/상품준비중t.png"/>" style="margin-left:6%; margin-bottom:3%; width:120px;">
			
			</c:when>
			<c:otherwise>
			<img src="<c:url value="/images/myPage/상품준비중f.png"/>" style="margin-left:6%; margin-bottom:3%; width:120px;">
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${sum>=3}">
			<img src="<c:url value="/images/myPage/배송중t.png"/>" style="margin-left:4%; margin-bottom:3%; width:135px;">
			
			</c:when>
			<c:otherwise>
			<img src="<c:url value="/images/myPage/배송중 f.png"/>" style="margin-left:4%; margin-bottom:3%; width:135px;">
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${sum>=4}">
			<img src="<c:url value="/images/myPage/배송완료t.png"/>" style="margin-left:4%; margin-bottom:3%; width:120px;">
			
			</c:when>
			<c:otherwise>
			<img src="<c:url value="/images/myPage/배송완료f.png"/>" style="margin-left:4%; margin-bottom:3%; width:120px;">
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${sum>=5}">
			<img src="<c:url value="/images/myPage/구매확정t.png"/>" style="margin-left:5%; margin-bottom:3%; width:120px;">
	
			</c:when>
			<c:otherwise>
			<img src="<c:url value="/images/myPage/구매확정f.png"/>" style="margin-left:5%; margin-bottom:3%; width:120px;">
	
			</c:otherwise>
		</c:choose>
		
		
		
		
        <colgroup>
			<col width="20%"/>
			<col width="20%"/>
	        <col width="30%"/>
	        <col width="30%"/>
        </colgroup>
        <thead>	
        	<tr class="table-info" align="center">
        		<th scope="col">주문번호</th>
        		<th scope="col">상품명</th>
        		<th scope="col">배송/처리날짜</th>
        		<th scope="col">배송/처리상태</th>
        		
        	</tr>
        </thead>
        <tbody class="tbody">
        	<c:forEach items="${myDelivery }" var="items">
        		<tr align="center">       			
        			<td>
        				<input type="hidden" value="${items.OR_UNQ}">
        				${items.OR_NUM}
        			</td>
        			<td>${items.ITEM_NAME}</td>
        			<td>${items.DEL_DATE}</td>
        			<td style="color:#ff6980">${items.DEL_DS}</td>    			
        		</tr>
        		  		
        	</c:forEach>        	
        </tbody>
               
	</table>
	<c:out value="${sum}"></c:out>
</body>
</html>