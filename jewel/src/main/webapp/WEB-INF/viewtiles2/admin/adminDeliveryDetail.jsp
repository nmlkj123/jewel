<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">

function fsubmit(){
	var DEL_DS = document.getElementById("DEL_DS").value;
	
	if(DEL_DS==null || DEL_DS==''){
		alert("배송상태를 입력하세요.");
		return false;
	}
	

	frm.submit();
}

</script>
<body>
<form id="frm" name="frm" action="<c:url value='/updateDelivery'/>" method="post">
	<input type="hidden" name="DEL_NUM" value="${map.DEL_NUM}">
	<table>
		<!-- <colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup> -->
		<caption>배송상태 상세</caption>
		<tbody>
			<tr>
				<th scope="row">배송상태 번호</th>
				<td>${map.DEL_NUM}</td>
				
			</tr>
			<tr>
			<th scope="row">구분 번호</th>
				<td>${map.OR_UNQ}</td>
				
				
			</tr>
			<tr>
				<th scope="row">주문 번호</th>
				<td>${map.OR_NUM}</td>
			</tr>
			<tr>
				<th scope="row">날짜</th>
				<td>${map.DEL_DATE}</td>
				
			</tr>
			<tr>
				<th scope="row">배송상태</th>
				<td><input type="text" id="DEL_DS" name="DEL_DS" value="${map.DEL_DS}"></input></td>
				
			</tr>
			
		</tbody>
	</table>
	
	<input type="button" onclick="location.href='<c:url value="/openDeliveryList"/>'" value="목록으로">
	<button type="button" onclick="fsubmit();">배송상태 수정</button>
</form>
	
</body>
</html>