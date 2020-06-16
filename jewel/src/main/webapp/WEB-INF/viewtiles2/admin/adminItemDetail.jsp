<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
</head>
<body>

	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">상품 상세</h3>
              </div>
	<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
		<div class="card-body">
		
		<div class="form-group row">
                    <label for="ITEM_NUM" class="col-sm-2 col-form-label">상품 번호</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_NUM" name="ITEM_NUM" value="${map.ITEM_NUM}" readonly placeholder="카테고리를 선택하세요">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_NAME" class="col-sm-2 col-form-label">카테고리 종류</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_TYPE" name="ITEM_TYPE" value="${map.ITEM_TYPE}" placeholder="이름">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_PRICE" class="col-sm-2 col-form-label">상품 이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_NAME" name="ITEM_NAME" value="${map.ITEM_NAME}" placeholder="가격">
                    </div>
        </div>	 	 
		<div class="form-group row">
                    <label for="ITEM_DCP" class="col-sm-2 col-form-label">가격</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_PRICE" name="ITEM_PRICE" value="${map.ITEM_PRICE}" placeholder="할인율">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_DCP" class="col-sm-2 col-form-label">할인율</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control"   id="ITEM_DCP" name="ITEM_DCP"  value="${map.ITEM_DCP}"  placeholder="재고">
                      
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_STOCK" class="col-sm-2 col-form-label">재고</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control"  id="ITEM_STOCK" name="ITEM_STOCK"  value="${map.ITEM_STOCK}"  placeholder="재고">
                      
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_STOCK" class="col-sm-2 col-form-label">등록일</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control"  id="ITEM_DATE" name="ITEM_DATE"  value="${map.ITEM_DATE}"  placeholder="재고">
                      
                    </div>
        </div> 
        <div class="form-group row">
                    <label for="ITEM_STOCK" class="col-sm-2 col-form-label">사진1</label>
                    <div class="col-sm-10">
                      <img src="<c:url value="/images/item/${map.ITEM_IMAGE1}"/>" style="width:150px"/>
                      
                    </div>
        </div>  
        <div class="form-group row">
                    <label for="ITEM_STOCK" class="col-sm-2 col-form-label">사진2</label>
                    <div class="col-sm-10">
                    <img src="<c:url value="/images/item/${map.ITEM_IMAGE2}"/>" style="width:150px"	>
                      
                      
                    </div>
        </div>  
      
        	
				
		</div>
			
		</form>
		</div>
		<div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                

                <div class="card-tools">
                <form class="form-inline my-2 my-lg-0 " action="<c:url value='/adminItemList'/>" >
      
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
				<tr>
                        	<th>옵션 종류</th>
                        	<th>옵션 값</th>
                        	<th>가격</th>
                        </tr>
			<c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        
                        <tr>
                            <td>${row.OP_TYPE}</td>
                            <td>${row.OP_VALUE}</td>
                            <td>${row.OP_PRICE}</td>
                            
                          
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="3">조회된 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose> 
		</table>	
	</div>
	</div>
	</div>
	</div>
	
	
	<table>
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminItemList"/>'" value="목록으로">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminItemUpdate?ITEM_NUM=${map.ITEM_NUM}"/>'" value="수정하기">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-danger" onclick="location.href='<c:url value="/adminItemDelete?ITEM_NUM=${map.ITEM_NUM}"/>'" value="삭제하기"/>
		</td>
	</tr>
</table>
	
	 
	

	
</body>
</html>