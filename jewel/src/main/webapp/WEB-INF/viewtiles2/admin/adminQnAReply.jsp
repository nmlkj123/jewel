<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>

<script type="text/javascript">

function fsubmit(){
	
	var QNA_RTITLE = document.getElementById("QNA_RTITLE").value;
	


	var QNA_RCONTENT =document.getElementById("QNA_RCONTENT").value;
	
	if(QNA_RTITLE==null || QNA_RTITLE==''){
		alert("답변 제목을 입력하세요.");
		return false;
	}
	
	if(QNA_RCONTENT==null || QNA_RCONTENT==''){
		alert("답변 내용을 입력하세요.");
		return false;
	}
	
	
	frm2.submit();
}

</script>
<body>
    <h2>QnA 답변</h2>
    <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">QnA 상세</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" id="frm" name="frm" action="<c:url value='/adminQnAReply'/>" method="post">
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
                    <textarea class="form-control" rows="3" id="FAQ_CONTENT" name="FAQ_CONTENT" disabled>${map.QNA_TITLE}</textarea>
                      
                    
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
              <form class="form-horizontal" id="frm2" name="frm2" action="<c:url value='/adminQnAReply'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="QNA_RTITLE" name="QNA_RTITLE" value="${map.QNA_RTITLE}" placeholder="답변 제목">
                      <input type="hidden" name="QNA_NUM" value="${map.QNA_NUM}">
                    </div>
                  </div>
                  
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 내용</label>
                    <textarea class="form-control" id="QNA_RCONTENT" name="QNA_RCONTENT" rows="15" placeholder="답변 내용">${map.QNA_RCONTENT}</textarea>
                      
                    
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
              <form class="form-horizontal" id="frm2" name="frm2" action="<c:url value='/adminQnAReply'/>" method="post">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 제목</label>
                    <div class="col-sm-10">
                      <input class="form-control" type="text"  id="QNA_RTITLE" name="QNA_RTITLE"  placeholder="답변 제목">
                      <input type="hidden" name="QNA_NUM" value="${map.QNA_NUM}">
                    </div>
                  </div>
                  
                	<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">답변 내용</label>
                    <textarea class="form-control" id="QNA_RCONTENT" name="QNA_RCONTENT" rows="15" placeholder="답변 내용"></textarea>
                      
                    
                  </div>	
                	
               
                  
                  </div>
                <!-- /.card-body -->
                
                <!-- /.card-footer -->
              </form>
            </div> 
                	
                	</c:otherwise>
                </c:choose>
   
                
          
 
    <table>
	<tr>
		<td><input type="button" class="btn btn-block btn-outline-success" onclick="location.href='<c:url value="/adminQnAList"/>'" value="목록으로">
		</td>
		<td><button type="button" class="btn btn-block btn-outline-primary" onclick="fsubmit();">
    <c:choose>
    	<c:when test="${map.QNA_RSTATE =='Y'}">
    	수정하기    		
    	</c:when>
        <c:otherwise>
       		 답변 달기
        </c:otherwise>
    </c:choose>
    </button>
		</td>
	</tr>
</table>
    
    
    
    
    </form>
</body>
</html>