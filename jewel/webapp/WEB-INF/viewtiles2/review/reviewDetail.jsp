<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>reviewDetail</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).on('click','#cbtn',function(){
   var tr = $(this).parent().parent().parent().index();
   var num = $("#tbody tr").eq(tr).find("#com_NUM").val();
    $.ajax({ 
         url:'<c:url value="/review/deleteComment"/>', 
         type:'POST',   
         data:{CO_NUM:num}, 
         dataType : "json", 
         success:function(data){
            location.reload();
            
         },

            });   
    
    });
</script>

<script type="text/javascript">

function enroll() {
   var mem_num = <%=session.getAttribute("MEM_NUM")%>
   if(mem_num==null ||mem_num==""){
       alert("회원만 사용 가능합니다");
       location.href="<c:url value='/login/loginForm'/>";
   }
   else{


      }
   
}
</script>

<script type="text/javascript">
$(document).on('click','#com_write',function(){
    var formData = $("#frm").serialize();
    $.ajax({ 
         url:'<c:url value="/review/insertComment"/>', 
         type:'POST',   
         data:formData, 
         dataType : "json", 
         success:function(data){
           
         
            location.reload();
              
         },

            });   
    });



</script>

</head>
<body>
<div class="container">
<table class="board_view" style="width: 100%;">
      <colgroup>
         <col width="10%"/>
         <col width="25%"/>
         <col width="10%"/>
         <col width="25%"/>
         <col width="10%"/>
         <col width="20%"/>
      </colgroup>
      
      <tbody>
         <tr>
            <th scope="row">글 번호</th>
            <td>${map.RE_NUM}</td>
            <th scope="row">작성자</th>
            <td>${map.MEM_ID}</td>
            <th scope="row">작성일</th>
            <td>${map.RE_DATE}</td>
         </tr>
         <tr>
            <th scope="row">제목</th>
            <td colspan="5">${map.RE_TITLE }</td>
         </tr>
         <tr>
            <td colspan="6">${map.RE_CONTENT }</td>
         </tr>
         
         
      </tbody>
   </table>
   <br/><br/>
   
        <table class="board_view" style="width: 100%;">
            <colgroup>
                <col width="15%">
                <col width="85%">
            </colgroup>
            <tbody id="tbody">
                <tr>
                    <th>댓글</th>
                    <td>
                        ${fn:length(comment) }
                    </td>
                </tr>
                
                <c:if test="${fn:length(comment)>0 }">
                    <c:forEach items="${comment }" var="com">
                        <tr>
                            <td style="background:#f7f7f7;color:#3b3a3a;" >
                               ${com.MEM_ID} <p style="font-size: 8px;" >${com.CO_DATE }</p>
                             <input type="hidden" name="CO_NUM" id="com_NUM" value="${com.CO_NUM}">
                                
                            </td>
                            <td>
                                <div id="com_Div"><input type="hidden" value ="${com.CO_CONTENT}" id="com_CON">${com.CO_CONTENT }</div>
                                <div align="right">
                                    <input type="button" name="com_Del"  id="cbtn"  class="btn3" value="삭제" onclick="del(); return false;">
                                </div>                            
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <form id="frm">
                <tr>
                    <td colspan="2">
                        <div>
                            <input type="hidden" name="MEM_NUM" value="${MEM_NUM}">  
                        <input type="hidden" name="RE_NUM" value="${map.RE_NUM}">
                            <textarea  rows="5" cols="130" name="CO_CONTENT" onclick="enroll(); return false;"></textarea>
                            <p align="right" ><input type="button"  id="com_write" class="btn1" value="등록"  ></p>
                        </div>
                    </td>
                </tr>
                </form>
            </tbody>
           
        </table>


       <a href="#" onclick="history.back();" class="btn1" id="list">목록으로</a>
   </div>
</body>

</html>


   


   

