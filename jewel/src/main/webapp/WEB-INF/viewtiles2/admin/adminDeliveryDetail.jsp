<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">

function fsubmit(){
	var DEL_DS = document.getElementById("DEL_DS").value;
	
	if(DEL_DS==null || DEL_DS==''){
		alert("배송상태를 입력하세요.");
		return false;
	}
	

	frm.submit();
}

</script>
<body>
<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">배송상태 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/updateDelivery'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">배송상태 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TITLE" name="NT_TITLE" value="${map.DEL_NUM}" placeholder="배송상태 번호" disabled>
                      <input type="hidden" name="DEL_NUM" value="${map.DEL_NUM}">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">구분 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TYPE" name="NT_TYPE" value="${map.OR_UNQ}" placeholder="구분 번호 " disabled>
                    </div>
                  </div>
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">주문 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TYPE" name="NT_TYPE" value="${map.OR_NUM}" placeholder="주문 번호" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">날짜</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TYPE" name="NT_TYPE" value="${map.DEL_DATE}" placeholder="날짜" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">배송상태</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="DEL_DS" name="DEL_DS" value="${map.DEL_DS}" placeholder="배송상태">
                    </div>
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>

	<table align="center">
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/openDeliveryList"/>'" value="목록으로">
		</td>
		<td><button type="button" onclick="fsubmit();" class="btn btn-block btn-outline-primary">배송상태 수정</button>
		</td>
	</tr>
</table>
	
	
</form>
	
</body>
</html>