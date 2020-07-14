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
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h5 style="margin-left:10%;">찜한상품</h5>
        <br>
        <colgroup>
			<col width="20"/>
			<col width="40"/>
	        <col width="20"/>
	        <col width="20"/>
        </colgroup>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col">사진</th>
        		<th scope="col">상품명</th>
        		<th scope="col">가격</th>
        		<th scope="col"></th>
        	</tr>
        </thead>
        <tbody id="tbody">
        	<c:forEach items="${jjimList }" var="items">
        		<tr align="center">
        			<td>
        			 <img src="<c:url value="/images/item/${items.ITEM_IMAGE1 }"/>" style="width:70px">
        			</td>
        			<td><a href="<c:url value='/item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'/>">
        				${items.ITEM_NAME }</a></td>
        			<td><fmt:formatNumber value="${items.ITEM_PRICE }" type="number"/></td>
        			<td>
        				<input type="hidden" value="${items.JJIM_NUM}" id="JJIM_NUM">
        				<button type="button" class="btn btn-outline-primary" id="JJimNum">삭제</button>
					</td>    			
        		</tr>       		
        	</c:forEach>        	
        </tbody>
               
	</table>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myJJimListPaging.pagingHTML}
	</div>
	
<script type="text/javascript">
 $(document).ready(function(){
	$(document).on('click','#JJimNum',function(){
		var tr = $(this).closest("tr").index();
		var num = $("#tbody tr").eq(tr).find("#JJIM_NUM").val();
		
		$.ajax({
			type: "POST",
			url:"<c:url value='/myPage/myJJimDelete'/>",
			data:{JJIM_NUM:num},
			success: function(data){
				$("#tbody tr").eq(tr).remove();
			}	
        });
				
	});

});
</script>
	
</body>
</html>