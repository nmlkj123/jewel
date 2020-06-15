<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>QNA</title>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function qnaPage(page){
	$("#qnaList tbody").empty();
	$.ajax({
	      type : "POST",
	      url : '<c:url value="/qna/qnalist"/>',
	      data : {ITEM_NUM: "${param.ITEM_NUM}",pg:page},
	      success : function(data){
	         var str = "";
	         var he="";
	         if(data.list.length>0){
	         $.each(data.list,function(index,items){
	        	 str+='<tr>'+
					'<td>'+items.QNA_NUM+'</td>'+
					'<td>'+items.ITEM_NUM+'</td>'+
					'<td class="title">'+
					'<a href="../qna/qnaPwConfirmForm?QNA_NUM='+items.QNA_NUM+'">['+items.QNA_CATE+']'+items.QNA_TITLE+'</a>'+	
					'<input type="hidden" id="FAQ_NUM" value="'+items.FAQ_NUM+'">'+
					'</td>'+
					'<td>';
					if(items.MEM_ID==null){
						str+=items.QNA_NAME;
					}else{
						str+=items.MEM_ID;
					}
					
					str+='</td>'+
					'<td>'+items.QNA_DATE+'</td>'+
					'<td>'+items.QNA_RSTATE+ '</td>'+
				'</tr>';

	            
	         
	         })
	         }else{
	        	 str +=' <tr>'+
					'<td colspan="6">조회된 결과가 없습니다.</td>'+
				'</tr>';
		     }
	         $("#qnaList tbody").append(str);
	         $('#categoryPaging2').html(data.qnaListPaging.pagingHTML);
			 $('#currentPaging2').addClass('active'); 
	      }
	});

}
qnaPage(1);
</script>
</head>
<body>
  

<br/><br/><br/><br/>
	<h2>QNA</h2>

	<table class="board_list" id="qnaList">
		<colgroup>
			<col width="10%"/>
			<col width="15%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">답변확인</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	<br/>
	
	
	<a href="<c:url value='/qna/qnaWriteForm?ITEM_NUM=${param.ITEM_NUM }'/>" class="btn1" id="write">글쓰기</a>
	 
		<div align="center"class="container pt-5" id="categoryPaging2" >
		
		</div>
</body>
</html>