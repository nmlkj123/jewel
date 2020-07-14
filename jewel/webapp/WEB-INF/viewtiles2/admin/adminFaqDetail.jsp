<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">
function delete2(){
	 if (confirm("삭제하시겠습니까?") == true){   

		 
		 location.href='<c:url value="/adminFaqDelete?FAQ_NUM=${map.FAQ_NUM}"/>';

	 }else{   //취소

	     return false;

	 }
}

</script>
<body>
<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">FAQ 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FAQ 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.FAQ_NUM}" placeholder="FAQ 번호" disabled>
                    </div>
                  </div>
                  
                	
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리 종류</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.FAQ_CATE}" placeholder="카테고리 종류" disabled>
                    </div>
                  </div>
                
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FAQ 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.FAQ_TITLE}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FAQ 내용</label>
                    <textarea class="form-control" rows="10" id="FAQ_CONTENT" name="FAQ_CONTENT" disabled>${map.FAQ_CONTENT}</textarea>
                      
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>

	<table align="center">
	<tr>
		<td>
			<input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminFaqList"/>'" value="목록으로">
		</td>
		<td>
			<input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminFaqUpdate?FAQ_NUM=${map.FAQ_NUM}"/>'" value="내용 수정">
		</td>
		<td>
			<input type="button" class="btn btn-block btn-outline-danger"  onclick="delete2()" value="삭제하기"/>
		</td>
	</tr>
</table>
	
	
	

	
</body>
</html>