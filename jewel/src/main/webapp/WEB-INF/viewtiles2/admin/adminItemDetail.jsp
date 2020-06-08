<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>
<body>
	<table>
		<!-- <colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup> -->
		<caption>상품 상세</caption>
		<tbody>
			<tr>
				<th scope="row">상품 번호</th>
				<td>${map.ITEM_NUM}</td>
				<th scope="row">카테고리 종류</th>
				<td>${map.ITEM_TYPE }</td>
			</tr>
			<tr>
				<th scope="row">상품 이름</th>
				<td>${map.ITEM_NAME }</td>
				<th scope="row">가격</th>
				<td>${map.ITEM_PRICE}</td>
			</tr>
			<tr>
				<th scope="row">할인율</th>
				<td>${map.ITEM_DCP}</td>
			</tr>
			<tr>
				<th scope="row">이미지1</th>
				<td>${map.ITEM_IMAGE1}</td>
				<th scope="row">이미지2</th>
				<td>${map.ITEM_IMAGE2}</td>
			</tr>
			<tr>
				<th scope="row">등록일</th>
				<td>${map.ITEM_DATE}</td>
				<th scope="row">재고</th>
				<td>${map.ITEM_STOCK}</td>
			</tr>
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='adminItemList'" value="목록으로">
	 <input type="button" onclick="location.href='openAdminItemUpdate?ITEM_NUM=${map.ITEM_NUM}'" value="수정하기">
	<input type="button" onclick="location.href='adminItemDelete?ITEM_NUM=${map.ITEM_NUM}'" value="삭제하기">

	
</body>
</html>