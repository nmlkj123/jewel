<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/journal/bootstrap.min.css">
 <!-- JS -->
  <link href="https://fonts.googleapis.com/css2?family=Nanum Gothic&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
 
 <link href="<c:url value='/resources/css/product.css'/>" rel="stylesheet">
 <link href="<c:url value='/resources/css/default.css'/>" rel="stylesheet">
<style type="text/css">

.menu_top{
   width:100%;
   height:20px;
   border-bottom: 1px solid #ffffff;
   background: linear-gradient( to right, #ffffff, #ffffff );
}
.search-box-container input {
  padding: 5px 20px 5px 5px;
}

.search-box-container:after {
    content: "\f002";
    font-family: FontAwesome;
    margin-left: -25px;
    margin-right: 200px;
    
}
</style>
<div class="menu_top">

      <c:choose>
          <c:when test="${MEM_ID == null}">
          	<div style="margin-right: 80px; float: right;">
					<a href="<c:url value='/orderChkForm'/>">주문배송조회</a>
			</div>
            <div style="margin-right: 10px; float: right;">
               <a href="<c:url value='/myPage/myCart'/>">장바구니</a>
            </div>
              <div style="margin-right: 10px; float: right;">
               <a href="<c:url value='/login/loginForm'/>">로그인 </a>
            </div>
            <div style="margin-right: 10px; float: right;">
               <a href="<c:url value='/join/joinForm'/>">회원가입 </a>
            </div>
            
          </c:when>
          <c:when test="${MEM_ID != null}">
             <c:if test="${MEM_ADMIN eq 'A'}">
               <div style="margin-right: 80px; float: right;" >
            <a href="<c:url value='/openAdminMain'/>">관리자페이지 </a>
            </div>
            </c:if>
              <div style="margin-right: 10px; float: right;">
               <a href="<c:url value='/login/logout'/>">로그아웃 </a>
            </div>
            <div style="margin-right: 10px; float: right;">
               <a href="<c:url value='/myPage/myOrderList'/>">마이페이지 </a>
            </div>
            <div style="margin-right: 10px; float: right;">
				<a href="<c:url value='/myPage/myOrderList'/>">주문배송조회</a>
			</div>
            <div style="margin-right: 10px; float: right;">
               <a href="<c:url value='/myPage/myCart'/>">장바구니 </a>
            </div>
            <div style="margin-right: 10px; float: right;">
               <c:out value="${MEM_ID}"/> 님
            </div>
          </c:when>
          <c:otherwise>
              
          </c:otherwise>
      </c:choose>
         

</div>
<!-- header -->
<div class="jumbotron text-center mb-0" style="background-color:white;">
   <a href="<c:url value='/main/main'/>" style="text-decoration:none;"><h1>JEWELS</h1></a>
   <p>안젤리나 주얼쓰 닐리리맘보!</p> 

   <form  class="text-right" action="<c:url value='/item/itemList'/>" >
   <div class="search-box-container text-right">
  		<input type="text" name="keyword" placeholder="Search..."  />
   </div>
   </form>
   
</div> 
<nav class="site-header py-1 sticky-top  mb-5" >
  <div class="container d-flex flex-column flex-md-row justify-content-between" style="font-family: Nanum Gothic, cursive; font-size: 15px; font-weight: bold;">
    <a class="py-2 pr-1 pb-1" href="<c:url value='/main/main'/>" aria-label="주얼쓰" >
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="19pt" height="19pt" viewBox="0 0 19 19" version="1.1">
<defs>
<linearGradient id="linear0" gradientUnits="userSpaceOnUse" x1="-0.0039" y1="258.0318" x2="511.9553" y2="258.0318" gradientTransform="matrix(0.0371131,0,0,-0.0371131,0.000144727,19.076171)">
<stop offset="0" style="stop-color:rgb(50.196078%,84.705882%,100%);stop-opacity:1;"/>
<stop offset="1" style="stop-color:rgb(91.764706%,50.196078%,98.823529%);stop-opacity:1;"/>
</linearGradient>
</defs>
<g id="surface1">
<path style=" stroke:none;fill-rule:nonzero;fill:url(#linear0);" d="M 18.835938 6.910156 L 14.394531 1.410156 C 14.253906 1.238281 14.042969 1.136719 13.816406 1.136719 L 5.183594 1.136719 C 4.960938 1.136719 4.75 1.234375 4.605469 1.410156 L 0.164062 6.910156 C -0.0664062 7.191406 -0.0507812 7.601562 0.1875 7.871094 L 8.949219 17.621094 C 9.242188 17.945312 9.757812 17.949219 10.050781 17.621094 L 18.8125 7.871094 C 19.050781 7.605469 19.066406 7.195312 18.835938 6.910156 Z M 4.859375 3.457031 L 5.757812 6.632812 L 2.296875 6.632812 Z M 7.300781 6.632812 L 6.167969 2.621094 L 12.832031 2.621094 L 11.699219 6.632812 Z M 11.277344 8.117188 L 9.5 14.398438 L 7.722656 8.117188 Z M 6.179688 8.117188 L 7.914062 14.25 L 2.40625 8.117188 Z M 12.820312 8.117188 L 16.59375 8.117188 L 11.085938 14.25 Z M 13.242188 6.632812 L 14.140625 3.457031 L 16.703125 6.632812 Z M 13.242188 6.632812 "/>
</g>
</svg>




    </a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/item/itemList'/>">베스트100</a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/item/itemList?type=N'/>">목걸이</a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/item/itemList?type=R'/>">반지</a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/item/itemList?type=E'/>">귀걸이</a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/item/itemList?type=W'/>">팔찌/발찌</a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/item/itemList?type=C'/>">커플존</a>
    <a class="py-2 d-none d-md-inline-block" href="<c:url value='/event/eventList'/>">커뮤니티</a>
   
    

  </div>
</nav>