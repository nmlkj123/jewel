<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">
function delete2(){
	 if (confirm("회원을 삭제 하시겠습니까?") == true){   

		 
		 location.href='<c:url value="/adminMemberDelete?MEM_NUM=${map.MEM_NUM}"/>';
	 }else{   //취소

	     return false;

	 }
}
</script>
<body><div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">회원정보 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.MEM_NUM}" placeholder="FAQ 번호" disabled>
                    </div>
                  </div>
                  
                	
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 ID</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_ID}" placeholder="카테고리 종류" disabled>
                    </div>
                  </div>
                
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 이름</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_NAME}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 닉네임</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_NICK}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 이메일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_EMAIL}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 연락처</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_PHONE}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 주소</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_ADDR1}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">상세 주소</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_ADDR2}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 등급</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_RANK}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 가입일</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_JOINDATE}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 포인트</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_POINT}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 누적금액</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_STACK}" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                  
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
	
	<table align="center">
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminMemberList"/>'" value="목록으로">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminMemberPoint?MEM_NUM=${map.MEM_NUM}"/>'" value="포인트 변경">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-secondary" onclick="location.href='<c:url value="/openAdminMemberIgnore?MEM_NUM=${map.MEM_NUM}"/>'" value="회원 차단">
		</td>
		<td><input type="button" class="btn btn-block btn-outline-danger" onclick="delete2()" value="삭제하기"/>
		</td>
	</tr>
</table>
	
	
	
	

	
</body>
</html>