<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<script type="text/javascript">
 function start(pg){
	 $.ajax({
		  
	      url : '<c:url value="/adminDeliveryList"/>',
	      dataType :"json",
	      data:{pg:pg},
	      success : function(data){
	    	  
	    	  var table='<div class="row">'+
	              '<div class="col-12">'+
	            '<div class="card">'+
	       
	              '<div class="card-body table-responsive p-0">'+
	    
	    '<table class="table table-head-fixed text-nowrap"><thead> <tr> <th scope="col">배송 현황 번호</th><th scope="col">구분 번호</th><th scope="col">주문번호</th><th scope="col">날짜</th><th scope="col">배송상태</th></tr></thead><tbody id="tbody">';
	    	 
	    	  $.each(data.list,function(index,items){
					
					table += '<tr>'+
					'<td>'+items.DEL_NUM+'</td>'+
					' <td>'+items.OR_UNQ+'</td>'+
					' <td>'+items.OR_NUM+'</td>'+
					' <td>'+items.DEL_DATE+'</td>'+
					' <td><a href="adminDeliveryDetail?DEL_NUM='+items.DEL_NUM+'">'+items.DEL_DS+'</a></td>'
					'</tr>';
					
					 
					 	
				})
				table+='</tbody></table></div></div></div></div>';
	    	  $("#div1").append(table);
	    	  $("#categoryPaging").html(data.AdminDeliveryListPaging.pagingHTML);	
	      },
	      error:function(request,status,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         }

	  
	      });
 }


function normalList(pg){
	$("#div1").empty();
	$.ajax({
		  
	      url : '<c:url value="/adminDeliveryList"/>',
	      dataType :"json",
	      data:{pg:pg},
	      success : function(data){
	    	  
	    	  var table='<div class="row">'+
              '<div class="col-12">'+
	            '<div class="card">'+
	            
	              '<div class="card-body table-responsive p-0">'+
	    		  '<table class="table table-head-fixed text-nowrap"><thead> <tr> <th scope="col">배송 현황 번호</th><th scope="col">구분 번호</th><th scope="col">주문번호</th><th scope="col">날짜</th><th scope="col">배송상태</th></tr></thead><tbody id="tbody">';
	    	  if(data.list.length==0){
					table += '<tr>'+
					'<td colspan="5">데이터가 존재하지 않습니다</td>'+
					'</tr>';
				}
	    	  $.each(data.list,function(index,items){
					
					table += '<tr>'+
					'<td>'+items.DEL_NUM+'</td>'+
					' <td>'+items.OR_UNQ+'</td>'+
					' <td>'+items.OR_NUM+'</td>'+
					' <td>'+items.DEL_DATE+'</td>'+
					' <td><a href="adminDeliveryDetail?DEL_NUM='+items.DEL_NUM+'">'+items.DEL_DS+'</a></td>'+
					'</tr>';
					
					 
					 	
				})
				table+='</tbody></table></div></div></div></div>';
	    	  $("#div1").append(table);
	    	  $("#categoryPaging").html(data.AdminDeliveryListPaging.pagingHTML);	
	      },
	      error:function(request,status,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         }

	  
	      });
	
	
	
}
function refundList(pg){
	$("#div1").empty();
	$.ajax({
		  
	      url : '<c:url value="/adminRefundList"/>',
	      dataType :"json",
	      data:{pg:pg},
	      success : function(data){
	    	  
	    	  var table='<div class="row">'+
              '<div class="col-12">'+
	            '<div class="card">'+
	              
	              <!-- /.card-header -->
	              '<div class="card-body table-responsive p-0">'+
	    		  '<table class="table table-head-fixed text-nowrap"><thead> <tr> <th scope="col">배송 현황 번호</th><th scope="col">구분 번호</th><th scope="col">주문번호</th><th scope="col">날짜</th><th scope="col">배송상태</th></tr></thead><tbody id="tbody">';
	    	  if(data.list.length==0){
					table += '<tr>'+
					'<td colspan="5">데이터가 존재하지 않습니다</td>'+
					'</tr>';
				}
	    	  $.each(data.list,function(index,items){
					
					table += '<tr>'+
					'<td>'+items.DEL_NUM+'</td>'+
					' <td>'+items.OR_UNQ+'</td>'+
					' <td>'+items.OR_NUM+'</td>'+
					' <td>'+items.DEL_DATE+'</td>'+
					' <td><a href="adminDeliveryDetail?DEL_NUM='+items.DEL_NUM+'">'+items.DEL_DS+'</a></td>'+
					'</tr>';
					
					 
					 	
				})
				table+='</tbody></table></div></div></div></div>';
	    	  $("#div1").append(table);
	    	  $("#categoryPaging").html(data.AdminDeliveryListPaging.pagingHTML);		
	      },
	      error:function(request,status,error){
	          alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         }

	  
	      });
	
	
}
start(1);
</script>
<body>
<div id="b">
<table>
<tr>
<td><button type="button" class="btn btn-block btn-outline-primary" onclick="normalList(1);">일반 배송</button>
</td>
<td><button type="button" class="btn btn-block btn-outline-danger" onclick="refundList(1);">교환/반품</button></td>

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