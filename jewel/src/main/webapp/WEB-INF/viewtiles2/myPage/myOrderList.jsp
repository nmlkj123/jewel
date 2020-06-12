<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/viewtiles2/template/myPageHeader.jsp" %>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
</head>
<script type="text/javascript">

</script>
<body>

	<table class="orderList">
	<br><br>
		<h5 style="margin-left:10%;">나의주문내역<h5>
		<colgroup>
			<col width="15%"/>
			<col width="20"/>
	        <col width="*"/>
	        <col width="10%"/>
	        <col width="30%"/>
	        <col width="10%"/>
        </colgroup>
        <br>
        <thead>
        	<tr>
        		<th scope="col">주문일자</th>
        		<th scope="col">사진</th>
        		<th scope="col">상품명</th>
        		<th scope="col">결제금액</th>
        		<th scope="col">주문상세</th>
        		<th scope="col">주문상태</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${myOrder }" var="items">
        		<tr align="center">
        			<td>${items.OR_DATE}</td>
        			<td>
        				<img src="<c:url value="/images/item/${items.ITEM_IMAGE1 }"/>" style="width:50px">
        			</td>
        			<td><a href="#" onclick="location.href='item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'">
        				${items.ITEM_NAME }</a></td>
        			<!-- 상품명을 클릭하면 상품디테일처리하는 컨트롤러에 상품번호를 보내서 처리한다. -->
        			<td>${items.OR_FP }</td>
        			<td>${items.OR_OP }<br>
        				<p style="font-size:11px;">수량:&nbsp;${items.OR_CNT }개</p>
        			</td>
        			<td>${items.DEL_DS }</td>       			
        		</tr>       		
        	</c:forEach>        	
        </tbody>       
	</table>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myOrderListPaging.pagingHTML}
	</div>	
	
</body>
</html>