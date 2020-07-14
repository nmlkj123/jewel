<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

</head>
<script type="text/javascript">

function fsubmit(){
	var title = document.getElementById("FAQ_TITLE").value;
	var cate = document.getElementById("FAQ_CATE").value;
	var content = document.getElementById("FAQ_CONTENT").value;
	if(title==null || title==''){
		alert("FAQ 제목을 입력하세요.");
		return false;
	}
	if(cate==null || cate==''){
		alert("카테고리를 입력하세요.");
		return false;
	}

	if(content==null || content==''){
		alert("FAQ 내용을 입력하세요.");
		return false;
	}

	frm.submit();
}

</script>
<body>
<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">FAQ 등록</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FAQ 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" placeholder="FAQ 제목">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FAQ 카테고리</label>
                    <div class="col-sm-10">
                      
                      <select class="form-control" id="FAQ_CATE" name="FAQ_CATE" placeholder="FAQ 카테고리">
						<option value="goods">상품관련 </option>
						<option value="change">교환/반품관련 </option>
						<option value="inquire">문의관련</option>
						<option value="point">포인트 관련</option>
						<option value="delivery">배달관련</option>
					
					</select>
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">FAQ 내용</label>
                    <textarea class="form-control" rows="10" id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea>
                      
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
	
	<table align="center">
	<tr>
		<td><input class="btn btn-block btn-outline-success" type="button" onclick="location.href='<c:url value="/adminFaqList"/>'" value="목록으로">
		
		</td>
		<td><button type="button" class="btn btn-block btn-outline-primary" onclick="fsubmit();">등록하기</button>
		</td>
	</tr>
</table>
	
	


	
	

</body>
</html>