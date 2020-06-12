<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>게시판 목록</h2>
    <table class="board_list">
     
        <thead>
            <tr>
                <th scope="col">상품번호</th>
                <th scope="col">카테고리</th>
                <th scope="col">카테고리</th>
                <th scope="col">이름</th>
                <th scope="col">가격</th>
                
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.ITEM_NUM}</td>
                            <td>
                                ${row.ITEM_TYPE }
                               
                            </td>
                            <td><img src="<c:url value="/images/item/${row.ITEM_IMAGE1}"/>" style="width:50px"	></td>
                            <td><a href="adminItemDetail?ITEM_NUM=${row.ITEM_NUM}">${row.ITEM_NAME}</a></td>
                            <td>${row.ITEM_PRICE }</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">조회된 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose> 
            
        </tbody>
    </table>
    <div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    
    <br/>
    <input type="button" onclick="location.href='<c:url value="/openAdminItemWrite"/>'" value="상품등록">
    
   <div align="center"class="container pt-5" id="categoryPaging" >
   ${AdminItemListPaging.pagingHTML}
   
   </div>	
    
</body>
</html>