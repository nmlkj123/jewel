<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/viewtiles2/template/myPageHeader.jsp" %>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
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
#points{
font-size: 12px;
color: gray;
}
</style>
<script>
 function selectDel(unq){
	var url ="/common/myPage/myDelDetail?OR_UNQ="+unq;
	var name="myDelDetail";
	var option= "width=800, height=500, top=100, left=200, location=no";
	window.open(url,name,option);
 }
</script>

<body>
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h5 style="margin-left:10%;">나의주문내역<h5>
		<br>
		<colgroup>
			<col width="4%"/>
			<col width="8%"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="15%"/>
	        <col width="15%"/>
	        <col width="8%"/>
	        <col width="9%"/>
	        <col width="12%"/>
        </colgroup>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col">
        		<input type="checkbox" id="chkAll" onclick="chkAll();"></th>
        		<th scope="col">주문일자</th>
        		<th scope="col">주문번호</th>
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
        			<td>
        				<input type="checkbox" id="checkRow" name="checkRow">
        			</td>
        			<td>${items.OR_DATE}</td>
        			<td>${items.OR_NUM}</td>
        			<td>
        				<img src="<c:url value="/images/item/${items.ITEM_IMAGE1 }"/>" style="width:50px">
        			</td>
        			<td><a href="<c:url value='/item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'/>" style="color:#ff6980; font-weight:550;">
        				${items.ITEM_NAME }</a></td>
        			<!-- 상품명을 클릭하면 상품디테일처리하는 컨트롤러에 상품번호를 보내서 처리한다. -->
        			<td id="price">
        				<fmt:formatNumber value="${items.OR_FP }" type="number"/><br>
        				<c:set var="sum1" value="${items.OR_FP * 0.02}"/>
        				<span id="points">
        				(<fmt:formatNumber value="${sum1}" type="number" />적립)
        				</span>
        			</td>
        			<td>${items.OR_OP }<br>
        				<p style="font-size:11px;">수량:&nbsp;${items.OR_CNT }개</p>
        			</td>
        			<td><a href="#" onclick="selectDel(${items.OR_UNQ})" style="color:#ff6980; font-weight:550;">${items.DEL_DS }</a>
        				<input type="hidden" value="${items.DEL_DS}" id="DEL_DS">
         					<c:if test="${items.DEL_DS == '배송완료'}">
    							<button type="button" class="btn btn-outline-primary" id="confirmPayment" style="padding:0px; font-size:10px; width:80px; height:20px;">구매확정</button>
             				</c:if>
             				<c:if test="${items.DEL_DS == '구매확정'}">
             					<button type="button" class="btn btn-outline-primary" id="reviewBtn" style="padding:0px; font-size:10px; width:80px; height:20px;">리뷰작성</button>
             				</c:if>
        				<input type="hidden" value="${items.OR_UNQ}" id="OR_UNQ">
        				<input type="hidden" value="${items.OR_FP}" id="OR_FP">
        				<input type="hidden" value="${items.OR_NUM}" id="OR_NUM">
        				<input type="hidden" value="${sum1 }" id="point">
        				<input type='hidden' name='PLUS_POINT' value='"+parseInt(items.CART_CNT*items.ITEM_OP_PRICE)*0.02+"'>
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
	
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myOrderListPaging.pagingHTML}
	</div>
	
<script type="text/javascript">
 $(document).ready(function(){
	$(document).on('click','#exchange',function(){
		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("교환할 대상을 선택하세요.");
 		 	return false;
 		}else if(confirm("선택한 상품을 교환하시겠습니까?")== true){
 			$("input:checkbox[name=checkRow]:checked").each(function(){
				var tr = $(this).closest("tr").index();
				var unq = $("tbody tr").eq(tr).find("#OR_UNQ").val();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="배송완료"){
					$.ajax({
						type: "POST",
						url:"<c:url value='/myPage/myOrderExchange'/>",
						data:{OR_UNQ:unq,OR_NUM:num,keyword:"교환신청"},
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
				var unq = $("tbody tr").eq(tr).find("#OR_UNQ").val();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="배송완료"){
					$.ajax({
						type: "POST",
						url:"<c:url value='/myPage/myOrderReturn'/>",
						data:{OR_UNQ:unq,OR_NUM:num,keyword:"반품신청"},
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
				var unq = $("tbody tr").eq(tr).find("#OR_UNQ").val();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="상품준비중"){
					alert("굳");	
					$.ajax({
						type: "POST",
						url:"<c:url value='/myPage/myOrderCancel'/>",
						data:{OR_UNQ:unq,OR_NUM:num,keyword:"취소신청"},
						success: function(data){
							alert("취소신청되었습니다.");
							location.reload();
						}	
			         });
			     } else {
				     alert("\'상품준비중\'일때만 신청가능합니다.");
				 }				 	
			});
 		}
	});

	
	$(document).on('click','#confirmPayment',function(){
		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("구매확정할 대상을 선택하세요.");
 		 	return false;
 		}else if(confirm("선택한 상품을 구매확정하시겠습니까?")== true){
 			$("input:checkbox[name=checkRow]:checked").each(function(){
				var tr = $(this).closest("tr").index();
				var unq = $("tbody tr").eq(tr).find("#OR_UNQ").val();
				var num = $("tbody tr").eq(tr).find("#OR_NUM").val();
				var price = $("tbody tr").eq(tr).find("#OR_FP").val();
				var point= $("tbody tr").eq(tr).find("#point").val();
				point = (Math.floor(point));
				alert(point);
				
				if($("tbody tr").eq(tr).find("#DEL_DS").val()=="배송완료"){
					$.ajax({
						type: "POST",
						url:"<c:url value='/myPage/myOrderConfirm'/>",
						data:{OR_UNQ:unq,OR_NUM:num,keyword:"구매확정"},
						success: function(data){
							alert("구매확정 되었습니다.");
							location.reload();
							
						}	
			         });
			     } else {
				     alert("\'배송완료\'일때만 신청가능합니다.");
				 }				 	
			});
 		}
	});

});
 

 function chkAll(){
	 if( $("#chkAll").is(':checked') ){
	     $("input[name=checkRow]").prop("checked", true);
	 }else{
	     $("input[name=checkRow]").prop("checked", false);
	 }	 	 
 }
 function chkAll2(){
	     $("input[name=checkRow]").prop("checked", true);
 } 
 
</script>	
</body>
</html>