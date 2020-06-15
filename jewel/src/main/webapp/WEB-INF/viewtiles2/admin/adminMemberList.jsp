<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>회원 목록</h2>
    <form class="form-inline my-2 my-lg-0 " action="<c:url value='/adminMemberList'/>" >
      <input class="form-control mr-sm-1" type="text" name="keyword" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary my-2 my-sm-0 "  type="submit">Search</button>
    </form>
    <table class="table table-head-fixed text-nowrap">
       
        <thead>
            <tr>
                <th scope="col">회원 번호</th>
                <th scope="col">회원 ID</th>
                <th scope="col">회원 이름</th>
                <th scope="col">회원 닉네임</th>
                <th scope="col">회원 가입일</th>
                
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.MEM_NUM}</td>                        
                            <td><a href="adminMemberDetail?MEM_NUM=${row.MEM_NUM}">${row.MEM_ID}</a></td>
                            <td>${row.MEM_NAME}</td>	
                            <td>${row.MEM_NICK}</td>
                            <td>${row.MEM_JOINDATE}</td>
                            
                           
                           
                    </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">조회된 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose> 
            
        </tbody>
    </table>
    
    
    <div align="center"class="container pt-5" id="categoryPaging" >
   ${AdminMemberListPaging.pagingHTML}
   
   </div>
    <br/>
 
   
     
   
    
</body>
</html>