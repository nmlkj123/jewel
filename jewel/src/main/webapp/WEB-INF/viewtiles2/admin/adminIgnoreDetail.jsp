<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">차단회원 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.MEM_NUM}" placeholder="회원 번호" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 ID</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.IG_MEM_ID}" placeholder="FAQ 카테고리" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">차단 날짜</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.IG_DATE}" placeholder="FAQ 카테고리" disabled>
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">차단사유</label>
                    <textarea class="form-control" rows="3" id="FAQ_CONTENT" name="FAQ_CONTENT" disabled>${map.IG_WHY}</textarea>
                      
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
	
	<table>
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success"  onclick="location.href='<c:url value="/adminIgnoreList"/>'" value="목록으로">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-danger" onclick="location.href='<c:url value="/adminIgnoreDelete?MEM_NUM=${map.MEM_NUM}"/>'" value="삭제하기">
		
		</td>
	</tr>
</table>
	
	
	
</body>
</html>