<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="<c:url value='/resources/css/default.css'/>" rel="stylesheet">
</head>

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
        <img src="<c:url value='/images/main/main_banner_pc.jpg'/>" alt="Los Angeles" style="width: 100%;">
      </div>
      
      <div class="carousel-item">
        <img src="<c:url value='/images/main/mainbanner_pc.jpg'/>" alt="Seoul" style="width: 100%;">
      </div>
          
      <div class="carousel-item">
        <img src="<c:url value='/images/main/mainbanner_pc(1).jpg'/>" alt="New york" style="width: 100%;">
      </div>

    </div>
    
  </div>
  
  <hr class="featurette-divider">
  
   <div class="container marketing">

      <!-- START THE FEATURETTES -->
      
      <div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <h1 class="page-header" style="text-align: center;">BEST3</h1>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-4">
              <img src="<c:url value='/images/main/md_c_01.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-4">
              <img src="<c:url value='/images/main/md_c_02.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-4">
              <img src="<c:url value='/images/main/md_c_03.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
          </div>
        </div>
       </div>
      </div>

      <hr class="featurette-divider">
      
       <div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <h1 class="page-header" style="text-align: center;">주간인기상품</h1>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_01.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_02.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_03.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_04.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
          </div>
        </div>
       </div>
      </div>
          
      <hr class="featurette-divider">
      
      <div class="container-fluid">
         <img src="<c:url value='/images/main/mid_banner_01.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
          <a href=""></a>
      </div>
      
      <hr class="featurette-divider">
      
      <div class="container-fluid">
      <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-0 main">
          <h1 class="page-header" style="text-align: center;">주간인기상품</h1>
          <div class="row placeholders text-center">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_01.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href="<c:url value="/item/itemDetail?ITEM_NUM='+items.ITEM_NUM+'"/>" style="font-family: Jua, cursive;  font-size: 17px;" class="text-center mb-2">ddd</a>
		              <hr/>
		              <span class="card-text" style=" color:red; font-size: 15px;">₩ 1000</span>
		              <span class="card-text ml-3"style="text-decoration: line-through;color:#A6A6A6; font-size: 14px;">₩ 1000</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_02.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_03.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="<c:url value='/images/main/md_c_04.png'/>" class="img-fluid" alt="Generic placeholder thumbnail">
              <a href=""></a>
            </div>
          </div>
        </div>
       </div>
      </div>
          
      <hr class="featurette-divider">
      
      <div class="container-fluid">
         <img src="<c:url value='/images/main/mid_banner_02.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
          <a href=""></a>
      </div>
      
      <hr class="featurette-divider">
      
      <div class="container-fluid">
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
      
      <div class="container-fluid">
         <img src="<c:url value='/images/main/mid_banner_03.jpg'/>" class="img-fluid" alt="Generic placeholder thumbnail">
          <a href=""></a>
      </div>
      
      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
</div>
</div>

</body>

</html>