<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">공지사항 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.NT_NUM}" placeholder="FAQ 번호" disabled>
                    </div>
                  </div>
                  
                	
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지 유형</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.NT_TYPE}" placeholder="카테고리 종류" disabled>
                    </div>
                  </div>
                
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지사항 등록일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.NT_DATE}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지사항 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.NT_TITLE}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지사항 내용</label>
                   	
                    <textarea class="form-control" rows="15" id="summernote" name="FAQ_CONTENT" disabled>${map.NT_CONTENT}</textarea>
                    
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
	
	<table>
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminNoticeList"/>'" value="목록으로">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminNoticeUpdate?NT_NUM=${map.NT_NUM}"/>'" value="내용 수정">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-danger" onclick="location.href='<c:url value="/adminNoticeDelete?NT_NUM=${map.NT_NUM}"/>'" value="삭제하기"/>
		</td>
	</tr>
</table>
	
	
	

	
</body>
</html>