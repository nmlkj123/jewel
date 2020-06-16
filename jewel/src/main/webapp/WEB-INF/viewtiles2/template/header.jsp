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
 <link href="<c:url value='/resources/css/product.css'/>" rel="stylesheet">
 <link href="<c:url value='/resources/css/default.css'/>" rel="stylesheet">
<style type="text/css">

.menu_top{
   width:100%;
   height:20px;
   border-bottom: 1px solid #ffffff;
   background: linear-gradient( to right, #ffffff, #ffffff );
}

</style>
<div class="menu_top">

      <c:choose>
          <c:when test="${MEM_ID == null}">
          	<div style="margin-right: 80px; float: right;">
					<a href="<c:url value='/orderChkForm'/>">주문배송조회</a>
			</div>
            <div style="margin-right: 20px; float: right;">
               <a href="<c:url value='/myPage/myCart'/>">장바구니</a>
            </div>
              <div style="margin-right: 20px; float: right;">
               <a href="<c:url value='/login/loginForm'/>">로그인 </a>
            </div>
            <div style="margin-right: 20px; float: right;">
               <a href="<c:url value='/join/joinForm'/>">회원가입 </a>
            </div>
            
          </c:when>
          <c:when test="${MEM_ID != null}">
             <c:if test="${MEM_ADMIN eq 'A'}">
               <div style="margin-right: 80px; float: right;">
            <a href="<c:url value='/openAdminMain'/>">관리자페이지 </a>
            </div>
            </c:if>
              <div style="margin-right: 20px; float: right;">
               <a href="<c:url value='/login/logout'/>">로그아웃 </a>
            </div>
            <div style="margin-right: 20px; float: right;">
               <a href="<c:url value='/myPage/myOrderList'/>">마이페이지 </a>
            </div>
            <div style="margin-right: 20px; float: right;">
				<a href="<c:url value='/myPage/myOrderList'/>">주문배송조회</a>
			</div>
            <div style="margin-right: 20px; float: right;">
               <a href="<c:url value='/myPage/myCart'/>">장바구니 </a>
            </div>
            <div style="margin-right: 20px; float: right;">
               <c:out value="${MEM_ID}"/> 님
            </div>
          </c:when>
          <c:otherwise>
              
          </c:otherwise>
      </c:choose>
         

</div>
<!-- header -->
<div class="jumbotron text-center mb-0" style="background-color:white;">
   <h1>JEWELS</h1>
   <p>안젤리나 주얼쓰 닐리리맘보!</p> 
</div> 
<nav class="site-header sticky-top py-1">
  <div class="container d-flex flex-column flex-md-row justify-content-between">
    <a class="py-2 pr-5" href="<c:url value='/main/main'/>" aria-label="주얼쓰" >
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18pt" height="18pt" viewBox="0 0 18 18" version="1.1">
      <defs>
      <linearGradient id="linear0" gradientUnits="userSpaceOnUse" x1="-0.0039" y1="258.0318" x2="511.9553" y2="258.0318" gradientTransform="matrix(0.0351598,0,0,-0.0351598,0.000137109,18.072162)">
      <stop offset="0" style="stop-color:rgb(50.196078%,84.705882%,100%);stop-opacity:1;"/>
      <stop offset="1" style="stop-color:rgb(91.764706%,50.196078%,98.823529%);stop-opacity:1;"/>
      </linearGradient>
      </defs>
      <g id="surface1">
      <path style=" stroke:none;fill-rule:nonzero;fill:url(#linear0);" d="M 17.84375 6.546875 L 13.636719 1.335938 C 13.503906 1.175781 13.304688 1.074219 13.089844 1.074219 L 4.910156 1.074219 C 4.699219 1.074219 4.5 1.171875 4.363281 1.335938 L 0.15625 6.546875 C -0.0625 6.8125 -0.0507812 7.203125 0.179688 7.457031 L 8.476562 16.691406 C 8.753906 17 9.242188 17.003906 9.523438 16.691406 L 17.820312 7.457031 C 18.050781 7.203125 18.0625 6.816406 17.84375 6.546875 Z M 4.605469 3.277344 L 5.457031 6.285156 L 2.175781 6.285156 Z M 6.917969 6.285156 L 5.839844 2.480469 L 12.160156 2.480469 L 11.082031 6.285156 Z M 10.683594 7.691406 L 9 13.640625 L 7.316406 7.691406 Z M 5.855469 7.691406 L 7.5 13.5 L 2.28125 7.691406 Z M 12.144531 7.691406 L 15.71875 7.691406 L 10.5 13.5 Z M 12.542969 6.285156 L 13.394531 3.277344 L 15.824219 6.285156 Z M 12.542969 6.285156 "/>
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
   
    <form class="form-inline my-2 my-lg-0 " action="<c:url value='/item/itemList'/>" >
      <input class="form-control mr-sm-1" type="text" name="keyword" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary my-2 my-sm-0 "  type="submit">Search</button>
    </form>

  </div>
</nav>