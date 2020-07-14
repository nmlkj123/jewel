<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<script>
$(document).ready(function(){
	$.ajax({
		type : "POST",
		url : '<c:url value="/item/getItemList"/>',
		data : {pg: "${pg}",type:"${type}",sort:"${sort}",keyword:"${keyword}"},
		success : function(data){
			var str="";
			$.each(data.list,function(index,items){
				str+='<div class="col-md-4 ">'+
		         ' <div class="card mb-4  border-0">'+
					'<a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>"><img class="card-img-top" alt=""height="300px" src="<c:url value="/images/item/'+items.ITEM_IMAGE1+'"/>" ></a>'+
		           ' <div class="card-body text-center">'+
		             ' <a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>" style="font-family: Jua, cursive;  font-size: 20px;" class="text-center mb-2">'+items.ITEM_NAME+'</a>'+
		              '<hr style="border:solid 2px;width:25px;color:#A6A6A6;"/>'+
		              '<span class="card-text" style=" color:red; font-size: 15px;">₩ '+items.ITEM_FP+'</span>'+
		              '<span class="card-text ml-3"style="text-decoration: line-through;color:#A6A6A6; font-size: 14px;">₩ '+items.ITEM_PRICE+'</span>'+
		              
		              '<div class="d-flex justify-content-between align-items-center">'+
		                
		                '<small class="text-muted mt-2">JEWELS</small>'+
		              '</div>'+
		            '</div>'+
		          '</div>'+
		        '</div>';	
				
			})
			$("#imageBoard").append(str);
			$('#categoryPaging').html(data.itemListPaging.pagingHTML);
			$('#currentPaging').addClass('active'); 
		}
		
	});		
		
	$('#sortDiv a').click(function(){
		var id=$(this).attr('id');
		location.href='<c:url value="/item/itemList?type=${type}&sort='+id+'&keyword=${keyword}"/>';
		
	});

	
		
});
	

</script>
<style type="text/css">


.sort-tab {
    width: 100%;
    height: 32px;
    font-size: 11px;
    line-height: 30px;
    color: #828282;
    text-align: right;

}

.sort-tab a{
   cursor:pointer;
}

.sort-price {
    width: 100%;
    height: 32px;
    font-size: 11px;
    line-height: 30px;
    color: #828282;
    text-align: center;

}
.sort-price a{
    cursor:pointer;
}

.sort-tab .on {
    font-weight: bold;
}
</style>


</head>

<body>

		<div id="sortDiv" class="sort-tab center-block"  >
			<a id="1" >신상품순</a>
			<span class="separation-bar">|</span> 
			<a id="2" >인기상품순</a>
			<span class="separation-bar">|</span> 
			<a id="3" >낮은가격순</a>
			<span class="separation-bar">|</span> 
			<a id="4" >높은가격순</a>
		</div>
	
	<div class="container pt-5">
	 <div class="row" id="imageBoard"> <!-- left content --> </div> 
	 

	<div align="center"class="container pt-5" id="categoryPaging" ></div>	
	

		
			
			
		
</div>

	
	


</body>
</html>