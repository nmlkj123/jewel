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
	<table class="myJJimList">
		<br><br>
		<h5 style="margin-left:10%;">찜한상품</h5>
		<colgroup>
			<col width="40"/>
			<col width="*"/>
	        <col width="20"/>
        </colgroup>
        <br>
        <thead>
        	<tr>
        		<th scope="col">사진</th>
        		<th scope="col">상품명</th>
        		<th scope="col">가격</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${jjimList }" var="items">
        		<tr align="center">
        			<td>${items.ITEM_IMAGE1 }</td>
        			<td><a href="#" onclick="location.href='item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'">
        				${items.ITEM_NAME }</a></td>
        			<td>${items.ITEM_PRICE }</td>    			
        		</tr>       		
        	</c:forEach>        	
        </tbody>
               
	</table>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myJJimListPaging.pagingHTML}
	</div>
	
	
</body>
</html>