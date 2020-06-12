<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
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

<body>
	<form id="frm" method="post" action="<c:url value='/myPage/myReviewModify'/>">
	<table>
		<caption>나의리뷰수정</caption>
		<tr>
			<th>글번호</th>
			<td>
			${myReview.RE_NUM}
			<input type="hidden" name="RE_NUM" value="${myReview.RE_NUM}">
			</td>
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
			<td>
				<input type="text" id="title" name="RE_TITLE" value="${myReview.RE_TITLE }"/>
			</td>	
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">
				<textarea rows="20" cols="100" title="내용" id="content" name="RE_CONTENT">${myReview.RE_CONTENT }</textarea>
			</td>
		</tr>
	</table>
	</form>
	<br><br>
	
	<div align="center">
		<a href="#" onclick="updateChk(); return false;">확인</a>
		<a href="#" onclick="history.go(-1)">취소</a>
	</div>
	
</body>
</html>