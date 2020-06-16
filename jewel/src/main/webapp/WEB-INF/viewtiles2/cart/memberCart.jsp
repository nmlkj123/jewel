<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/journal/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>장바구니</title>
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
 function numberWithCommas(e) {
	    return e.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
</script>
<style>
.btn-group{
	align:center;
	width:100%;
	
}



</style>
<style>
.qty .count {
    color: #000;
    display: inline-block;
    vertical-align: top;
    font-size: 15px;
    font-weight: 700;
    line-height: 20px;
    padding: 0 2px;
    min-width: 35px;
    font-size: 20px;
    font-weight: 600;
    line-height: 30px;
    padding: 0 2px;
    min-width: 30px;
    text-align: center;
}
.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 20px;
    height: 20px;
    font: 20px/1 Arial,sans-serif;
    width: 22px;
    height: 22px;
    font: 22px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    }
.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: white;
    width: 20px;
    height: 20px;
    font: 20px/1 Arial,sans-serif;
    width: 22px;
    height: 22px;
    font: 22px/1 Arial,sans-serif;
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
input::-webkit-outer-spin-button,
.count::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.count:readonly{
    background-color:white;
}
.price, .sum{
	width:80px;
	font-size:14px;
}
tbody td{
	font-size:14px;
}

</style>

<body>
	<table class="table table-hover" style="width:80%; margin-left:10%;" id="myCart">
		<br><br>
		<h5 style="margin-left:10%;">장바구니</h5>
		<colgroup>
			<col width="5%"/>
			<col width="8%"/>
			<col width="15%"/>
	        <col width="25%"/>
	        <col width="20%"/>
	        <col width="10%"/>
	        <col width="20%"/>
        </colgroup>
        <br>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
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
        
        	<c:forEach items="${myCart }" var="cart" varStatus="status" >       		
        		<tr align="center" id="row">
        			<td>
        				<input type="checkbox" id="checkRow" name="checkRow">
        			</td>
        			<td>
        			 <img src="<c:url value="/images/item/${cart.ITEM_IMAGE1 }"/>" style="width:50px;">
        			</td>
        			<td>${cart.ITEM_NAME }</td>
        			<td>${cart.OP_VALUE }</td>
        			
        			<td>
        				<form id="items">
        				<input type="hidden" value="${cart.OP_VALUE }"  name="OP_VALUE" >      	
        				<input type="hidden" value="${cart.ITEM_OP_PRICE }" name="ITEM_OP_PRICE" >      	
        				<input type="hidden" value="${cart.ITEM_NUM }"  name="ITEM_NUM" >      	
	        			<input type="hidden" value="${cart.CART_NUM }" id="num" name="CART_NUM" >    		
	        			<div class="qty">
             				<span class='minus bg-dark'>-</span>
            				<input type='number' class="count" name="CART_CNT" id="cnt" value="${cart.CART_CNT }" readonly>
							<span class='plus bg-dark'>+</span>
						</div>
						</form>
        			</td>
        			<td>
        			 <input class="price" type="hidden" name="ITEM_OP_PRICE" id="price" class="price" value="${cart.ITEM_OP_PRICE}" readonly>
        			 <fmt:formatNumber value="${cart.ITEM_OP_PRICE}" type="number"/>
        			</td>
        			<td>
				     <c:set var="sum1" value="${cart.CART_CNT * cart.ITEM_OP_PRICE}"/>
        			 <fmt:formatNumber value="${sum1}" type="number" var="sss"/>
        			 <input type="text" id="sum" class="sum" value="${sum1}" readonly>      			 
        			</td>			
        		</tr>      		
        	</c:forEach>	        	
        </tbody>            
	</table>
	
	<br><br>
	<div align="center">
		<button type="button" class="btn btn-primary" onclick="chkAll2();">전체선택</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" id="deleteChk">선택삭제</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="buyItem()">선택주문</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="location.href='<c:url value='/main/main'/>';">메인으로</button>
	</div>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myCartPaging.pagingHTML}
	</div>
	
<script>
$(document).ready(function(){


    $(document).on('click','.plus',function(){
    	$(this).prev('.count').val(parseInt($(this).prev('.count').val()) + 1 );
		
    	var cnt = parseInt($(this).prev('.count').val());
    	var price =parseInt($(this).closest("tr").find('.price').val());
    	var sum = cnt*price;
    	
    	$(this).closest("tr").find('#sum').val(sum);
    	var num = parseInt($(this).parent().siblings("#num").val());
    	
    	$.ajax({
			type: "POST",
			url:"<c:url value='/myPage/myCartUpdate'/>",
			data:{CART_NUM:num, CART_CNT:cnt},
			success: function(data){
				}	
        	});
    	var sum = cnt*price;	
 	});
 	
 	$(document).on('click','.minus',function(){
   		 $(this).next('.count').val(parseInt($(this).next('.count').val()) - 1 );
   		var cnt = parseInt($(this).next('.count').val());
    	var price =parseInt($(this).closest("tr").find('.price').val());
    	var sum = cnt*price;
    	$(this).closest("tr").find('#sum').val(sum);
    
   		 
       	 if ($(this).next('.count').val() == 0) {
          	$(this).next('.count').val(1);
          	cnt = parseInt($(this).next('.count').val());
        	price = parseInt($(this).closest("tr").find('.price').val());
        	sum = cnt*price; 
        	$(this).closest("tr").find('#sum').val(sum);
        	
         	return;
    	 }   
	       	var num = parseInt($(this).parent().siblings("#num").val());
	    	$.ajax({
				type: "POST",
				url:"<c:url value='/myPage/myCartUpdate'/>",
				data:{CART_NUM:num, CART_CNT:cnt},
				success: function(data){
						
					}	
	        });	 
	});

	$(document).on('click','#deleteChk', function(){
 		if($("input:checkbox[name=checkRow]:checked").length == 0){
 			alert("삭제할 대상을 선택하세요.");
 			return false;
 	 	} else if(confirm("선택한 상품을 삭제하시겠습니까?")== true){
 	 		$("input:checkbox[name=checkRow]:checked").each(function(){
 	 	 		
 				var tr = $(this).closest("tr").index();
 				var num = $("#tbody tr").eq(tr).find("#num").val();
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
function buyItem(){

	if($("input:checkbox[name=checkRow]:checked").length == 0){
			alert("상품체크하삼.");
			return false;
 	} else if(confirm("주문할꺼임?")== true){
 		$.ajax({
		      type : "POST",
		      url : '<c:url value="/item/delBuyItemCart"/>',
		      async: false,
		      success : function(data){
		      }
		   }); 
 		$("input:checkbox[name=checkRow]:checked").each(function(){
 			
 			var formOrder=$(this).closest("tr").find("form").serialize();
 			$.ajax({
 				type : "POST",
 				url : "<c:url value='/item/buyItemCart'/>",
 				data : formOrder,
 				async: false,
 				success : function(data){
 					
 					
 				}
 			});
	    });
	    location.href="<c:url value='/item/qmember'/>";
 	        
	}
	
	
}
</script>
		
</body>
</html>