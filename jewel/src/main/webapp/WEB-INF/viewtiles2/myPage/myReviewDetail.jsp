<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>나의 리뷰 상세보기</title>
</head>
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
	<table>
		<tr>
			<th>글번호</th>
			<td>${myReview.RE_NUM }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${myReview.RE_HIT}</td>
			<th>추천수</th>
			<td>${myReview.RE_LIKE}</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>${myReview.ITEM_NAME }</td>
			<th>작성일</th>
			<td>${myReview.RE_DATE }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${myReview.RE_TITLE }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${myReview.RE_CONTENT }</td>
		</tr>
	</table>
	<br><br>
	
	<div align="center">
		<a href="#this" onclick="myReviewModiForm(${myReview.RE_NUM})">수정</a>
		<a href="#this" onclick="myReviewDelete(${myReview.RE_NUM})">삭제</a>
	</div>
	
</body>
</html>