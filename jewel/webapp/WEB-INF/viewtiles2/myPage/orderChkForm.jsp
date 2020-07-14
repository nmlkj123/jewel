<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 주문배송조회 로그인</title>
</head>
<style>
.outerDiv{
	display: flex;
	width:80%;

	margin-left:5%;
	margin-top:5%;
}
body .form1, .form2{
	margin-top:5%;
 	width:40%;
 	border: 1px solid pink;
 	padding:3%;
 	margin-left:10%;
 	margin-bottom:5%;
 }

</style>

<script type="text/javascript">
var isLogin="${MEM_ID}"
if(isLogin!=""){
	location.href="<c:url value='/myPage/myOrderList'/>";
}
function submit1(){
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
	document.getElementById("form1").submit();
}

function submit2(){
	
	var id = $("#OR_NUM")[0].value;
	var pw = $("#OR_PWD")[0].value;
	if(id==null || id==''){
		alert("주문번호를 입력하세요.");
		return false;
	}

	if(pw==null || pw==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	document.getElementById("form2").submit();

}
</script>
<body>
	<div class="outerDiv">
	
		<div class="form1"> 
		 <form id="form1" method="post" action="<c:url value="/login/login"/>">
		   <fieldset>
		     <legend>회원 주문배송조회</legend>
		   </fieldset>
		   <div class="form-group">
		      <label for="id">아이디</label>
		      <input type="text" class="form-control" id="MEM_ID" name="MEM_ID" placeholder="아이디를 입력하세요.">
		   </div>
		   <div class="form-group">
		      <label for="exampleInputPassword1">Password</label>
		      <input type="password" class="form-control" id="MEM_PWD" name="MEM_PWD" placeholder="Password">
		   </div>
		   <button type="button" class="btn btn-primary" onclick="submit1(); return false;">Submit</button>
		 </form>
	    </div>
	    
	    <div class="form2">
		 <form id="form2" method="post" action="<c:url value="/orderChkPage"/>">
		  <fieldset>
		    <legend>비회원 주문배송조회</legend>
		  </fieldset>
		  <div class="form-group">
		     <label for="OR_NUM">주문번호</label>
		     <input type="text" class="form-control" id="OR_NUM" name="OR_NUM" placeholder="주문번호를 입력하세요.">
		   </div>
		   <div class="form-group">
		     <label for="OR_PWD">Password</label>
		     <input type="password" class="form-control" id="OR_PWD" name="OR_PWD" placeholder="Password">
		   </div>
		   <button type="button" class="btn btn-primary" onclick="submit2(); return false;">Submit</button>
		 </form>
		</div>
		
	</div>	    
</body>
</html>