<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA게시글 작성</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<script type="text/javascript">
function fsubmit(){
	var QNA_NAME = $("#QNA_NAME")[0].value;
	var QNA_PWD = $("#QNA_PWD")[0].value;
	var QNA_TITLE = $("#QNA_TITLE")[0].value;
	var QNA_CONTENT = $("#QNA_CONTENT")[0].value;
	
	
	
	if(QNA_NAME==null || QNA_NAME==''){
		alert("이름을 입력하세요.");
		return false;
	}
	if(QNA_PWD==null || QNA_PWD==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
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
	<form id="frm" name="frm" method="POST" action="<c:url value='/qna/qnaWrite'/>">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
			
				<tr>
					<th scope="row">작성자</th>
					<td><input type="text" id="QNA_NAME" name="QNA_NAME" class="wdp_20"></input></td>
				</tr>
				
				<tr>
					<th scope="row">비밀번호</th>
					<td><input type="password" id="QNA_PWD" name="QNA_PWD" class="wdp_20"></input></td>
				</tr>
				
				<tr>
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
					<th scope="row">제목</th>
					<td><input type="text" id="QNA_TITLE" name="QNA_TITLE" class="wdp_90"></input></td>
				</tr>
				
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<br/><br/>
		<input type="button" class="btn1" onclick="fsubmit(); return false;"value="작성하기">
		<a href="<c:url value='/qna/qnalist' />" class="btn1">목록으로</a>
	</form>
	
	
</body>
</html>