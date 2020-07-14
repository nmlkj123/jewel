<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/viewtiles2/template/myPageHeader.jsp" %>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
</head>
<script type="text/javascript">

function popup(num){
	var url= "/common/myPage/myQnADetail?QNA_NUM="+num;
	var name = "myQnADetail";
	var option= "width=600, height=500, top=100, left=200, location=no";
	window.open(url,name,option);	
}
</script>

<body>

	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h5 style="margin-left:10%;">나의Q&A</h5>
		<colgroup>
			<col width="15%"/>
			<col width="15%"/>
	        <col width="20%"/>
	        <col width="*%"/>
	        <col width="20%"/>
        </colgroup>
        <br>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col">등록일자</th>
        		<th scope="col">카테고리</th>
        		<th scope="col">상품명</th>
        		<th scope="col">제목</th>
        		<th scope="col">답변여부</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${qnaList }" var="items">
        		<tr align="center">
        			<td>${items.QNA_DATE}</td>
        			<td>${items.QNA_CATE }</td>
        			<td>${items.ITEM_NAME }</td>
        			<!-- 제목누르면 QNA_NUM를 컨트롤러에 보내기 -->
        			<td>
        				<a href="#" onclick="popup(${items.QNA_NUM})">
        				${items.QNA_TITLE }
        				</a>
        			</td>
        			<td>${items.QNA_RSTATE }</td>       			
        		</tr>       		
        	</c:forEach>        	
        </tbody>
               
	</table>
	
	<div align="center" class="container pt-5" id="categoryPaging" >
	${myQnAListPaging.pagingHTML}
	</div>
	
	
</body>
</html>