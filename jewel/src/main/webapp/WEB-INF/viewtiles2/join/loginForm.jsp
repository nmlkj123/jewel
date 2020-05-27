<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<form role="form" method="post" autocomplete="off">
  <div>
   <label for="MEM_ID">아이디</label>
   <input type="text" id="MEM_ID" name="MEM_ID" required="required" />      
  </div>
  
  <div>
   <label for="MEM_PWD">패스워드</label>
   <input type="password" id="MEM_PWD" name="MEM_PWD" required="required" />      
  </div>
  
  <button type="submit" id="login" name="login">로그인</button>
  
  <button type="submit" id="insertMember" name="insertMember">회원가입</button>
  
  <button type="submit" id="findId" name="findId">아이디 찾기</button>
  
  <button type="submit" id="findPw" name="findPw">비밀번호 찾기</button>
</form>
</body>
</html>