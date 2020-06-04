<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>

<body>
	<form id="frm" name="frm" action="<c:url value='/adminItemUpdate'/>" method="post">
	<input type="hidden" name="ITEM_NUM" value="${map.ITEM_NUM}">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 상세</caption>
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
					<td><input type="text"  name="ITEM_NAME" value="${map.ITEM_NAME}"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text"  name="ITEM_PRICE" value="${map.ITEM_PRICE}"></input></td>
				</tr>
				<tr>
					<th scope="row">할인율</th>
					<td><input type="text"  name="ITEM_DCP" value="${map.ITEM_DCP}"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지1</th>
					<td><input type="text"  name="ITEM_IMAGE1" value="${map.ITEM_IMAGE1}"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지2</th>
					<td><input type="text"  name="ITEM_IMAGE2" value="${map.ITEM_IMAGE2}"></input></td>
				</tr>
				<tr>
					<th scope="row">재고</th>
					<td><input type="text"  name="ITEM_STOCK" value="${map.ITEM_STOCK}"></input></td>
				</tr>
			</tbody>
		</table>
	
	<input type="submit" value="상품 수정">
	<input type="button" onclick="location.href='adminItemList'" value="목록으로">
	
	
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