<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	//로그인시, MEM_NUM 얻기
	
	var message = "${message}";
	if(message!=null && message!=''){
		alert(message);
		location.href = "<c:url value='/login/loginForm'/>";
	}else{
		alert("로그인성공!");
		location.href = "<c:url value='/main/main'/>";
		
	}
})
</script>
</head>
<body>
      
</body>
</html>