<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
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
function fsubmit(){
	var title = $("#ET_TITLE")[0].value;
	var sd = $("#ET_SD")[0].value;
	var fd = $("#ET_FD")[0].value;
	var content = $("#summernote")[0].value;
	if(title==null || title==''){
		alert("이벤트 제목을 입력하세요.");
		return false;
	}
	if(sd==null || sd==''){
		alert("시작날짜를 입력하세요.");
		return false;
	}
	if(fd==null || fd==''){
		alert("종료날짜를 입력하세요.");
		return false;
	}
	if(content==null || content==''){
		alert("이벤트 내용을 입력하세요.");
		return false;
	}

	frm.submit();
}






</script>
<body>

<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Horizontal Form</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminEventWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="ET_TITLE" name="ET_TITLE" placeholder="공지사항 제목">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 시작일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="ET_SD" name="ET_SD" placeholder="공지 유형">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 종료일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="ET_FD" name="ET_FD" placeholder="공지 유형">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">이벤트 내용</label>
                    <textarea class="form-control" rows="3" id="summernote" name="ET_CONTENT"></textarea>
                    
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
	
		
		<br/>
		<br/>
	<table align="center">
<tr>
<td><input class="btn btn-block btn-outline-success" type="button" onclick="location.href='<c:url value="/adminEventList"/>'" value="목록으로">
</td>
<td><button class="btn btn-block btn-outline-primary" type="button" onclick="fsubmit();">이벤트 등록</button>
</td>
</tr>
</table>
	
		
		 
		 
		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>	
	
<script type="text/javascript">
$('#ET_SD').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true,
	autoclose: true
	
})

$('#ET_FD').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true,
	autoclose: true
	
})


</script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- include summernote css/js-->
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
</body>
</html>