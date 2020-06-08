<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<script type="text/javascript">

function fsubmit(){
	var ITEM_TYPE = $("#ITEM_TYPE")[0].value;
	var ITEM_NAME = $("#ITEM_NAME")[0].value;
	var ITEM_PRICE = $("#ITEM_PRICE")[0].value;
	var ITEM_DCP = $("#ITEM_DCP")[0].value;
	var ITEM_IMAGE1 = $("#ITEM_IMAGE1")[0].value;
	var ITEM_IMAGE2 = $("#ITEM_IMAGE2")[0].value;
	var ITEM_STOCK = $("#ITEM_STOCK")[0].value;
	
	
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
	frm.submit();
}

</script>
<body>
	<form id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
		<table class="board_view" >
		
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">카테고리 종류</th>
					<td>
					<select id="ITEM_TYPE" name="ITEM_TYPE">
						<option value="N">N</option>
						<option value="R">R</option>
						<option value="E">E</option>
						<option value="W">W</option>
						<option value="C">C</option>
					
					</select>
					
					</td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td><input type="text"  id="ITEM_NAME" name="ITEM_NAME"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text"  id="ITEM_PRICE" name="ITEM_PRICE"></input></td>
					
				</tr>
				<tr>
					<th scope="row">할인율</th>
					<td><input type="text"  id="ITEM_DCP" name="ITEM_DCP"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지1</th>
					<td><input type="file" id="ITEM_IMAGE1" name="ITEM_IMAGE1"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지2</th>
					<td><input type="file"  id="ITEM_IMAGE2" name="ITEM_IMAGE2"></input></td>
				</tr>
				<tr>
					<th scope="row">재고</th>
					<td><input type="text" id="ITEM_STOCK" name="ITEM_STOCK"></input></td>
				</tr>
			</tbody>
		</table>
		
		<br/>
		<br/>
	
	<button type="button" onclick="fsubmit();">상품 등록</button>
		
		 <input type="button" onclick="location.href='<c:url value="/adminItemList"/>'" value="목록으로">
	</form>
	


	
</body>
</html>