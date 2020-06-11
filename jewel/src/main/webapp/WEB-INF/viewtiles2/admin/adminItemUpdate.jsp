<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<script type="text/javascript">

function fsubmit(){
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
	frm.submit();
}

</script>
<body>
	<form id="frm" name="frm" action="<c:url value='/adminItemUpdate'/>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="ITEM_NUM" value="${map.ITEM_NUM}">
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
	
	<button type="button" onclick="fsubmit();">수정하기</button>
	<input type="button" onclick="location.href='<c:url value="/adminItemList"/>'" value="목록으로">
	
	
	</form>
	
	<script type="text/javascript">
		var gfv_count='${fn:length(list)+1}';
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault(); fn_addFile(); 
				}); 
			
			$("a[name^='delete']").on("click", function(e){ //삭제 버튼 
				
				e.preventDefault();
				fn_deleteFile($(this));
				
			});
	
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
			comSubmit.addParam("IDX", $("#IDX").val());
			comSubmit.submit();
			
		}
		
		function fn_addFile(){ 
			var str = "<p>" + "<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"
			+ "<a href='#this' class='btn' id='delete_"
			+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" 
			+ "</p>"; 
			
			$("#fileDiv").append(str); 
			
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼 
				e.preventDefault(); 
				fn_deleteFile($(this)); }); } 
		
		function fn_deleteFile(obj){ 
			obj.parent().remove(); 
			
			}
		
		

			
	</script>
</body>
</html>