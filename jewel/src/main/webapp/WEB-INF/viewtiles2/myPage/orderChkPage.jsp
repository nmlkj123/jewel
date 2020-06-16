<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/journal/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문배송조회</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	
	
});
</script>
<body>
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h5 style="margin-left:10%;">주문배송조회<h5>
		<br>
		<colgroup>
			<col width="15%"/>
			<col width="10%"/>
			<col width="25%"/>
	        <col width="10%"/>
	        <col width="25%"/>
	        <col width="15%"/>
        </colgroup>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col">주문일자</th>
        		<th scope="col">사진</th>
        		<th scope="col">상품명</th>
        		<th scope="col">결제금액</th>
        		<th scope="col">주문상세</th>
        		<th scope="col">주문상태</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${map }" var="items">
        		<tr align="center">
        			<td>${items.OR_DATE}</td>
        			<td>
        				<img src="<c:url value="/images/item/${items.ITEM_IMAGE1 }"/>" style="width:50px">
        			</td>
        			<td><a href="<c:url value='/item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'/>">
        				${items.ITEM_NAME }</a></td>
        			<!-- 상품명을 클릭하면 상품디테일처리하는 컨트롤러에 상품번호를 보내서 처리한다. -->
        			<td><fmt:formatNumber value="${items.OR_FP }" type="number"/></td>
        			<td>${items.OR_OP }<br>
        				<p style="font-size:11px;">수량:&nbsp;${items.OR_CNT }개</p>
        			</td>
        			<td>${items.DEL_DS }</td>       			
        		</tr>       		
        	</c:forEach>        	
        </tbody>       
	</table>
	
	
</body>
</html>