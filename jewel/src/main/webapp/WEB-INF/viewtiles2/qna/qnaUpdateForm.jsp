<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<script type="text/javascript">
function submit(){

	var QNA_TITLE = $("#QNA_TITLE")[0].value;
	var QNA_CONTENT = $("#QNA_CONTENT")[0].value;
	
	

	if(QNA_TITLE==null || QNA_TITLE==''){
		alert("제목을 입력하세요.");
		return false;
	}
	if(QNA_CONTENT==null || QNA_CONTENT==''){
		alert("내용을 입력해주세요.");
		return false;
	}
	
	
	frm.submit();
}

</script>
<body>
<form id="frm" name="frm" method="POST" action="<c:url value='/qna/qnaUpdate'/>">
<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${QNA_NUM }
				<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${QNA_NUM }">
				</td>
				<th scope="row">카테고리</th>
				<td><select id="QNA_CATE" name="QNA_CATE">
					<option>상품문의</option>
					<option>배송문의</option>
					<option>AS문의</option>
					<option>기타문의</option>
					</select>
					</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>
				<c:choose>
				<c:when test="${MEM_ID eq null}">
				${QNA_NAME}
				</c:when>
				<c:otherwise>
				${MEM_ID}
				</c:otherwise>
				</c:choose>
				</td>
				<th scope="row">작성시간</th>
				<td>${QNA_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">
						<input type="text" id="QNA_TITLE" name="QNA_TITLE" class="wdp_90" value="${QNA_TITLE}"/>
				</td>
			</tr>
			<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT">${QNA_CONTENT }</textarea>
					</td>
				</tr>
		</tbody>
	</table>
	<br/>
	
	<a href="<c:url value='/qna/qnalist'/>" class="btn1" id="list">목록으로</a>
	<input type="submit" class="btn1" onclick="submit(); return false;" value="수정완료">
	</form>
</body>
</html>