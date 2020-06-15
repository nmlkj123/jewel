<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<script type="text/javascript">

function fsubmit(){
	var form = $('#frm')[0];
	 var formData = new FormData(form);
	 var inum=$('#ITEM_NUM').val();
	 
	 
	var ITEM_TYPE = document.getElementById("ITEM_TYPE").value;
	var ITEM_NAME = document.getElementById("ITEM_NAME").value;
	var ITEM_PRICE = document.getElementById("ITEM_PRICE").value;
	var ITEM_DCP = document.getElementById("ITEM_DCP").value;
	var ITEM_IMAGE1 = document.getElementById("ITEM_IMAGE1").value;
	var ITEM_IMAGE2 = document.getElementById("ITEM_IMAGE2").value;
	var ITEM_STOCK = document.getElementById("ITEM_STOCK").value;
	
	
	if(ITEM_TYPE==null || ITEM_TYPE==''){
		alert("카테고리 종류를 입력하세요.");
		return false;
	}
	if(ITEM_NAME==null || ITEM_NAME==''){
		alert("상품 이름을 입력하세요.");
		return false;
	}
	if(ITEM_PRICE==null || ITEM_PRICE==''){
		alert("상품 가격을 입력하세요.");
		return false;
	}
	if(ITEM_DCP==null || ITEM_DCP==''){
		alert("할인율을 입력하세요.");
		return false;
	}
	if(ITEM_IMAGE1==null || ITEM_IMAGE1==''){
		alert("사진1 을 입력하세요.");
		return false;
	}
	if(ITEM_IMAGE2==null || ITEM_IMAGE2==''){
		alert("사진1 을 입력하세요.");
		return false;
	}
	if(ITEM_STOCK ==null || ITEM_STOCK ==''){
		alert("재고를 입력하세요.");
		return false;
	}
	$.ajax({
	      type : "POST",
	      enctype: 'multipart/form-data',
	      url : '<c:url value="/adminItemUpdate"/>',
	      data:formData,
	      processData: false,
        contentType: false,
        async: false,
	      success : function(data){
	    	
	      }
	      });
	
	
	var count=$('#opt >tbody tr').length
	alert(count);
	for(var i=0;i<count;i++){
		var OPt=$('#opt >tbody tr').eq(i).find('#OP_TYPE').val();
		var OPv=$('#opt >tbody tr').eq(i).find('#OP_VALUE').val();
		var	OPp=$('#opt >tbody tr').eq(i).find('#OP_PRICE').val();
		
		$.ajax({
		      type : "POST",
		      url : '<c:url value="/insertOption"/>',
		      async: false,
		      data : {ITEM_NUM:inum,OP_TYPE:OPt,OP_VALUE:OPv,OP_PRICE:OPp}, 
		      success : function(data){
		    	 
		    	  
		      }
		      })
	}
	alert("수정완료");
	location.href = "/common/adminItemList";
	
}





$(document).ready(function(){
	
	$.ajax({
		type : "POST",
		url : '<c:url value="/selectOptionList"/>',
		data : "ITEM_NUM="+$('#ITEM_NUM').val(),
		async: false,
		success : function(data){
			
			
			$.each(data.list,function(index,items){
				
				var str = '<tr>	<td><input type="text" id="OP_TYPE" name="OP_TYPE" value="'+items.OP_TYPE+'"></td><td>	<input type="text" id="OP_VALUE" name="OP_VALUE" value="'+items.OP_VALUE+'"> </td><td>	<input type="text" id="OP_PRICE" name="OP_PRICE" value="'+items.OP_PRICE+'"><a href="#" class="sbtn" id="delete" name="delete">삭제</a></td></tr>';
				 $("#opt > tbody:last").append(str); 
				 
				 	
			})
					
		}
	});
	$(document).on("click",'.sbtn', function(e){
		 
		 e.preventDefault();
		$(this).parent().parent('tr').remove(); 
		count--;
		}); 
	
	
	$('#add_opt').click(function(){
		
	 	
		var str = '<tr>	<td><input type="text" id="OP_TYPE" name="OP_TYPE" ></td><td>	<input type="text" id="OP_VALUE" name="OP_VALUE"> </td><td>	<input type="text" id="OP_PRICE" name="OP_PRICE"><a href="#" class="btn" id="delete" name="delete">삭제</a></td></tr>';
	 $("#opt > tbody:last").append(str);
	 
	});
	
	$(document).on("click",'.btn', function(e){
		 
		 e.preventDefault();
		$(this).parent().parent('tr').remove(); 
		
		}); 	
	

});
	
</script>
<body>
	<form id="frm" name="frm" action="<c:url value='/adminItemUpdate'/>" method="post" enctype="multipart/form-data">
	<input type="hidden" id="ITEM_NUM" name="ITEM_NUM" value="${map.ITEM_NUM}">
	
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>상품 수정</caption>
			<tbody>
				<tr>
					<th scope="row">카테고리 종류</th>
					<td><select name="ITEM_TYPE" id="ITEM_TYPE">
						<option value="N" <c:if test="${map.ITEM_TYPE == 'N'}">selected</c:if>>N</option>
						<option value="R" <c:if test="${map.ITEM_TYPE == 'R'}">selected</c:if>>R</option>
						<option value="E" <c:if test="${map.ITEM_TYPE == 'E'}">selected</c:if>>E</option>
						<option value="W" <c:if test="${map.ITEM_TYPE == 'W'}">selected</c:if>>W</option>
						<option value="C" <c:if test="${map.ITEM_TYPE == 'C'}">selected</c:if>>C</option>
					
				</select>
				
					</td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td><input type="text"  id="ITEM_NAME" name="ITEM_NAME" value="${map.ITEM_NAME}"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text"  id="ITEM_PRICE" name="ITEM_PRICE" value="${map.ITEM_PRICE}"></input></td>
				</tr>
				<tr>
					<th scope="row">할인율</th>
					<td><input type="text" id="ITEM_DCP" name="ITEM_DCP" value="${map.ITEM_DCP}"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지1</th>
					<td><input type="file" id="ITEM_IMAGE1" name="ITEM_IMAGE1" value="${map.ITEM_IMAGE1}"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지2</th>
					<td><input type="file"  id="ITEM_IMAGE2" name="ITEM_IMAGE2" value="${map.ITEM_IMAGE2}"></input></td>
				</tr>
				<tr>
					<th scope="row">재고</th>
					<td><input type="text" id="ITEM_STOCK" name="ITEM_STOCK" value="${map.ITEM_STOCK}"></input></td>
				</tr>
			</tbody>
		</table>
	
	
	
	
	</form>
	<table id="opt">
		<thead>
		<tr>
		<th>옵션 종류</th>
		<th>옵션 값</th>
		<th>옵션 가격</th>
		
		</tr>
		<thead>
		<tbody>
		
		</tbody>
		</table>
	
	
	<button type="button" id="add_opt">옵션 추가</button>	
	<button type="button" onclick="fsubmit();">수정하기</button>
	<input type="button" onclick="location.href='<c:url value="/adminItemList"/>'" value="목록으로">
</body>
</html>