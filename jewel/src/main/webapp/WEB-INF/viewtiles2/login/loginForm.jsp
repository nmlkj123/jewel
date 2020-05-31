<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>


<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">

function fsubmit(){
	var id = $("#MEM_ID")[0].value;
	var pw = $("#MEM_PWD")[0].value;
	if(id==null || id==''){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(pw==null || pw==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}

	loginForm.submit();
}

</script>
</head>
<body>

<div>
	<div>
		<h1>로그인</h1>
		<form id="loginForm" action="<c:url value='/login/login'/>" method="POST">
		<input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디 입력"><br>
		<input type="password" id="MEM_PWD" name="MEM_PWD" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}">
		<div>
			<label size="22">
				<input type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" name="isSaved" value="">
				<span class="CheckBox"></span>
				<p>아이디 저장</p>
			</label>
		</div>
		</form>
			<button type="button" onclick="fsubmit();">로그인</button>
			<div>
				<a href="<c:url value='/login/findId'/>" target="javascript:window.open();">아이디 찾기</a>
				<span> | </span>
				<a href="<c:url value='/login/findPw'/>" target="javascript:window.open();">비밀번호 찾기</a>
			</div>
	</div>
</div>

</body>
</html>