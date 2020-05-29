<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript"src="<c:url value="/resources/js/post.js"/>" ></script> 
 <script type="text/javascript"src="<c:url value="/resources/js/joinForm.js"/>" ></script>
<script type="text/javascript">


$( document ).ready(function() {
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	alert("dd");
	$("#emailBtn").on("click", function(){
	/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		$.ajax({
			type:"get",
			url : "<c:url value='/join/createEmailCheck'/>",
			data : "userEmail=" + $("#email").val() + "&random=" + $("#random").val(),
			//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
			/* encodeURIComponent
			예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
			중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
			그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
			success : function(data){
					alert("이메일을 보냈습니다. 인증번호를 입력해주세요.");
				
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$("#emailAuthBtn").on("click", function(){
		$.ajax({
			type:"get",
			url:"<c:url value='/join/emailAuth'/>",
			data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			complete: function(){
				loadingBarEnd();
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
});


</script>
</head>
<body>

   <form method="POST">
         
         <!-- 이름 -->
         <div>
            <label for="MEM_NAME">이름</label>
               <input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" required>
               <label id="MEM_NAMEW"></label>
         </div>
         
         <!-- 아이디 -->
         <div>
            <label for="MEM_ID">아이디</label>
               <input type="text" class="form-control" id="MEM_ID" name="MEM_ID" oninput="checkId()" required>
               <label id="MEM_IDW"></label>
         </div>

         
         <!-- 비밀번호 -->
         <div>
            <label for="MEM_PWD">비밀번호</label>
               <input type="password" id="MEM_PWD" name="MEM_PWD" required>
               <label id="MEM_PWDW"></label>
         </div>
         
         <!-- 비밀번호 확인 -->
         <div>
            <label for="pw2_check">비밀번호 확인</label>
               <input type="password" id="MEM_PWD2"  required>
               <label id="MEM_PWDW2"></label>
         </div>
           
         <!-- 닉네임 -->
         <div>
               <label for="MEM_NICK">닉네임</label>
                  <input type="text" id="MEM_NICK" name="MEM_NICK" required="required" oninput="checkNick()"/>  
                  <label id="MEM_NICKW"></label>    
           </div>
         
         <!-- 이메일 -->
		<div>
        <input type="text" id="email" name="MEM_EMAIL" placeholder="이메일을 입력하세요" class="form-control" />
		<button type="button" class="btn btn-info" id="emailBtn">인증메일 발송</button>
		</div>
		<div>
		<input type="text" id="emailAuth" placeholder="인증번호 입력" class="form-control" />
		<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
		</div>
		<input type="hidden" path="random" id="random" value="${random }" />
         <!-- 휴대전화 -->
         <div>
            <label for="MEM_PHONE">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
            <input type="text" id="MEM_PHONE" name="MEM_PHONE" required>
            <label id="MEM_PHONEW"></label>
         </div>
         
         <div>
            <input type="text" id="sample6_postcode" name="MEM_ADDR1" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" name="MEM_ADDR2" placeholder="주소"><br>
         </div>

         <div>
            <a href="${pageContext.request.contextPath}">
               <i aria-hidden="true"></i>취소하기
            </a>&emsp;&emsp;
            <button id="reg_submit">
               <i aria-hidden="true"></i>가입하기
            </button>
         </div>
      </form>

</body>
</html>