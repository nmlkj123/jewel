<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<title>QNA게시글 작성</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">

function fsubmit(){
	var pw = $("#QNA_PWD")[0].value;
	if(pw==null || pw==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	$('#frm').submit();
}

</script>

</head>
<body>
	<form id="frm" name="frm" method="post" action="<c:url value='/qna/qnaPwConfirm'/>">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				
				<tr>
					<th scope="row">비밀번호</th>
					<td><input type="password" id="QNA_PWD" name="QNA_PWD" class="wdp_20"></input>
					<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${QNA_NUM }"></input>
					</td>
				</tr>
				
			</tbody>
		</table>
		
		<br/><br/>
		<button type="submit" class="btn1" onclick="fsubmit(); return false;">확인</button>
		<a href="<c:url value='/qna/qnalist' />" class="btn2">목록으로</a>
	</form>
	
	
</body>
</html>