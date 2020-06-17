<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<script>
$(document).ready(function(){
	$.ajax({
		type : "POST",
		url : '<c:url value="/item/getItemMatch"/>',
		data : {type:"N",itemCount:"3"},
		async: false,
		success : function(data){
			var str="";
			$.each(data.list,function(index,items){

		        
		        str+='<div class="col-xs-6 col-sm-4 placeholder">'+
		        '<a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>"><img src="<c:url value="/images/item/'+items.ITEM_IMAGE1+'"/>" class="img-fluid mb-2" alt="Generic placeholder thumbnail"></a>'+
	             ' <a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>" style="font-family: Jua, cursive;  font-size: 17px;" class="text-center mb-2">'+items.ITEM_NAME+'</a>'+
	              '<hr/>'+
	              '<span class="card-text" style=" color:red; font-size: 15px;">₩ '+items.ITEM_FP+'</span>'+
	              '<span class="card-text ml-3"style="text-decoration: line-through;color:#A6A6A6; font-size: 14px;">₩ '+items.ITEM_PRICE+'</span>'+
	            '</div>';
			})
			$("#itemList1").append(str);
		}
		
	});	
	$.ajax({
		type : "POST",
		url : '<c:url value="/item/getItemMatch"/>',
		data : {type:"C",itemCount:"4"},
		async: false,
		success : function(data){
			var str="";
			$.each(data.list,function(index,items){

		        
		        str+='<div class="col-xs-6 col-sm-3 placeholder">'+
		        '<a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>"><img src="<c:url value="/images/item/'+items.ITEM_IMAGE1+'"/>" class="img-fluid mb-2" alt="Generic placeholder thumbnail"></a>'+
	             ' <a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>" style="font-family: Jua, cursive;  font-size: 17px;" class="text-center mb-2">'+items.ITEM_NAME+'</a>'+
	              '<hr/>'+
	              '<span class="card-text" style=" color:red; font-size: 15px;">₩ '+items.ITEM_FP+'</span>'+
	              '<span class="card-text ml-3"style="text-decoration: line-through;color:#A6A6A6; font-size: 14px;">₩ '+items.ITEM_PRICE+'</span>'+
	            '</div>';
			})
			$("#itemList2").append(str);
		}
		
	});	
	$.ajax({
		type : "POST",
		url : '<c:url value="/item/getItemMatch"/>',
		data : {type:"E",itemCount:"4"},
		async: false,
		success : function(data){
			var str="";
			$.each(data.list,function(index,items){

		        
		        str+='<div class="col-xs-6 col-sm-3 placeholder">'+
		        '<a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>"><img src="<c:url value="/images/item/'+items.ITEM_IMAGE1+'"/>" class="img-fluid mb-2" alt="Generic placeholder thumbnail"></a>'+
	             ' <a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>" style="font-family: Jua, cursive;  font-size: 17px;" class="text-center mb-2">'+items.ITEM_NAME+'</a>'+
	              '<hr/>'+
	              '<span class="card-text" style=" color:red; font-size: 15px;">₩ '+items.ITEM_FP+'</span>'+
	              '<span class="card-text ml-3"style="text-decoration: line-through;color:#A6A6A6; font-size: 14px;">₩ '+items.ITEM_PRICE+'</span>'+
	            '</div>';
			})
			$("#itemList3").append(str);
		}
		
		
	});		
	
	
		
});
	

</script>
<body>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <a href="<c:url value='/event/eventDetail?ET_NUM=1'/>"><img src="<c:url value='/images/main/main_banner_pc.jpg'/>" alt="Los Angeles" style="width: 100%;"></a>
      </div>
      
      <div class="carousel-item">
       <a href="<c:url value='/event/eventDetail?ET_NUM=3'/>"> <img src="<c:url value='/images/main/mainbanner_pc.jpg'/>" alt="Seoul" style="width: 100%;"></a>
      </div>
          
      <div class="carousel-item">
       <a href="<c:url value='/event/eventDetail?ET_NUM=2'/>"> <img src="<c:url value='/images/main/mainbanner_pc(1).jpg'/>" alt="New york" style="width: 100%;"></a>
      </div>

    </div>
    
  </div>
  
  <hr class="featurette-divider">
  
   <div class="container marketing">

      <!-- START THE FEATURETTES -->
      
      <div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <h1 class="page-header" style="font-family: Nanum Gothic, cursive; text-align: center;">BEST3</h1>
          <div class="row placeholders text-center" id="itemList1">
             
             
             
          </div>
        </div>
       </div>
      </div>
			
      <hr class="featurette-divider">
      
       <div class="container-fluid mt-5">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <h1 class="page-header mb-3" style="font-family: Nanum Gothic, cursive; text-align: center;">커플링 세트</h1>
          <div class="row placeholders text-center"id="itemList2">
           
          </div>
        </div>
       </div>
      </div>
          
      <hr class="featurette-divider">
      
      <div class="container-fluid mt-5">
         <img src="<c:url value='/images/main/mid_banner_01.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
          <a href=""></a>
      </div>
      
      <hr class="featurette-divider">
      
      <div class="container-fluid mt-5">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <h1 class="page-header mb-3" style="font-family: Nanum Gothic, cursive;  text-align:center;">주간인기상품</h1>
          <div class="row placeholders text-center" id="itemList3">
            
            
            
          </div>
        </div>
       </div>
      </div>
      <hr class="featurette-divider">
      <div class="mt-5">
      <iframe width="100%" height="356" src="https://www.youtube.com/embed/SnI2xfVnLBs?rel=0;amp;autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>   
      </div>
      <hr class="featurette-divider">
      
      <div class="container-fluid mt-5">
         <img src="<c:url value='/images/main/mid_banner_02.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
          <a href=""></a>
      </div>
      
      <hr class="featurette-divider mt-5">
      
      <div class="container-fluid mt-5">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-6">
              <img src="<c:url value='/images/main/main_mid01.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-6">
              <img src="<c:url value='/images/main/main_mid02.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
          </div>
        </div>
       </div>
      </div>
          
      <hr class="featurette-divider">
      
      <div class="container-fluid mt-5">
         <img src="<c:url value='/images/main/mid_banner_03.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
          <a href=""></a>
      </div>
      
      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
</div>
</div>

</body>

</html>