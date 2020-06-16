<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
$(document).ready(function() {

    $('#summernote').summernote({
      height: 300,
      minHeight: null,
      maxHeight: null,
      focus: true,
      callbacks: {
        onImageUpload: function(files, editor, welEditable) {
          for (var i = files.length - 1; i >= 0; i--) {
            sendFile(files[i], this);
          }
        }
      }
    });
  });
  
  
  
  function sendFile(file, el) {
    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
      data: form_data,
      type: "POST",
      url: "<c:url value='/review/contentImage'/>",
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
      	url=url.trim();
      	
        $(el).summernote('editor.insertImage', "<c:url value='/images/reviewImage/"+url+"'/>");
        alert(url);
        $('#imageBoard > ul').append('<li><img src="<c:url value="/review/reviewWrite'+url+'"/>" width="480" height="auto"/></li>');
      }
    });
  }
</script>
<body>
	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">이벤트 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.ET_NUM}" placeholder="FAQ 번호" disabled>
                    </div>
                  </div>
                  
                	
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 시작일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.ET_SD}" placeholder="카테고리 종류" disabled>
                    </div>
                  </div>
                
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 종료일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.ET_FD}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.ET_TITLE}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 내용</label>
                   	<div>
                  ${map.ET_CONTENT}
                    </div>
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
	
	<table>
<tr>
<td><input type="button"  class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminEventList"/>'" value="목록으로">
</td>
<td>
<input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminEventUpdate?ET_NUM=${map.ET_NUM}"/>'" value="내용 수정">
</td>
<td><input type="button" class="btn btn-block btn-outline-danger" onclick="location.href='<c:url value="/adminEventDelete?ET_NUM=${map.ET_NUM}"/>'" value="삭제하기"/>
</td>
</tr>
</table>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- include summernote css/js-->
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
	
	

	
</body>
</html>