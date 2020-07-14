<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/minty/bootstrap.min.css">
 
<html>
<head>
   <title>상품정보</title>
</head>

<style>
body {
    font-family: "Lato", sans-serif;
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #000;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 50%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
</style>

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
	var formData = $("#loginForm").serialize();
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/item/itemLoginCheck'/>",
		data : formData,
		success : function(data){
			if(data==true){
				alert("로그인성공!");
				location.href="<c:url value='/item/itemOrder'/>";
			}else{
				alert("아이디나 비밀번호가 틀립니다");

			}
		}
	});
}
function noMember(){
	location.href="<c:url value='/item/itemOrder'/>"
	
}
function writeMember(){
	location.href="<c:url value='/join/joinForm'/>"
}
</script>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Jewels</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="loginForm"  method="POST"  >
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" id="MEM_ID" name="MEM_ID"  class="form-control" placeholder="User Name">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password"id="MEM_PWD" name="MEM_PWD"  class="form-control" placeholder="Password">
                  </div>
                  <button type="submit" onclick="fsubmit(); return false;" class="btn btn-secondary">로그인</button>
                  <button onclick="writeMember();return false;" class="btn btn-secondary">회원가입</button>
                  <button onclick="noMember(); return false;" class="btn btn-secondary">비회원구매</button>
               </form>
            </div>
         </div>
      </div>
</body>
</html>