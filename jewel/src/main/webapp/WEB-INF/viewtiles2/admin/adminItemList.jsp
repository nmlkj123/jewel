<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>상품 리스트</h2>
    <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                

                <div class="card-tools">
                <form class="form-inline my-2 my-lg-0 " action="<c:url value='/adminItemList'/>" >
      <input class="form-control mr-sm-1" type="text" name="keyword" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary my-2 my-sm-0 "  type="submit">Search</button>
    </form>
                  <div class="input-group input-group-sm" style="width: 150px;">
               

                    <div class="input-group-append">
                      
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
    <table class="table table-head-fixed text-nowrap">
     
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
        </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    
    <br/>
  
    
   <div align="center"class="container pt-5" id="categoryPaging" >
   ${AdminItemListPaging.pagingHTML}
   
   </div>	
    
</body>
</html>