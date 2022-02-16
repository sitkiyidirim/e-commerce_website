<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
	
<template:page pageTitle="${title}">
 
<div class="page-top-info">
    <div class="container">
        <div class="site-pagination">
            <a href="">Home</a> /
            <a href="">Cart</a>
        </div>
    </div>
</div>

<!-- cart section end -->
<section class="cart-section spad" id="cartPage">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="cart-table">
					<h3>Your Cart</h3>
					<div class="cart-table-warp">
						<table>
							<thead>
							<tr>
								<th class="product-th">Product</th>
								<th class="quy-th">Quantity</th>
								<th class="size-th">SizeSize</th>
								<th class="total-th">Price</th>
								<th class=""></th>
							</tr>
							</thead>
							<tbody>
							<tr v-for="entry in cartData.entries">
								<td class="product-col">
									<img src="/apparel/img/cart/1.jpg" alt="" />
									<div class="pc-title">
										<h4>{{entry.product.name}}</h4>
										<p>{{entry.basePrice.valueStr}}</p>
									</div>
								</td>
								<td class="quy-col">
									<div class="quantity">
										<div class="pro-qty">
											<span class="dec qtybtn" @click="decQuantity(entry.entryNumber)">-</span>
											<input type="text" :value="entry.qty" />
											<span class="inc qtybtn" @click="incQuantity(entry.entryNumber)">+</span>
										</div>
									</div>
								</td>
								<td class="size-col"><h4>{{entry.product.size}}</h4></td>
								<td class="total-col"><h4>{{entry.totalPrice.valueStr}}</h4></td>
								<td><h4><i @click="removeEntry(entry.entryNumber)" class="flaticon-remove"></i></h4></td>
							</tr>
							</tbody>
						</table>
					</div>
					<div class="total-cost">
						<h6>Total <span v-if="cartData.totalPrice != null">{{cartData.totalPrice.valueStr}}</span></h6>
					</div>
				</div>
			</div>
			<div class="col-lg-4 card-right">
				<form class="promo-code-form">
					<input type="text" placeholder="Enter promo code" />
					<button>Submit</button>
				</form>
				<a href="<c:url value='/checkout/single' />"class="site-btn">Proceed to checkout</a>
				<a href="" class="site-btn sb-dark">Continue shopping</a>
			</div>
		</div>
	</div>
</section>
<!-- cart section end -->

   <script type="text/javascript" src="${cdnUrl}/vue/cart/cart-detail.js"></script>
</template:page>



