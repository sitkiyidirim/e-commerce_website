<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
	
<template:page pageTitle="${title}">

<form  id="addToCartForm"  action="/cart/add(${_csrf.parameterName}=${_csrf.token})" ></form>
<!-- Header section end -->

<input type="hidden" id="productCode" value="${productCode}"/>

<!-- Page info -->
<div class="page-top-info">
	<div class="container">
		<div class="site-pagination">
			<a href="">Home</a> /
			<a href="">Product</a>
		</div>
	</div>
</div>
<!-- Page info end -->


<!-- product section -->
<section class="product-section" id="productDetailPage">
	<div class="container">
		<div class="back-link">
			<a href="./category.html"> &lt;&lt; Back to Category</a>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="product-pic-zoom">
					<img class="product-big-img" src="/apparel/img/single-product/1.jpg" alt="" />
				</div>
				<div class="product-thumbs" tabindex="1" style="overflow: hidden; outline: none;">
					<div class="product-thumbs-track">
						<div class="pt active" data-imgbigurl="/apparel/img/single-product/1.jpg"><img src="/apparel/img/single-product/thumb-1.jpg" alt="" /></div>
						<div class="pt" data-imgbigurl="/apparel/img/single-product/2.jpg"><img src="/apparel/img/single-product/thumb-2.jpg" alt="" /></div>
						<div class="pt" data-imgbigurl="/apparel/img/single-product/3.jpg"><img src="/apparel/img/single-product/thumb-3.jpg" alt="" /></div>
						<div class="pt" data-imgbigurl="/apparel/img/single-product/4.jpg"><img src="/apparel/img/single-product/thumb-4.jpg" alt="" /></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 product-details" >
				<h2 class="p-title">${product.name}</h2>
				<h3 class="p-price">${product.price}</h3>
				<h4 class="p-stock">Available: <span>In Stock</span></h4>
				<div class="p-rating">
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o"></i>
					<i class="fa fa-star-o fa-fade"></i>
				</div>
				<div class="p-review">
					<a href="">3 reviews</a>|<a href="">Add your review</a>
				</div>
				<div class="quantity">
					<p>Quantity</p>
					<div class="pro-qty">
						<span class="dec qtybtn" @click="decQuantity">-</span>
						<input type="text" value="1" />
						<span class="inc qtybtn" @click="incQuantity">+</span>
					</div>
				</div>
				<button @click="addToCart" class="site-btn">SHOP NOW</button>
				<div id="accordion" class="accordion-area">
					<div class="panel">
						<div class="panel-header" id="headingOne">
							<button class="panel-link active" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">information</button>
						</div>
						<div id="collapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
							<div class="panel-body">
								${product.description}
							</div>
						</div>
					</div>
					<div class="panel">
						<div class="panel-header" id="headingTwo">
							<button class="panel-link" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">care details </button>
						</div>
						<div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
							<div class="panel-body">
								<img src="/apparel/img/cards.png'" alt="" />
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
							</div>
						</div>
					</div>
					<div class="panel">
						<div class="panel-header" id="headingThree">
							<button class="panel-link" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">shipping &amp; Returns</button>
						</div>
						<div id="collapse3" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
							<div class="panel-body">
								<h4>7 Days Returns</h4>
								<p>Cash on Delivery Available<br />Home Delivery <span>3 - 4 days</span></p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="social-sharing">
					<a href=""><i class="fa fa-google-plus"></i></a>
					<a href=""><i class="fa fa-pinterest"></i></a>
					<a href=""><i class="fa fa-facebook"></i></a>
					<a href=""><i class="fa fa-twitter"></i></a>
					<a href=""><i class="fa fa-youtube"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- product section end -->


</template:page>