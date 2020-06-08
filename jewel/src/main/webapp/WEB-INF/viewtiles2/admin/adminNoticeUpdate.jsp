<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<script type="text/javascript">

function fsubmit(){
	var NT_TITLE = document.getElementById("NT_TITLE").value;
	var NT_TYPE = document.getElementById("NT_TYPE").value;
	var NT_CONTENT = document.getElementById("NT_CONTENT").value;
	
	if(NT_TITLE==null || NT_TITLE==''){
		alert("공지사항 제목을 입력하세요.");
		return false;
	}
	if(NT_TYPE==null || NT_TYPE==''){
		alert("공지 유형을 입력하세요.");
		return false;
	}
	if(NT_CONTENT==null || NT_CONTENT==''){
		alert("공지 내용을 입력하세요.");
		return false;
	}
	
	frm.submit();
}

</script>
<body>
	<form id="frm" name="frm" action="<c:url value='/adminNoticeUpdate'/>" method="post">
	<input type="hidden" name="NT_NUM" value="${map.NT_NUM}">
		<table class="board_view">
			
			
			<tbody>
				
				<tr>
					<th scope="row">공지사항 제목</th>
					<td><input type="text"  id="NT_TITLE" name="NT_TITLE" value="${map.NT_TITLE}"></input></td>
				</tr>
				<tr>
					<th scope="row">공지 유형</th>
					<td><input type="text" id="NT_TYPE" name="NT_TYPE" value="${map.NT_TYPE}"></input></td>
				</tr>
				
				<tr>
					<th scope="row">공지 내용</th>
					<td><textarea rows="10" cols="40" id="NT_CONTENT" name="NT_CONTENT">${map.NT_CONTENT}</textarea></td>
				</tr>
			</tbody>
		</table>
	
	<button type="button" onclick="fsubmit();">공지 수정</button>
	<input type="button" onclick="location.href='<c:url value="/adminNoticelist"/>'" value="목록으로">



	
	</form>

</body>
</html>