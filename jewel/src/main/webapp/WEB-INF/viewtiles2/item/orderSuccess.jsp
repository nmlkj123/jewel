<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>주문완료</title>
</head>

<body>
<div class=" container">
   <div class="jumbotron" >
  <h4 class="display-4 text-center" style="font-family: Jua, cursive;">정상적으로 주문되었습니다.</h4>
  <p class="lead"></p>
  <hr class="my-4 mb-5">
  
  <h2 style="font-family: Nanum Gothic, cursive;">주문감사합니다.</h2>
  <h2 class="mt-5" style="font-family: Nanum Gothic, cursive;">주문번호 : <span style="color: red; font-family: Nanum Gothic, cursive;">${OR_NUM}</span></h2>
  <p class="lead mt-5">
    <a class="btn btn-primary btn" href="<c:url value='/main/main'/>" role="button">홈페이지 가기</a>
    <a class="btn btn-primary btn" href="<c:url value='/orderChkForm'/>" role="button">주문내역 가기</a>
  </p>
</div>
</div>
</body>
</html>