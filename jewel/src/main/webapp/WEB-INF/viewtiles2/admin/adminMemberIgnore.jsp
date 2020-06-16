<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<script type="text/javascript">

function fsubmit(){
	var IG_WHY = document.getElementById("IG_WHY").value;
	
	if(IG_WHY==null || IG_WHY==''){
		alert("차단사유를 입력하세요.");
		return false;
	}
	

	frm.submit();
}

</script>
<body>
	<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">회원 포인트/등급 변경</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminMemberIgnore'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="MEM_NUM" name="MEM_NUM" value="${map.MEM_NUM}" placeholder="회원 번호" readonly>
                   
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 ID</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="MEM_ID" name="MEM_ID" value="${map.MEM_ID}" placeholder="회원 ID " readonly>
                    </div>
                  </div>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">차단 사유</label>
                    <textarea class="form-control" rows="3" id="IG_WHY" name="IG_WHY"></textarea>
                      
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>

	<table>
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success"  onclick="location.href='<c:url value="/adminMemberList"/>'" value="목록으로">
		</td>
		<td><button type="button" class="btn btn-block btn-outline-primary" onclick="fsubmit();">회원차단</button>
		</td>
	</tr>
</table>
	
	
	

	</form>
</body>
</html>