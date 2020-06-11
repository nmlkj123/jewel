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
			
			$.each(data.list,function(index,items){
				$('<div/>',{
					class:"col-sm-4 pt-5"
				}).append($('<img>',{
					class:"img-fluid",
					src:"http://junjewelry.com/shopimages/koreajisuk/1270010011162.jpg?1569380755",
					click:function(){
						$(location).attr('href','<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>');
					}
				})).append($('<h4/>',{
					class:"text-center",
					text:"--JEWELS--"
				})).append($('<p/>',{
					class:"text-center",
					text:items.ITEM_NAME
				})).append($('<p/>',{
					class:"text-center",
					text:items.ITEM_PRICE+"원"
				}).css({
					'text-decoration':'line-through'
				})).append($('<p/>',{
					class:"text-center",
					text:items.ITEM_FP+"원"
				})).appendTo($('#imageBoard'));		
				
			})
			
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