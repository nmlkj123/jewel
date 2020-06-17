<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>차단  목록</h2>
    <div class="row">
          <div class="col-12">
            <div class="card">
                            <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
    
    <table class="table table-head-fixed text-nowrap">
   
        <thead>
            <tr>
                <th scope="col">회원 번호</th>
                <th scope="col">회원 ID</th>
                <th scope="col">차단 날짜</th>
                
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.MEM_NUM}</td>
                            <td><a href="adminIgnoreDetail?MEM_NUM=${row.MEM_NUM}">${row.IG_MEM_ID}</a></td>
                            <td>${row.IG_DATE}</td>
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
    <br/>
    
    
   <div align="center"class="container pt-5" id="categoryPaging" >
   ${AdminIgnoreListPaging.pagingHTML}
   
   </div>	
    
</body>
</html>