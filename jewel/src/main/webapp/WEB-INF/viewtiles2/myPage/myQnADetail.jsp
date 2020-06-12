<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>나의QNA상세보기</title>
</head>
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
	<table>
		<tr>
			<th>제목</th>
			<td>${myQnADetail.QNA_TITLE }</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>${myQnADetail.ITEM_NAME }</td>
			<th>작성일</th>
			<td>${myQnADetail.QNA_DATE }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${myQnADetail.QNA_CONTENT }</td>
		</tr>
	</table>
	<br><br>
	<c:choose>
		<c:when test ="${myQnADetail.QNA_RSTATE=='Y' }">
			<div>
				<p><b>답변</b></p>
				<p>${myQnADetail.QNA_RCONTENT}</p>	
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<p><b>답변</b></p>
				<p>처리중입니다.</p>	
			</div>
		</c:otherwise>	
	</c:choose>
	<div align="center">
		<a href="#this" onclick="myQnAModifyForm(${myQnADetail.QNA_NUM})">수정</a>
		<a href="#this" onclick="myQnADelete(${myQnADetail.QNA_NUM})">삭제</a>
	</div>
	
</body>
</html>