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
	
	if(DEL_DS=='상품준비중'||DEL_DS=='배송준비중'||DEL_DS=='배송중'||DEL_DS=='배송완료')
		document.getElementById('hnum').value="1";

	
	else
		document.getElementById("hnum").value="2";
	
	
	
	 if (confirm("수정하시겠습니까?") == true){   

		 frm.submit();

	 }else{   //취소

	     return false;

	 }
	

	
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
                      <input class="form-control" type="text"  id="DEL_NUM" name="DEL_NUM" value="${map.DEL_NUM}" placeholder="배송상태 번호" readonly>
                      <input type="hidden" id="hnum" name="hnum">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">구분 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="OR_UNQ" name="OR_UNQ" value="${map.OR_UNQ}" placeholder="구분 번호 " readonly>
                    </div>
                  </div>
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">주문 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="OR_NUM" name="OR_NUM" value="${map.OR_NUM}" placeholder="주문 번호" readonly >
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
                    <select class="form-control" id="DEL_DS" name="DEL_DS" placeholder="배송상태">
                    	<option value="결제완료" <c:if test="${map.DEL_DS == '결제완료'}">selected</c:if>>결제완료 </option>
						<option value="상품준비중" <c:if test="${map.DEL_DS == '상품준비중'}">selected</c:if>>상품준비중 </option>
						<option value="배송중" <c:if test="${map.DEL_DS == '배송중'}">selected</c:if>>배송중 </option>
						<option value="배송완료" <c:if test="${map.DEL_DS == '배송완료'}">selected</c:if>>배송완료 </option>
						<option value="교환처리중" <c:if test="${map.DEL_DS == '교환처리중'}">selected</c:if>>교환처리중</option>
						<option value="교환완료" <c:if test="${map.DEL_DS == '교환완료'}">selected</c:if>>교환완료</option>
						<option value="반품처리중" <c:if test="${map.DEL_DS == '반품처리중'}">selected</c:if>>반품처리중</option>
						<option value="반품완료" <c:if test="${map.DEL_DS == '반품완료'}">selected</c:if>>반품완료</option>
						<option value="취소진행중" <c:if test="${map.DEL_DS == '취소진행중'}">selected</c:if>>취소진행중</option>
						<option value="취소완료" <c:if test="${map.DEL_DS == '취소완료'}">selected</c:if>>취소완료</option>
					
					</select>
                    
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