<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<script type="text/javascript">

function fsubmit(){
	var title = $("#FAQ_TITLE")[0].value;
	var cate = $("#FAQ_CATE")[0].value;
	var content = $("#FAQ_CONTENT")[0].value;
	if(title==null || title==''){
		alert("FAQ 제목을 입력하세요.");
		return false;
	}
	if(cate==null || cate==''){
		alert("카테고리를 입력하세요.");
		return false;
	}

	if(content==null || content==''){
		alert("FAQ 내용을 입력하세요.");
		return false;
	}

	frm.submit();
}

</script>
<body>
	<form id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
	
		<table class="board_view">
			
			
			<tbody>
				
				<tr>
					<th scope="row">FAQ 제목</th>
					<td><input type="text" id="FAQ_TITLE" name="FAQ_TITLE" ></input></td>
				</tr>
				<tr>
					<th scope="row">FAQ 카테고리</th>
					<td><input type="text" id="FAQ_CATE" name="FAQ_CATE" ></input></td>
				</tr>
				
				<tr>
					<th scope="row">FAQ 내용</th>
					<td><textarea rows="10" cols="40" id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea></td>
				</tr>
			</tbody>
		</table>
	
	<button type="button" onclick="fsubmit();">수정하기</button>
	<input type="button" onclick="location.href='<c:url value="/adminFAQlist"/>'" value="목록으로">



	
	</form>

</body>
</html>