<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>


<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/minty/bootstrap.min.css">
 
<script type="text/javascript">
function fsubmit(){
	//var mem_num = $("#MEM_NUM")[0].value;
	//alert(mem_num);
	
	//var mem_num2 = ${sessionScope.MEM_NUM}
	//alert(mem_num2); //undefined
	
	var id = $("#MEM_ID")[0].value;
	var pw = $("#MEM_PWD")[0].value;
	//alert(pw);
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
</head>
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
               <form id="loginForm" action="<c:url value='/login/login'/>"  method="POST"  >
               		 <input type="hidden"  id="MEM_NUM" name="MEM_NUM" value="${MEM_NUM}"> 
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" id="MEM_ID" name="MEM_ID"  class="form-control" placeholder="User Name">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password"id="MEM_PWD" name="MEM_PWD"  class="form-control" placeholder="Password">
                  </div>
                  <button type="button" onclick="fsubmit();" class="btn btn-secondary">로그인</button>
                  
               </form>
               <div>
				<a href="<c:url value='/login/findId'/>" target="javascript:window.open();">아이디 찾기</a>
				<span> | </span>
				<a href="<c:url value='/login/findPw'/>" target="javascript:window.open();">비밀번호 찾기</a>
				</div>
            </div>
         </div>
      </div>
</body>
</html>