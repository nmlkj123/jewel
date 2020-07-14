<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script charset="utf-8"></script>
</head>
<body>

<div class="result">
<c:if test="${empty list  || list==''}">
조회된 아이디가 없습니다.
</c:if>
<c:if test="${list!=null && list!=''}">
	 <c:forEach items="${list}" var="item" varStatus="i">
	
		
		<div><c:out value="${item.MEM_ID}"/></div>

	</c:forEach>

</c:if>
<br>
<a href="#" onclick="javascript:history.go(-1);" class="btn">뒤로가기</a>
<a href="#" onclick="javascript:window.close();" class="btn">닫기</a>
</div>

</body>
</html>