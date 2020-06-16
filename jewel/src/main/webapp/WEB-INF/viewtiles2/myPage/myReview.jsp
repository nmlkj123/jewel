<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/viewtiles2/template/myPageHeader.jsp" %>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<script type="text/javascript">

function reviewDetail(num){
	var url= "/common/myPage/myReviewDetail?RE_NUM="+num;
	var name = "myReviewDetail";
	var option= "width=600, height=500, top=100, left=200, location=no";
	window.open(url,name,option);
}
</script>

<body>
	<table class="table table-hover" style="width:80%; margin-left:10%;">
		<br>
		<h5 style="margin-left:10%;">나의리뷰</h5>
		<colgroup>
			<col width="15%"/>
	        <col width="15%"/>
	        <col width="*%"/>
	        <col width="10%"/>
	        <col width="10%"/>
        </colgroup>
        <br>
        <thead>
        	<tr class="table-primary" style="text-align:center;">
        		<th scope="col">등록일자</th>
        		<th scope="col">상품명</th>
        		<th scope="col">제목</th>
        		<th scope="col">추천수</th>
        		<th scope="col">조회수</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${reviewList }" var="items">
        		<tr align="center">
        			<td>${items.RE_DATE}</td>
        			<td>${items.ITEM_NAME}</td>
        			<td>
        				<a href="#" onclick="reviewDetail(${items.RE_NUM})">
        				${items.RE_TITLE }
        				</a>
        			</td>
					<td>${items.RE_LIKE }</td>  
					<td>${items.RE_HIT }</td>   			
        		</tr>       		
        	</c:forEach>        	
        </tbody>
               
	</table>

	<div align="center"class="container pt-5" id="categoryPaging" >
	${myReviewListPaging.pagingHTML}
	</div>
	
	
</body>
</html>