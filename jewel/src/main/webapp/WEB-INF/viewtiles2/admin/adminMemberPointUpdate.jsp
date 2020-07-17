<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">

function fsubmit(){
	var MEM_POINT = document.getElementById("MEM_POINT").value;
	var MEM_RANK = document.getElementById("MEM_RANK").value;
	
	if(MEM_POINT==null || MEM_POINT==''){
		alert("포인트를 입력하세요.");
		return false;
	}
	if(MEM_RANK==null || MEM_RANK==''){
		alert("등급을 입력하세요.");
		return false;
	}
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
                <h3 class="card-title">회원 포인트/등급 변경</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminMemberPointUpdate'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TITLE" name="NT_TITLE" value="${map.MEM_NUM}" placeholder="회원 번호" disabled>
                      <input type="hidden" name="MEM_NUM" value="${map.MEM_NUM}">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 ID</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="NT_TYPE" name="NT_TYPE" value="${map.MEM_ID}" placeholder="회원 ID " readonly>
                    </div>
                  </div>
                 
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">보유 포인트</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="MEM_POINT" name="MEM_POINT" value="${map.MEM_POINT}" readonly placeholder="포인트">
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">적립/차감</label>
                    <select class="form-control" id="PO_TYPE" name="PO_TYPE" placeholder="적립/차감">
                    	<option value="1" selected>적립 </option>
						<option value="2">차감</option>
					
					</select>
                    
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">포인트 값</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="PO_POINT" name="PO_POINT"  placeholder="포인트">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">포인트 내용</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="PO_WHY" name="PO_WHY"  placeholder="포인트 내용">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 등급</label>
                    <select class="form-control" id="MEM_RANK" name="MEM_RANK" placeholder="회원 등급">
                    	
						<option value="일반" <c:if test="${map.MEM_RANK == '일반'}">selected</c:if>>일반</option>
						<option value="브론즈" <c:if test="${map.MEM_RANK == '브론즈'}">selected</c:if>>브론즈</option>
						<option value="실버" <c:if test="${map.MEM_RANK == '실버'}">selected</c:if>>실버</option>
						<option value="골드" <c:if test="${map.MEM_RANK == '골드'}">selected</c:if>>골드</option>
						<option value="다이아" <c:if test="${map.MEM_RANK == '다이아'}">selected</c:if>>다이아</option>
					</select>
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
<

	
	<table align="center">
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminMemberList"/>'" value="목록으로">
		</td>
		<td><button type="button" class="btn btn-block btn-outline-primary" onclick="fsubmit();">포인트/등급 변경</button>
		</td>
	</tr>
</table>
	
	
	

	</form>
</body>
</html>