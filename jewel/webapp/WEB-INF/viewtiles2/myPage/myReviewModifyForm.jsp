<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>나의리뷰수정폼</title>
</head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
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

      }
    });
}
function updateChk(){	
	var title = document.getElementById("title").value;
	if(title == null || title==""){
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}
	if($("#summernote").val() ==""){
		alert("내용을 입력하세요.");
		$("#summernote").focus();
		return false;
	}
	document.getElementById("frm").submit();
}
</script>
<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-size: 14px;
}
body label{
	font-weight: bold;
}
.container{
	border: 1px solid #e7e7e7;
}

</style>

<body>
	<h4 style="text-align:center; font-weight: bold;">나의 리뷰 수정</h4>
	<article>
	<div class="container" role="main">
		<form id="frm" method="post" action="<c:url value='/myPage/myReviewModify'/>">	
			<br>
			<div class="mb-3">
				<label for="num">글번호</label>&nbsp;&nbsp;
				${myReview.RE_NUM }
				<input type="hidden" name="RE_NUM" value="${myReview.RE_NUM}">
			</div>
			<div class="mb-3">
				<label for="hit">조회수</label>&nbsp;&nbsp;
				${myReview.RE_HIT}&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="likes">추천수</label>&nbsp;&nbsp;
				${myReview.RE_LIKE}
			</div>
			<div class="mb-3">
				<label for="item">상품명</label>&nbsp;&nbsp;
				${myReview.ITEM_NAME }&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="re_date">작성일</label>&nbsp;&nbsp;
				${myReview.RE_DATE }
			</div>
			<div class="mb-3">
				<label for="title">제목</label>&nbsp;&nbsp;
				<input type="text" id="title" name="RE_TITLE" value="${myReview.RE_TITLE }"/>
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				 <textarea class="form-control" id="summernote" name="RE_CONTENT" placeholder="content" maxlength="140" rows="7">${myReview.RE_CONTENT }</textarea>
			</div>
	
		</form>
	</div>
	</article>
	<br><br>	
	<div align="center">
		<button type="button" class="btn btn-outline-danger" onclick="updateChk(); return false;">확인</button>
		<button type="button" class="btn btn-outline-danger" onclick="history.go(-1)">취소</button>
	</div>
	
</body>
</html>