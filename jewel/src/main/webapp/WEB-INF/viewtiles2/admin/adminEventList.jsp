<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>이벤트 목록</h2>
    <div class="row">
          <div class="col-12">
            <div class="card">
              
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
    
    <table class="table table-head-fixed text-nowrap">
       
        <thead>
            <tr>
                <th scope="col">이벤트번호</th>
                <th scope="col">이벤트제목</th>
                <th scope="col">아벤트 시작일</th>
                <th scope="col">아벤트 종료일</th>
                
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.ET_NUM}</td>                        
                            	
                          
                            
                            
                            <td><a href="adminEventDetail?ET_NUM=${row.ET_NUM}">${row.ET_TITLE}</a></td>
                            <td> ${row.ET_SD}</td>
                            <td> ${row.ET_FD}</td>
                           
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
   ${AdminEventListPaging.pagingHTML}
   
   </div>
    <br/>
 
     
   
    
</body>
</html>