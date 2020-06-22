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
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h2 style="margin-left:10%;">주문배송처리내역</h2>
        <br>
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
	
</body>
</html>