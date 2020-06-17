<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script charset="utf-8"></script>
<link rel="stylesheet" type="text/css"/>
<script type="text/javascript">
$(document).ready(function(){
/* 	$("input[name='findIdBy']").change(function(){
		$(this).siblings("div").hide();
		$(this).next().next().show();
	}); */
	$("#email").change(function(){
		$("#email2").val($(this).val());
	});
});
function fsubmit(){
	var email = $("#email1").val()+"@"+$("#email2").val();
	$("#MEM_EMAIL").val(email);
/* 	var gsWin = window.open("about:blank","winName");
	frm.target = "winName"; */
	frm.submit();
}
</script>
</head>
<body>
<div class="container findId">
<form class="mb-3" id="frm" method="post" action="<c:url value='/login/findIdResult'/>">
	<h1 class="mb-5">아이디 찾기</h1>
	<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
	<input type="radio" id="findIdByEmail" name="findIdBy" value="email">이메일로 찾기<br>
	<div class="findIdByEmail">
		<input type="text" id="email1" name="email1" placeholder="이메일">
		@
		<input type="text" id="email2" name="email2" value="">
		<select id="email">
		<option value="">직접입력</option>
		<option>naver.com</option>
		<option>hanmail.net</option>
		<option>gmail.com</option>
		<option>nate.com</option>
		</select>
	</div>
</form>
	<a href="#" class="btn" onclick="fsubmit();">찾기</a>
	<a href="#" class="btn" onclick="fclose();">취소</a>
</div>

</body>
</html>