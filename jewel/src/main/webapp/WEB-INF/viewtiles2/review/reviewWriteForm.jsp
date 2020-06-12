<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA게시글 작성</title>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	if(message!=null && message!=''){
		alert(message);
		if(url!=null && url!=''){
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}
})
</script>
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
        url: '/images/reviewImage'
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
           url=url.trim();
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
</script>

<body>
	<form id="frm" name="frm" method="POST" action="<c:url value='/review/reviewWrite'/>">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
		
			<tbody>
			
				
				<tr>
					<th scope="row">평점</th>
					<td><select id="RE_LIKE" name="RE_LIKE">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="RE_TITLE" name="RE_TITLE" class="wdp_90"></input></td>
				</tr>
				
				<tr>
					<td colspan="2" class="view_text">
						 <textarea class="form-control" id="summernote" name="RE_CONTENT" placeholder="content" maxlength="140" rows="7"></textarea>
					</td>
					<td><input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${MEM_NUM}"></input></td>
					<td><input type="hidden" id="ITEM_NUM" name="ITEM_NUM" value="${ITEM_NUM}"></input></td>
				</tr>
			</tbody>
		</table>
		
		<br/><br/>
		<button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">저장</button>

		<a href="<c:url value='/review/reviewList' />" class="btn1">목록으로</a>
	</form>
	
	
</body>
</html>