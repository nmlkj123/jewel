<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
.starRc{
	  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 10px;
	  height: 10px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
.starRc.oncs{background-position:0 0;}
</style>

<script>
function reviewPage(page){
	$("#reviewList tbody").empty();
	$.ajax({
	      type : "POST",
	      url : '<c:url value="/review/reviewList"/>',
	      data : {ITEM_NUM: "${param.ITEM_NUM}",pg:page},
	      success : function(data){
	         var str = "";
	         var he="";
	         if(data.list.length>0){
	         $.each(data.list,function(index,items){
	          
	               str += '<tr>'+
					'<td>'+items.RE_NUM+'</td>'+
					'<td class="title">'+
					'<a href="<c:url value="/review/reviewDetail?ITEM_NUM='+items.ITEM_NUM+'&RE_NUM='+items.RE_NUM+'"/>" id="write">'+items.RE_TITLE +'</a>'+
					'<input type="hidden" id="ITEM_NUM" value="'+items.ITEM_NUM +'">'+
					'</td>'+
					'<td>'+items.MEM_ID+'</td>'+
					'<td>'+items.RE_HIT+'</td>'+
					'<td>';
					for(var i=1;i<=5;i++){
						if(i>items.RE_LIKE){
						str+='<span class="starRc">별</span>';
						}else{
						str+='<span class="starRc oncs">별</span>';
						}
					}
					str+='</td>'+
					'<td>'+items.RE_DATE+'</td>'+
					'</tr>';

	            
	         
	         })
	         }else{
	        	 str +=' <tr>'+
					'<td colspan="6">조회된 결과가 없습니다.</td>'+
				'</tr>';
		     }
	         $("#reviewList tbody").append(str);
	         $('#categoryPaging').html(data.reviewListPaging.pagingHTML);
				$('#currentPaging').addClass('active'); 
	      }
	});

}
reviewPage(1);
</script>

	<h2>Review</h2>

	<table class="board_list" id="reviewList">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">평점</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody >
			
			
		</tbody>
	</table>
	
	<br/>
	
	<a href="<c:url value='/review/reviewWriteForm?ITEM_NUM=${param.ITEM_NUM}'/>" class="btn1" id="write">글쓰기</a>
	 
	<div align="center"class="container pt-5" id="categoryPaging" >

		</div>
