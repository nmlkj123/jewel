<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>회원수정</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript"src="<c:url value="/resources/js/post.js"/>" ></script> 
 <script type="text/javascript"src="<c:url value="/resources/js/myInfoModiForm.js"/>" ></script>

<script type="text/javascript">
/* 닉네임체크 */
function checkNick(){
	var nick = $('#MEM_NICK').val();
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/join/checkNick'/>");
	comAjax.setCallback("fn_checkNickCallback");
	comAjax.addParam("nick",nick);
	comAjax.ajax();
}

function fn_checkNickCallback(data){
	if(data){
    	$('#MEM_NICKW').text(" 사용중인 닉네임");
		$('#MEM_NICKW').css("color","red");
		$('#MEM_NICKW').css("font-size","9pt");
		$('#MEM_NICKW').css("font-weight","bold");
		$('#MEM_NICK').attr("check", "0");
    }else{
    	$('#MEM_NICKW').text(" 사용가능");
		$('#MEM_NICKW').css("color","green");
		$('#MEM_NICKW').css("font-size","9pt");
		$('#MEM_NICKW').css("font-weight","bold");
		$('#MEM_NICK').attr("check", "1");
    }
}

</script>


<body>

<div class="container">
   <h4 class="mb-3 p-3">회원정보수정</h4>
   <form id="modifyForm" class="form-horizontal" method="POST" action="<c:url value='/myPage/myInfoModify'/>">
                  
         <!-- 이름 -->
         <div class="col-md-6 mb-3">
            <label>이름</label>
               <input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" value="${myInfo.MEM_NAME}" required >
               <label id="MEM_NAMEW"></label>
         </div>
         
         <!-- 아이디 -->
         <div class="col-md-6 mb-3">
            <label for="ex3">아이디</label>
               <input type="text" class="form-control" check="0" id="MEM_ID" name="MEM_ID" value="${MEM_ID}" oninput="checkId()" readonly >
               <label id="MEM_IDW"></label>
         </div>

         <!-- 비밀번호 -->
         <div class="col-md-6 mb-3">
            <label for="MEM_PWD">비밀번호</label>
               <input type="password" class="form-control" id="MEM_PWD" name="MEM_PWD" >
               <label id="MEM_PWDW"></label>
         </div>
         
         <!-- 비밀번호 확인 -->
         <div class="col-md-6 mb-3">
            <label for="pw2_check">비밀번호 확인</label>
               <input type="password" class="form-control" id="MEM_PWD2" >
               <label id="MEM_PWDW2"></label>
         </div>
         
         <!-- 이메일 -->
		<div class="col-md-6 mb-3 input-group" >
        <input type="text" class="form-control" check="0" id="email" name="MEM_EMAIL" value="${myInfo.MEM_EMAIL}" readonly />
		</div>
           
         <!-- 닉네임 -->
         <div class="col-md-6 mb-3">
               <label for="MEM_NICK">닉네임</label>
                  <input type="text" class="form-control" check="0" id="MEM_NICK" name="MEM_NICK" value="${myInfo.MEM_NICK}" required="required" oninput="checkNick()"/>  
                  <label id="MEM_NICKW"></label>    
           </div>
         
         
         <!-- 휴대전화 -->
         <div class="col-md-6 mb-3">
            <label for="MEM_PHONE">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
            <input type="text" class="form-control"  check="0" id="MEM_PHONE" value="${myInfo.MEM_PHONE}"  name="MEM_PHONE" required>
            <label id="MEM_PHONEW"></label>
         </div>
         
         <div class="col-md-4 mb-4 input-group">
            <input type="text" class="form-control" id="sample6_postcode" name="MEM_ADDR1" value="${myInfo.MEM_ADDR1}" readonly>
			<input type="button" class="btn btn-outline-success my-2 my-sm-0" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" >
			<label id="MEM_ADDRW1"></label><br>
		</div>
		<div class="col-md-6 mb-6">
			<input type="text"  class="form-control" id="sample6_address" name="MEM_ADDR2" value="${myInfo.MEM_ADDR2}"><br>
         </div>

         <div class="col-md-6 mb-6">
            <input type="reset" value="취소하기" >
        
            &emsp;&emsp;
            <button id="reg_submit" onclick="submit_ck(); return false;">
               <i aria-hidden="true"></i>수정하기
            </button>
         </div>
      </form>
</div>
</body>
</html>