<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>나의 리뷰 상세보기</title>
</head>
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

<script type="text/javascript">
	function myReviewModiForm(num){
		location.href="/common/myPage/myReviewModifyForm?RE_NUM="+num;
		}
	function myReviewDelete(num){
		 if (confirm("정말 삭제하시겠습니까??") == true){			 
			 alert("삭제되었습니다.");
			 location.href="/common/myPage/myReviewDelete?RE_NUM="+num;
		 }else{   
		     return false;
		 }
	}
</script>

<body>
	<h4 style="text-align:center; font-weight: bold;">나의 리뷰 상세보기</h4>
	<article>
	<div class="container" role="main">
		
		<br>
		<div class="mb-3">
			<label for="num">글번호</label>&nbsp;&nbsp;
			${myReview.RE_NUM }
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
			${myReview.RE_TITLE }
		</div>
		<div class="mb-3">
			<label for="content">내용</label>
			<div rows="5" title="내용" id="content">
				${myReview.RE_CONTENT }
			</div>
		</div>
		
	</div>
	</article>
	<br><br>
	
	<div align="center">
		<button type="button" class="btn btn-outline-danger" onclick="myReviewModiForm(${myReview.RE_NUM})">수정</button>
		<button type="button" class="btn btn-outline-danger" onclick="myReviewDelete(${myReview.RE_NUM})">삭제</button>
	</div>
	
</body>
</html>