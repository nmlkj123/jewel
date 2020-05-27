<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

   <form method="POST">
         
         <!-- 이름 -->
         <div>
            <label for="MEM_NAME">이름</label>
               <input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" required>
         </div>
         
         <!-- 아이디 -->
         <div>
            <label for="MEM_ID">아이디</label>
               <input type="text" class="form-control" id="MEM_ID" name="MEM_ID" required>
         </div>
         
         <!-- 아이디 중복확인 -->
         <div>
            <label for="idCheck">아이디 중복확인</label>
               <input type="text" class="form-control" id="idCheck" name="idCheck" required>
         </div>
         
         <!-- 비밀번호 -->
         <div>
            <label for="MEM_PWD">비밀번호</label>
               <input type="password" id="MEM_PWD" name="MEM_PWD" required>
         </div>
         
         <!-- 비밀번호 확인 -->
         <div>
            <label for="pw2_check">비밀번호 확인</label>
               <input type="password" id="pw2_check" name="pw2_check" required>
         </div>
           
         <!-- 닉네임 -->
         <div>
               <label for="MEM_NICK">닉네임</label>
                  <input type="text" id="MEM_NICK" name="MEM_NICK" required="required" />      
           </div>
           
           <!-- 닉네임 중복확인 -->
         <div>
            <label for="nickCheck">닉네임 중복확인</label>
               <input type="text" id="nickCheck" name="nickCheck" required>
         </div>
         
         <!-- 이메일 -->
         <div>
            <label for="MEM_EMAIL">이메일</label>
               <input type="text" name="MEM_EMAIL" id="MEM_EMAIL" required>
         </div>
         
         <!-- 이메일 중복체크 -->
         <div>
            <label for="emailCheck">이메일</label>
               <input type="text" name="MEM_EMAIL" id="emailCheck" required>
         </div>
         
         <!-- 휴대전화 -->
         <div>
            <label for="MEM_PHONE">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
            <input type="text" id="MEM_PHONE" name="MEM_PHONE" required>
         </div>
         
         <div>
            <input display: inline;" name="MEM_ADDR1" id="MEM_ADDR1" type="text" readonly="readonly" >
            <button type="button" onclick="execPostCode();">우편번호 찾기</button>
         </div>

         <div>
            <input name="MEM_ADDR2" id="MEM_ADDR2" type="text" />
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