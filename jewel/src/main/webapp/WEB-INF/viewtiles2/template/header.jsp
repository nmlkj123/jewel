<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <!-- JS --> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
					<a href="<c:url value='/login/loginForm'/>">로그인 </a>
				</div>
				<div style="margin-right: 80px; float: right;">
					<a href="<c:url value='/join/joinForm'/>">회원가입 </a>
				</div>
		    </c:when>
		    <c:when test="${MEM_ID != null}">
		    	<div style="margin-right: 80px; float: right;">
					<c:out value="${MEM_ID}"/> 님
				</div>
		        <div style="margin-right: 80px; float: right;">
				<a href="<c:url value='/login/logout'/>">로그아웃 </a>
				</div>
		    </c:when>
		    <c:otherwise>
		        
		    </c:otherwise>
		</c:choose>
			
<%-- 			<div style="margin-right: 80px; float: right;">
			<a href="javascript:void(0)"><%=name %> 님 </a>
			<a href="../member/logout.jsp">로그아웃 </a>
			<a href="../admin/SpotList.jsp">관리자 </a>
			</div>

			<div style="margin-right: 80px; float: right;">
			<a href="javascript:void(0)"> 님 </a>
			<a href="../member/logout.jsp">로그아웃 </a>
			</div> --%>

</div>
<!-- header -->
<div class="jumbotron text-center mb-0">
	<h1>JEWELS</h1>
	<p>국내 최대규모 쥬얼리!</p> 
</div> 
<nav class="navbar navbar-expand-sm navbar-dark bg-dark "> 
	<a href="#" class="navbar-brand pl-5">JEWELS</a> 
	<!-- Toggle Button --> 
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"> 
		<span class="navbar-toggler-icon"></span> 
	</button> 
	<div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
		<ul class="navbar-nav"> 
			<li class="nav-item">
				<a href="#" class="nav-link">베스트100</a>
			</li> 
			<li class="nav-item">
				<a href="#" class="nav-link">목걸이</a>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">반지</a>
			</li> 
			<li class="nav-item">
				<a href="#" class="nav-link">귀걸이</a>
			</li> 
			<li class="nav-item">
				<a href="#" class="nav-link">팔찌/발찌</a>
			</li> 
		</ul> 
	</div>
</nav>
