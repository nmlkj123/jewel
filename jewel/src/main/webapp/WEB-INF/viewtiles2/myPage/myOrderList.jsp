<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
</head>
<script type="text/javascript">
function fn_deleteMember(){
		 if (confirm("정말 삭제하시겠습니까??") == true){			 
			 alert("탈퇴되었습니다.");
			 location.href="/common/myPage/myInfoDelete";
		 }else{   
		     return false;
		 }
}


</script>
<body>
<!-- 상단박스영역 -->
	<div>
	<!-- 상단박스1 -->
		<div>
			<p>
			${myInfo.MEM_NAME}님 안녕하세요.
			</p>
		</div>
	<!-- 상단박스2 -->
		<div>
			<p>
			${myInfo.MEM_NAME}님은 <br>
			${myInfo.MEM_RANK }등급입니다. <br>
			적립금: ${myInfo.MEM_POINT }
			</p>
		</div>
		
	</div>
	<!-- 목록박스 -->
	<div>
		<p>
		 <a href="<c:url value="/myPage/myOrderList"/>">주문내역</a>
		 <a href="<c:url value="/myPage/myJJimList"/>">찜한상품</a>
		 <a href="<c:url value="/myPage/myQnAList"/>">나의Q&A</a>
		 <a href="<c:url value="/myPage/myReviewList"/>">나의리뷰</a>
		 <a href="<c:url value="/myPage/myInfoModify"/>">정보수정</a>
		 <a href="#" onclick="fn_deleteMember(); return false;">회원탈퇴</a>
		</p>
	</div>
	
	<h3>마이페이지</h3>
	<table>
		<h4>주문내역</h4>
		<colgroup>
			<col width="15%"/>
			<col width="20"/>
	        <col width="*"/>
	        <col width="10%"/>
	        <col width="30%"/>
	        <col width="10%"/>
        </colgroup>
        <thead>
        	<tr>
        		<th scope="col">주문일자</th>
        		<th scope="col">사진</th>
        		<th scope="col">상품명</th>
        		<th scope="col">결제금액</th>
        		<th scope="col">주문상세</th>
        		<th scope="col">주문상태</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${myOrder }" var="items">
        		<tr align="center">
        			<td>${items.OR_DATE}</td>
        			<td>${items.ITEM_IMAGE1 }</td>
        			<td><a href="#" onclick="location.href='item/itemDetail?ITEM_NUM=${items.ITEM_NUM}'">
        				${items.ITEM_NAME }</a></td>
        			<!-- 상품명을 클릭하면 상품디테일처리하는 컨트롤러에 상품번호를 보내서 처리한다. -->
        			<td>${items.OR_FP }</td>
        			<td>${items.OR_OP }<br>
        				수량:&nbsp;${items.OR_CNT }개
        			</td>
        			<td>${items.DEL_DS }</td>       			
        		</tr>       		
        	</c:forEach>        	
        </tbody>       
	</table>
	<div align="center"class="container pt-5" id="categoryPaging" >
	${myOrderListPaging.pagingHTML}
	</div>	
	
</body>
</html>