<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
	
<template:page pageTitle="${title}">
 
 
<!-- Header section end -->


<!-- Page info -->
<div class="page-top-info">
    <div class="container">
        <div class="site-pagination">
            <a href="">Home</a> /
            <a href="">Category</a>
        </div>
    </div>
</div>
<!-- Page info end -->


<!-- Category section -->
<input type="hidden" id="categoryCode" value="${categoryCode}"/>
<section class="category-section spad" id="categoryPageApp">
    <div class="container">
        <div class="row">

            <div class="col-lg-12  order-1 order-lg-2 mb-5 mb-lg-0">
                <div class="row">
					<c:forEach var="product" items="${productList}" >
                    <div class="col-lg-4 col-sm-6" v-for="(product, productIndex) in categoryPageData.products">
                        <div class="product-item">
                            <div class="pi-pic">
                                <!--<div class="tag-sale">ON SALE</div>-->
                                <a href="/apparel/p/${product.code}">
                                    <img src="/apparel/img/product/${product.image}.jpg" alt=""/>
                                </a>
                                <div class="pi-links">
                                    <a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
                                    <a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
                                </div>
                            </div>
                            <div class="pi-text">
                                <h6>${product.price} TL</h6>
                                <p>${product.name}</p>
                            </div>
                        </div>
                    </div>
					</c:forEach>
					
                    <div class="text-center w-100 pt-3">
                        <button class="site-btn sb-line sb-dark">LOAD MORE</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

</template:page> 