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
</head>
<script >
function eventList(type2,pg){
	$("#div1").empty();
	$("#categoryPaging").empty();

$.ajax({
	  type:"POST",
      url : '<c:url value="/event/event"/>',
      data:{type: type2, pg: pg},
      success : function(data){
    	    if(data.list.length==0){
				table += '<tr>'+
				'<td colspan="4">데이터가 존재하지 않습니다</td>'+
				'</tr>';
			}
    	  var table='<table class="board_list"><colgroup><col width="10%"/><col width="*"/><col width="20%"/><col width="20%"/></colgroup><thead><tr> <th scope="col">번호</th><th scope="col">제목</th><th scope="col">이벤트시작일</th><th scope="col">이벤트종료일</th></tr></thead><tbody>';
    	 
    	  $.each(data.list,function(index,row){
				
				table += '<tr>'+
				'<td>'+row.ET_NUM+'</td>'+
				' <td><a href="../event/eventDetail?ET_NUM='+row.ET_NUM+'">'+row.ET_TITLE+'</a></td>'+
				' <td>'+row.ET_SD+'</td>'+
				' <td>'+row.ET_FD+'</td>'
				'</tr>';
				
				 
				 	
			})
			table+='</tbody></table>';
    	  $("#div1").append(table);
    	  $('#categoryPaging').html(data.eventListPaging.pagingHTML);
			$('#currentPaging').addClass('active');
      },
      error:function(request,status,error){
          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
     
  	
  });
	
	
	

}


eventList(1,1);
</script>
<body>
<div id="b">
<div class="button">

<input type="button" value="공지사항" class="btn4" onClick="location.href='<c:url value='/notice/noticeList'/>';">	|   
<input type="button" value="이벤트" class="btn4" onClick="location.href='<c:url value='/event/eventList'/>';">|	    
<input type="button" value="FAQ"  class="btn4" onClick="location.href='<c:url value='/faq/faqlist'/>';">
	
</div>
	<br/><br/><br/>
	<h3 class="title">이벤트</h3>
	<br><br>
<table class="catelist">
<tr>
<td><button type="button" class="btn btn-block btn-outline-primary" onclick="eventList(1,1); return false;">진행중인 이벤트</button></td>
<td><button type="button" class="btn btn-block btn-outline-danger" onclick="eventList(2,1); return false;">종료된 이벤트</button></td>
</tr>
</table>
<br>
</div>
<div id="div1">
  
</div>
<div align="center"class="container pt-5" id="categoryPaging" >
  
   
   </div>
</body>
</html>