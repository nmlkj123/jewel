<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/viewtiles2/template/myPageHeader.jsp" %>
<meta charset="UTF-8">
<title>회원장바구니</title>
</head>
<script type="text/javascript">
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
<style>
.qty .count {
    color: #000;
    display: inline-block;
    vertical-align: top;
    font-size: 25px;
    font-weight: 700;
    line-height: 30px;
    padding: 0 2px
    ;min-width: 35px;
    text-align: center;
}
.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 30px;
    height: 30px;
    font: 30px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    }
.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 30px;
    height: 30px;
    font: 30px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    background-clip: padding-box;
}

.minus:hover{
    background-color: #717fe0 !important;
}
.plus:hover{
    background-color: #717fe0 !important;
}
/*Prevent text selection*/

.count{  
    border: 0;
    width: 2%;
}
nput::-webkit-outer-spin-button,
.count::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.count:disabled{
    background-color:white;
}
.myCart .price, .sum{
	width:80px;
}


</style>

<body>
	<table class="myCart" id="myCart">
		<br><br>
		<h5 style="margin-left:10%;">회원장바구니</h5>
		<colgroup>
			<col width="30"/>
			<col width="15"/>
			<col width="25"/>
	        <col width="10"/>
	        <col width="60"/>
	        <col width="20"/>
	        <col width="20"/>
        </colgroup>
        <br>
        <thead>
        	<tr>
        		<th scope="col" style="font-size:10px;">
        		 <input type="checkbox" id="chkAll" onclick="chkAll();">
        		</th>
        		<th scope="col">사진</th>
        		<th scope="col">상품명</th>
        		<th scope="col">옵션</th>
        		<th scope="col">수량</th>       		
        		<th scope="col">가격</th>
        		<th scope="col">합계</th>
        	</tr>
        </thead>
        <tbody id="tbody">
        	<c:forEach items="${myCart }" var="cart">
        		<c:set var="sum1" value="${cart.CART_CNT * cart.ITEM_OP_PRICE}"/>
        		<tr align="center" id="row">
        			<td>
        				<input type="checkbox" id="checkRow" name="checkRow">
        			</td>
        			<td>
        			 <img src="<c:url value="/images/item/${cart.ITEM_IMAGE1 }"/>" style="width:50px">
        			</td>
        			<td>${cart.ITEM_NAME }</td>
        			<td>${cart.OP_VALUE }</td>
        			<td>
	        			<input type="hidden" value="${cart.CART_NUM }" id="num" name="CART_NUM" >      			
	        			<div class="qty">
             				<span class='minus bg-dark'>-</span>
            				<input type='number' class='count' name='CART_CNT' id="cnt" value='${cart.CART_CNT }' disabled>
							<span class='plus bg-dark'>+</span>
						</div>
        			</td>
        			<td>
        			 <input class="price" type="text" name="ITEM_OP_PRICE" id="price" class="price" value="${cart.ITEM_OP_PRICE}" readonly>
        			</td>
        			<td>
        			 <input type="text" id="sum" class="sum" value="<c:out value="${sum1}"/>">
        			</td>			
        		</tr>      		
        	</c:forEach>	        	
        </tbody>            
	</table>
	
	<br><br>
	<div align="center">
		<button type="button" class="btn btn-danger" onclick="chkAll2();">전체선택</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-danger" id="deleteChk">선택삭제</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-danger">선택주문</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-danger">메인으로</button>
	</div>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myCartPaging.pagingHTML}
	</div>
	
<script>
$(document).ready(function(){

	$('.count').prop('disabled', true);
    $(document).on('click','.plus',function(){
    	$(this).prev('.count').val(parseInt($(this).prev('.count').val()) + 1 );
    	var cnt = parseInt($(this).prev('.count').val());
    	var price =parseInt($(this).parent().parent().parent().find('.price').val());
    	var sum = cnt*price; 
    	$(this).parent().parent().parent().find('#sum').val(sum);
    	var num = parseInt($(this).parent().siblings("#num").val());
    	$.ajax({
			type: "POST",
			url:"<c:url value='/myPage/myCartUpdate'/>",
			data:{CART_NUM:num, CART_CNT:cnt},
			success: function(data){
					alert("굳");
				}	
        	});
        	
 	});
 	
 	$(document).on('click','.minus',function(){
   		 $(this).next('.count').val(parseInt($(this).next('.count').val()) - 1 );
   		 var cnt = parseInt($(this).next('.count').val());
    	 var price =parseInt($(this).parent().parent().parent().find('.price').val());
    	 var sum = cnt*price; 
    	 $(this).parent().parent().parent().find('#sum').val(sum);
    	 var num = parseInt($(this).parent().siblings("#num").val());
    	 		 
       	 if ($(this).next('.count').val() == 0) {
          	$(this).next('.count').val(1);
          	cnt = parseInt($(this).next('.count').val());
        	price = parseInt($(this).parent().parent().parent().find('.price').val());
        	sum = cnt*price; 
        	$(this).parent().parent().parent().find('#sum').val(sum);
        	
         	return;
    	 }
       	 $.ajax({
			type: "POST",
			url:"<c:url value='/myPage/myCartUpdate'/>",
			data:{CART_NUM:num, CART_CNT:cnt},
			success: function(data){
					alert("굳");
				}	
         });   	 
	});

	$(document).on('click','#deleteChk', function(){
 		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("삭제할 대상을 선택하세요.");
 			return false;
 	 	} else if(confirm("선택한 상품을 삭제하시겠습니까?")== true){
 	 		$("input:checkbox[name=checkRow]:checked").each(function(){
 				var tr = $(this).parent().parent().index();
 				var num = $("#tbody tr").eq(tr).find("#num").val();
 				alert(num);
 				  $.ajax({
 	 				type: "POST",
 	 				url:"<c:url value='/myPage/myCartDelete'/>",
 	 				data:{CART_NUM:num},
 	 				success: function(data){
 	 						location.reload();
 	 				}	
 	 	        }); 
 	 	        
 	 		});
 	 	}
 	});
 	
 		
});

</script>
		
</body>
</html>