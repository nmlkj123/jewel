<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<script type="text/javascript">
function delete2(){
	 if (confirm("답변을 삭제 하시겠습니까?") == true){   

		 
		 location.href='<c:url value="/adminQnAReplyDelete?QNA_NUM=${map.QNA_NUM}"/>';
	 }else{   //취소

	     return false;

	 }
}
	
function delete3(){
	 if (confirm("질문 글을 삭제 하시겠습니까?") == true){   

		 
		 location.href='<c:url value="/deleteQnA?QNA_NUM=${map.QNA_NUM}"/>';
	 }else{   //취소

	     return false;

	 }
}



</script>
<body>
    
    <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">QnA 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">QnA번호</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.QNA_NUM}" placeholder="QnA번호" disabled>
                    </div>
                  </div>
                  <c:choose>
                	<c:when test="${map.MEM_ID==null}">
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">질문자 이름</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.QNA_NAME}" placeholder="질문자 이름" disabled>
                    </div>
                  </div>
                		
                	</c:when>
                	<c:otherwise>
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">회원 ID</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.MEM_ID }" placeholder="회원 ID" disabled>
                    </div>
                  </div>
                	
                </c:otherwise>
                </c:choose>
                  
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">질문 날짜</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.QNA_DATE}" placeholder="질문 날짜" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">질문 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.QNA_TITLE}" placeholder="질문 날짜" disabled>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">질문 내용</label>
                    <textarea class="form-control" rows="10" id="FAQ_CONTENT" name="FAQ_CONTENT" disabled>${map.QNA_CONTENT}</textarea>
                      
                    
                  </div>
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
            <c:choose>
                	<c:when test="${map.QNA_RSTATE =='Y'}">
                	 <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">답변내용</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_TITLE" name="FAQ_TITLE" value="${map.QNA_RTITLE}" placeholder="QnA번호" disabled>
                    </div>
                  </div>
                  
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 날짜</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="FAQ_CATE" name="FAQ_CATE" value="${map.QNA_RDATE}" placeholder="질문자 이름" disabled>
                    </div>
                  </div>
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 내용</label>
                    <textarea class="form-control" rows="10" id="FAQ_CONTENT" name="FAQ_CONTENT" disabled>${map.QNA_RCONTENT}</textarea>
                      
                    
                  </div>	
                	
               
                  
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div>
                	
                	
                	</c:when>
                	<c:otherwise>
                	 <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">답변내용</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminFaqWrite'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 미등록</label>
                    
                  </div>
                  
                    </div>
                    </form>
                    </div>
                	</c:otherwise>
                </c:choose>
    
    
    <table align="center">
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='adminQnAList'" value="목록으로">
		</td>
		<c:choose>
    	<c:when test="${map.QNA_RSTATE =='Y'}">
    	<td>
    		<input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminQnAReply?QNA_NUM=${map.QNA_NUM}"/>'" value="답변 수정">
    	</td>
    	<td>
    		<input type="button" class="btn btn-block btn-outline-danger" onclick="delete2()" value="답변 삭제">
    	</td>
    	</c:when>
        <c:otherwise>
       		<td><input type="button" class="btn btn-block btn-outline-primary" onclick="location.href='<c:url value="/openAdminQnAReply?QNA_NUM=${map.QNA_NUM}"/>'" value="답변 달기"></td>
        </c:otherwise>
    </c:choose>
    <td>
   <input type="button" class="btn btn-block btn-outline-secondary" onclick="delete3()" value="QnA게시글 삭제">
   </td>
		
	</tr>
</table>
    
    
    
 
    
</body>
</html>