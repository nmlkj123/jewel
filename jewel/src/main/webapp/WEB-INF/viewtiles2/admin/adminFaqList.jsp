<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>FAQ 목록</h2><div class="row">
          <div class="col-12">
            <div class="card">
              
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
    
    <table class="table table-head-fixed text-nowrap">
       
        <thead>
            <tr>
                <th scope="col">FAQ번호</th>
                <th scope="col">FAQ제목</th>
                <th scope="col">FAQ카테고리</th>
                
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.FAQ_NUM}</td>                        
                            	
                          
                            
                        
                            <td><a href="adminFaqDetail?FAQ_NUM=${row.FAQ_NUM}">${row.FAQ_TITLE}</a></td>
                                <td>
                                <c:choose>
                                <c:when test="${row.FAQ_CATE =='goods'}">
                                	상품관련
                                </c:when>
                                <c:when test="${row.FAQ_CATE =='change'}">
                                	교환/반품관련
                                </c:when>
                                <c:when test="${row.FAQ_CATE=='inquire'}">
                                	문의 관련
                                </c:when>
                                <c:when test="${row.FAQ_CATE=='point'}">
                                	포인트 관련
                                </c:when>
                                <c:when test="${row.FAQ_CATE=='delivery'}">
                                	배달 관련
                                </c:when>
                                </c:choose>
                                
                                
                                
                                 </td>
                           
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
    </div>
    </div>
    </div>
    </div>
    <div align="center"class="container pt-5" id="categoryPaging" >
   ${AdminFaqListPaging.pagingHTML}
   
   </div>
    <br/>

     
   
    
</body>
</html>