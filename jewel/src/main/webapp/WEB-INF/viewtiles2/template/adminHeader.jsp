<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<div>
     <input type="button" onclick="location.href='<c:url value="/adminItemList"/>'" value="상품 관리">
 <input type="button" onclick="location.href='<c:url value="/adminQnAList"/>'" value="QnA 관리">
 <input type="button" onclick="location.href='<c:url value="/openAdminItemDaySaleList"/>'" value="매출관리">
 <input type="button" onclick="location.href='<c:url value="/adminIgnoreList"/>'" value="차단회원관리">
 <input type="button" onclick="location.href='<c:url value="/adminFaqList"/>'" value="FAQ관리">
 <input type="button" onclick="location.href='<c:url value="/adminNoticeList"/>'" value="공지사항 관리">
 <input type="button" onclick="location.href='<c:url value="/adminEventList"/>'" value="이벤트 관리">
 <input type="button" onclick="location.href='<c:url value="/adminMemberList"/>'" value="회원 관리">
<<<<<<< HEAD
 <input type="button" onclick="location.href='<c:url value="/openDeliveryList"/>'" value="배송 관리">
</div>
=======
</div>
>>>>>>> branch 'master' of https://github.com/nmlkj123/jewel.git
