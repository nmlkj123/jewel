<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>나의리뷰수정폼</title>
</head>
<script type="text/javascript">

function updateChk(){	
	var title = document.getElementById("title").value;
	if(title == null || title==""){
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}
	var content = document.getElementById("content").value;
	if(content == null || content==""){
		alert("내용을 입력하세요.");
		$("#content").focus();
		return false;
	}
	document.getElementById("frm").submit();
}	
</script>
<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-size: 14px;
}
body label{
	font-weight: bold;
}
.container{
	border: 1px solid #e7e7e7;
}

</style>

<body>
	<h4 style="text-align:center; font-weight: bold;">나의 리뷰 수정</h4>
	<article>
	<div class="container" role="main">
		<form id="frm" method="post" action="<c:url value='/myPage/myReviewModify'/>">	
			<br>
			<div class="mb-3">
				<label for="num">글번호</label>&nbsp;&nbsp;
				${myReview.RE_NUM }
				<input type="hidden" name="RE_NUM" value="${myReview.RE_NUM}">
			</div>
			<div class="mb-3">
				<label for="hit">조회수</label>&nbsp;&nbsp;
				${myReview.RE_HIT}&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="likes">추천수</label>&nbsp;&nbsp;
				${myReview.RE_LIKE}
			</div>
			<div class="mb-3">
				<label for="item">상품명</label>&nbsp;&nbsp;
				${myReview.ITEM_NAME }&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="re_date">작성일</label>&nbsp;&nbsp;
				${myReview.RE_DATE }
			</div>
			<div class="mb-3">
				<label for="title">제목</label>&nbsp;&nbsp;
				<input type="text" id="title" name="RE_TITLE" value="${myReview.RE_TITLE }"/>
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" title="내용" name="RE_CONTENT" id="content" placeholder="${myReview.RE_CONTENT }" ></textarea>
			</div>
	
		</form>
	</div>
	</article>
	<br><br>	
	<div align="center">
		<button type="button" class="btn btn-outline-danger" onclick="updateChk(); return false;">확인</button>
		<button type="button" class="btn btn-outline-danger" onclick="history.go(-1)">취소</button>
	</div>
	
</body>
</html>