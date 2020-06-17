<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function order(){
if($("#inputPassword").val()==""){
	alert("비밀번호입력");
	return;
}
if($("#inputPassword2").val()==""){
	alert("비밀번호입력");
	return;
}
if($("#inputPassword").val()!=$("#inputPassword2").val()){
	alert("비밀번호가 같지 않습니다");
	return;
}
$("#pwdOrderForm").submit();




}
</script>
</head>

<div class="container">
     <form class="form-signin" id="pwdOrderForm" method="POST" action="<c:url value='/item/itemOrder'/>" >
  <div class="text-center mb-4">
    <img class="mb-4" src="../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">비회원 비밀번호 설정</h1>
    <p>비밀번호는 비회원 주문조회때 사용됩니다 <code>비밀번호를 까먹지마세요</code> 알았죠?.</p>
  </div>

  <div class="form-label-group">
    <input type="password" id="inputPassword" class="form-control" name="OR_PWD" placeholder="Password" required autofocus>
    <label for="inputEmail">비밀번호</label>
  </div>

  <div class="form-label-group">
    <input type="password" id="inputPassword2" class="form-control" placeholder="Password 확인" required>
    <label for="inputPassword">비밀번호 봑인</label>
  </div>

  <div class="checkbox mb-3">
    
  </div>
  <button class="btn btn-lg btn-primary btn-block" onclick="order();">주문하기</button>
  <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2020</p>
</form>
</div>
</body>
</html>