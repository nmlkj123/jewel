<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>나의QNA상세보기</title>
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
	function myQnAModifyForm(num){
		/* id document.getElementId(#QNA_RSTATE) = 'Y'이면 
			alert("답변이 완료된 게시글입니다. 다시 작성해주세요.") */
		location.href="/common/myPage/myQnAModifyForm?QNA_NUM="+num;
		}
	function myQnADelete(num){
		 if (confirm("정말 삭제하시겠습니까??") == true){			 
			 alert("삭제되었습니다.");
			 location.href="/common/myPage/myQnADelete?QNA_NUM="+num;
		 }else{   
		     return false;
		 }
	}
</script>

<body>
	<h4 style="text-align:center; font-weight: bold;">나의QNA상세보기</h4>
	<article>
	<div class="container" role="main">
		
		<br>
		<div class="mb-3">
			<label for="title">제목</label>&nbsp;&nbsp;
			${myQnADetail.QNA_TITLE }
		</div>
		<div class="mb-3">
			<label for="itemName">상품명</label>
			${myQnADetail.ITEM_NAME}
			&nbsp;&nbsp;&nbsp;
			<label for="date">작성일</label>
			${myQnADetail.QNA_DATE}
		</div>
		<div class="mb-3">
			<label for="content">내용</label>
			<div rows="5" title="내용" id="content">
				${myQnADetail.QNA_CONTENT }
			</div>
		</div>
	</div>
	</article>
	<br><br>
	
	<div class="container">
		<c:choose>
			<c:when test ="${myQnADetail.QNA_RSTATE=='Y' }">
				<div class="mb-3">
					<label for="reply">답변</label>
					<div>${myQnADetail.QNA_RCONTENT}</div>	
				</div>
			</c:when>
			<c:otherwise>
				<div class="mb-3">
					<label for="reply">답변</label>
					<div style="color:red;">처리중입니다.</div>	
				</div>
			</c:otherwise>	
		</c:choose>
	</div>
	<div align="center">
		<button type="button" class="btn btn-outline-danger" onclick="myQnAModifyForm(${myQnADetail.QNA_NUM})">수정</button>
		<button type="button" class="btn btn-outline-danger" onclick="myQnADelete(${myQnADetail.QNA_NUM})">삭제</button>
	</div>
	
</body>
</html>