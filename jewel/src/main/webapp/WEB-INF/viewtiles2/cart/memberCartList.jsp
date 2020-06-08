<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/minty/bootstrap.min.css">

<body>

<div class="header-right">

	<div class="nav-search search-switch">
	<span class="flaticon-search"></span>
	</div>
	<a href="login.html"><span class="flaticon-user"></span></a>
	<a href="cart.html"><span class="flaticon-shopping-cart"></span></a>
	</div>
</div>

<div class="col-12">
<div class="mobile_menu d-block d-lg-none"></div>
</div>
</div>
</div>
</div>

</header>
<main>

<div class="slider-area ">
<div class="single-slider slider-height2 d-flex align-items-center">
<div class="container">
<div class="row">
<div class="col-xl-12">
<div class="hero-cap text-center">
<h2>Cart List</h2>
</div>
</div>
</div>
</div>
</div>
</div>

<section class="cart_area section_padding">
<div class="container">
<div class="cart_inner">
<div class="table-responsive">
<table class="table">
<thead>
<tr>
<th scope="col">Product</th>
<th scope="col">Price</th>
<th scope="col">Quantity</th>
<th scope="col">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<div class="media">
<div class="d-flex">
<img src="file:///C:/Users/학생용/Documents/workspace-sts-3.9.12.RELEASE/asdasd/WebContent/img/R_BF_001.jpg" class="img-rounded" alt="Cinque Terre" width="150" height="155" />
</div>
<div class="media-body">
<p>Minimalistic shop for multipurpose use</p>
</div>
</div>
</td>
<td>
<h5>$360.00</h5>
</td>
<td>
<div class="product_count">
<span class="input-number-decrement"> <i class="ti-minus"></i></span>
<input class="input-number" type="text" value="1" min="0" max="10">
<span class="input-number-increment"> <i class="ti-plus"></i></span>
</div>
</td>
<td>
<h5>$720.00</h5>
</td>
</tr>
<tr>
<td>
<div class="media">
<div class="d-flex">
<img src="file:///C:/Users/학생용/Documents/workspace-sts-3.9.12.RELEASE/asdasd/WebContent/img/R_BF_001.jpg" class="img-rounded" alt="Cinque Terre" width="150" height="155" />
</div>
<div class="media-body">
<p>Minimalistic shop for multipurpose use</p>
</div>
</div>
</td>
<td>
<h5>$360.00</h5>
</td>
<td>
<div class="product_count">
<span class="input-number-decrement"> <i class="ti-minus"></i></span>
<input class="input-number" type="text" value="1" min="0" max="10">
<span class="input-number-increment"> <i class="ti-plus"></i></span>
</div>
</td>
<td>
<h5>$720.00</h5>
</td>
</tr>
<tr class="bottom_button">
<td>
<a class="btn_1" href="#">Update Cart</a>
</td>
<td></td>
<td></td>
<td>
<div class="cupon_text float-right">
<a class="btn_1" href="#">Close Coupon</a>
</div>
</td>
</tr>
<tr>
<td></td>
<td></td>
 <td>
<h5>Subtotal</h5>
</td>
<td>
<h5>$2160.00</h5>
</td>
</tr>
<tr class="shipping_area">
<td></td>
<td></td>
<td>
<a class="btn_1" href="#">Update Details</a>
</div>
</td>
</tr>
</tbody>
</table>
<div class="checkout_btn_inner float-right">
<a class="btn_1" href="#">Continue Shopping</a>
<a class="btn_1 checkout_btn_1" href="#">Proceed to checkout</a>
</div>
</div>
</div>
</section>

</main>

</body>
</html>