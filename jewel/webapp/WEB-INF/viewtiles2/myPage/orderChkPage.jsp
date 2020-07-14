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
<style>
 #exchange, #return, #cancel {
	width:15%;
	margin-left:13%;
}
.buttonBox{
	margin-top:5%;
	margin-left:10%;
	width:80%;
}
</style>

<script type="text/javascript">
 $(document).ready(function(){
	$(document).on('click','#exchange',function(){
		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("교환할 대상을 선택하세요.");
 		 	return false;
 		}else if(confirm("선택한 상품을 교환하시겠습니까?")== true){
 			$("input:checkbox[name=checkRow]:checked").each(function(){
				var tr = $(this).closest("tr").index();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="배송완료"){
					$.ajax({
						type: "POST",
						url:"<c:url value='/orderExchange'/>",
						data:{OR_NUM:num,keyword:"교환신청"},
						success: function(data){
							alert("교환신청되었습니다.");
							location.reload();
						}	
			         });
			     } else {
				     alert("배송완료일때만 신청가능합니다.");
				 }				 	
			});
 		}
	});

	$(document).on('click','#return',function(){
		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("반품할 대상을 선택하세요.");
 		 	return false;
 		}else if(confirm("선택한 상품을 반품하시겠습니까?")== true){
 			$("input:checkbox[name=checkRow]:checked").each(function(){
				var tr = $(this).closest("tr").index();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="배송완료"){
					$.ajax({
						type: "POST",
						url:"<c:url value='/orderReturn'/>",
						data:{OR_NUM:num,keyword:"반품신청"},
						success: function(data){
							alert("반품신청되었습니다.");
							location.reload();
						}	
			         });
			     } else {
				     alert("배송완료일때만 신청가능합니다.");
				 }				 	
			});
 		}
	});	
	$(document).on('click','#cancel',function(){
		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("취소할 대상을 선택하세요.");
 		 	return false;
 		}else if(confirm("선택한 상품을 취소하시겠습니까?")== true){
 			$("input:checkbox[name=checkRow]:checked").each(function(){
				var tr = $(this).closest("tr").index();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="상품준비중" || $("tbody tr").eq(tr).find("#DEL_DS").val()=="배송준비중"){
					$.ajax({
						type: "POST",
						url:"<c:url value='/orderCancel'/>",
						data:{OR_NUM:num,keyword:"취소신청"},
						success: function(data){
							alert("취소신청되었습니다.");
							location.reload();
						}	
			         });
			     } else {
				     alert("\'상품준비중\'이거나 \'배송준비중\'일때만 신청가능합니다.");
				 }				 	
			});
 		}
	});
	

});
</script>

<body>
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h5 style="margin-left:10%;">주문배송조회<h5>
		<br>
		<colgroup>
			<col width="5%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="15%"/>
	        <col width="20%"/>
	        <col width="10%"/>
	        <col width="15%"/>
	        <col width="10%"/>
        </colgroup>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col"></th>
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
        			<td>
        				<input type="checkbox" id="checkRow" name="checkRow">
        			</td>
        			<td>${items.OR_DATE}</td>
        			<td>
        				<img src="<c:url value="/images/item/${items.ITEM_IMAGE1 }"/>" style="width:50px">
        			</td>
        			<td><a href="<c:url value='/item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'/>">
        				${items.ITEM_NAME }</a></td>
        			<!-- 상품명을 클릭하면 상품디테일처리하는 컨트롤러에 상품번호를 보내서 처리한다. -->
        			<td id="price"><fmt:formatNumber value="${items.OR_FP }" type="number"/></td>
        			<td>${items.OR_OP }<br>
        				<p style="font-size:11px;">수량:&nbsp;${items.OR_CNT }개</p>
        			</td>
        			<td>
        				${items.DEL_DS }
        				<input type="hidden" value="${items.DEL_DS}" id="DEL_DS">
        				<input type="hidden" value="${items.OR_NUM}" id="OR_NUM">
        			</td>       			
        		</tr>       		
        	</c:forEach>        	
        </tbody>       
	</table>
	<div class="buttonBox">
		<button type="button" class="btn btn-outline-primary" id="exchange">교환신청</button>
        <button type="button" class="btn btn-outline-primary" id="return">반품신청</button>
        <button type="button" class="btn btn-outline-primary" id="cancel">취소신청</button>
	</div>
	
</body>
</html>