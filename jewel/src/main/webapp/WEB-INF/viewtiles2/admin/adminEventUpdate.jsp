<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
</head>

<script type="text/javascript">

function esubmit(){
	var title = $("#ET_TITLE")[0].value;
	var sd = $("#ET_SD")[0].value;
	var fd = $("#ET_FD")[0].value;
	var content = $("#ET_CONTENT")[0].value;
	if(title==null || title==''){
		alert("이벤트 제목을 입력하세요.");
		return false;
	}
	if(sd==null || sd==''){
		alert("시작날짜를 입력하세요.");
		return false;
	}
	if(fd==null || fd==''){
		alert("종료날짜를 입력하세요.");
		return false;
	}
	if(content==null || content==''){
		alert("이벤트 내용을 입력하세요.");
		return false;
	}

	frm.submit();
}

</script>
<body>
	<form id="frm" name="frm" action="<c:url value='/adminEventUpdate'/>" method="post">
	<input type="hidden" name="ET_NUM" value="${map.ET_NUM}">
		<table class="board_view">
			
			
			<tbody>
				
				<tr>
					<th scope="row">이벤트 제목</th>
					<td><input type="text"  id="ET_TITLE" name="ET_TITLE" value="${map.ET_TITLE}"></input></td>
				</tr>
				<tr>
					<th scope="row">이벤트 시작일</th>
					<td><input type="text" id="ET_SD" name="ET_SD" value="${map.ET_SD}"></input></td>
				</tr>
				<tr>
					<th scope="row">이벤트 종료일</th>
					<td><input type="text" id="ET_FD" name="ET_FD" value="${map.ET_FD}"></input></td>
				</tr>
				<tr>
					<th scope="row">이벤트 내용</th>
					<td><textarea rows="10" cols="40" id="ET_CONTENT" name="ET_CONTENT">${map.ET_CONTENT}</textarea></td>
				</tr>
			</tbody>
		</table>
	
	<button type="button" onclick="esubmit();">수정하기</button>
	<input type="button" onclick="location.href='<c:url value="/adminEventList"/>'" value="목록으로">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>	
	
	</form>
<script type="text/javascript">
$('#ET_SD').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true,
	autoclose: true
	
})

$('#ET_FD').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true,
	autoclose: true
	
})

</script>
</body>
</html>