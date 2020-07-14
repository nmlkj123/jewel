<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<script>
$(document).ready(function(){
	$.ajax({
		type : "POST",
		url : '<c:url value="/item/getItemMatch"/>',
		data : {type:"${param.ITEM_TYPE}",itemCount:"9"},
		success : function(data){
			var str="";
			$.each(data.list,function(index,items){

				str+='<div class="col-md-4">'+
		         ' <div class="card mb-4 shadow-sm">'+
					'<a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>"><img class="card-img-top" alt=""height="300px" src="<c:url value="/images/item/'+items.ITEM_IMAGE1+'"/>" ></a>'+
		           ' <div class="card-body text-center">'+
		             ' <a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>" style="font-family: Jua, cursive;  font-size: 17px;" class="text-center mb-2">'+items.ITEM_NAME+'</a>'+
		              '<hr/>'+
		              '<span class="card-text" style=" color:red; font-size: 15px;">₩ '+items.ITEM_FP+'</span>'+
		              '<span class="card-text ml-3"style="text-decoration: line-through;color:#A6A6A6; font-size: 14px;">₩ '+items.ITEM_PRICE+'</span>'+
		              
		              '<div class="d-flex justify-content-between align-items-center">'+
		                
		                '<small class="text-muted">JEWELS</small>'+
		              '</div>'+
		            '</div>'+
		          '</div>'+
		        '</div>';
				
			})
			$("#itemMatchDiv").append(str);
		}
		
	});		
	

	
		
});
	

</script>
 <div class="album py-5 bg-light">
    <div class="container">
      <div class="row" id="itemMatchDiv">
      
        
       

      </div>
    </div>
  </div>
 