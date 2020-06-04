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
		</tr>
		<tr>
			<th>내용</th>
			<td>${myQnADetail.QNA_CONTENT }</td>
		</tr>
	</table>
	<div align="center">
		<a href="#this" id="QnA_update">수정</a>
		<a href="#this" id="QnA_delete">삭제</a>
	</div>
	
</body>
</html>