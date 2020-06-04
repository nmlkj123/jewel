<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
	<form id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post">
		<table class="board_view" >
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">카테고리 종류</th>
					<td>
					<select name="ITEM_TYPE">
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
					<td><input type="text"  name="ITEM_NAME"></input></td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td><input type="text"  name="ITEM_PRICE"></input></td>
				</tr>
				<tr>
					<th scope="row">할인율</th>
					<td><input type="text"  name="ITEM_DCP"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지1</th>
					<td><input type="text"  name="ITEM_IMAGE1"></input></td>
				</tr>
				<tr>
					<th scope="row">이미지2</th>
					<td><input type="text"  name="ITEM_IMAGE2"></input></td>
				</tr>
				<tr>
					<th scope="row">재고</th>
					<td><input type="text"  name="ITEM_STOCK"></input></td>
				</tr>
			</tbody>
		</table>
		
		<br/>
		<br/>
	
	<input type="submit" value="상품 등록">
		
		 <input type="button" onclick="location.href='adminItemList'" value="목록으로">
	</form>
	


	
</body>
</html>