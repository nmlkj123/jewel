<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<script type="text/javascript">

function fsubmit(){
	var NT_TITLE = document.getElementById("NT_TITLE").value;
	var NT_TYPE = document.getElementById("NT_TYPE").value;
	var NT_CONTENT = document.getElementById("NT_CONTENT").value;
	
	if(NT_TITLE==null || NT_TITLE==''){
		alert("공지사항 제목을 입력하세요.");
		return false;
	}
	if(NT_TYPE==null || NT_TYPE==''){
		alert("공지 유형을 입력하세요.");
		return false;
	}
	if(NT_CONTENT==null || NT_CONTENT==''){
		alert("공지 내용을 입력하세요.");
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
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminNoticeWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지사항 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TITLE" name="NT_TITLE" placeholder="공지사항 제목">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지 유형</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TYPE" name="NT_TYPE" placeholder="공지 유형">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">공지 내용</label>
                    <textarea class="form-control" rows="3" id="NT_CONTENT" name="NT_CONTENT" ></textarea>
                      
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
		
		
	<table>
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminNoticelist"/>'" value="목록으로">
		</td>
		<td><button type="button" class="btn btn-block btn-outline-primary" onclick="fsubmit();">공지 등록</button>
		</td>
	</tr>
</table>
	
	



	
	

</body>
</html>