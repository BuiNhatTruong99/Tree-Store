<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <%@include file="/views/head/linkhead.jsp"%>
    <title>Index</title>
</head>

<body>
	<!-- HEADER BEGIN -->
    <%@include file="/views/header/header.jsp"%>
    <!-- HEADER END -->
    
    <div class="container">
        <div class="row m-3">
            <div class="bwp-single-image col-lg-5 col-md-12 col-12 text-center">
                <div class="left-detail col-md-10 col-lg-12 m-auto">
                    <div class="img-size">
                    	<!-- ẢNH SẢN PHẨM -->
                        <img src="<c:url value='/images/product/${spchitiet.anh}'/>" alt="">
                    </div>
                </div>
            </div>
            <div class="bwp-single-infor col-lg-7 col-md-12 col-12">
                <div class="right-detail">
                	<!-- TÊN SẢN PHẨM -->
                    <h1 itemprop="name" class="product_title entry-title">${spchitiet.tensp}</h1>
                    <!-- GIÁ SẢN PHẨM -->
                    <div class="price-single">
                        <div class="price">
                        	<span class="woocommerce-Price-amount amount">
                        		<span class="woocommerce-Price-currencySymbol">$</span>
                        			${spchitiet.gia}
                        	</span>
                        </div>
                    </div>
                    <!-- MÔ TẢ -->
                    <div class="fw-bold text-secondary">Mô tả</div>
                    <div itemprop="description" class="description col-10">
                    	<!-- Nếu sản phẩm có mô tả -->
                        <c:if test="${not empty spchitiet.mota}">
                        	<p>${spchitiet.mota}</p>
                        </c:if>
                        <!-- Nếu sản phẩm không có mô tả -->
                        <c:if test="${empty spchitiet.mota}">
                        	<p>Sản phẩm này hiện chưa có mô tả, chúng tôi sẽ cập nhật sau. Xin vui lòng chờ đợi!</p>
                        </c:if>
                    </div>
                    <div class="cart">
                        <div class="quantity-button">
                            <span>Quantity</span>
                            <div class="quantity">
                                <input type="number" id="quantity_6333fa0a4b0d4" class="input-text qty text" step="1"
                                    min="1" max="" name="quantity" value="1" title="Qty" size="4" placeholder=""
                                    inputmode="numeric" autocomplete="off">
                            </div>
                            <a type="submit" href="/giohang/them/${spchitiet.id_sp}" class="single_add_to_cart_button button alt text-decoration-none">Add to cart</a>
                        </div>
                        <div class="like-button">
                            <button><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-heart" viewBox="0 0 16 16">
                                    <path
                                        d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                </svg></button>
                        </div>
                    </div>
                    <div class="icon-cart">
                        <ul>
                            <li class="bg-primary"><a href="#"><i class="fa-brands fa-facebook"></i></i></a></li>
                            <li class="bg-info"><a href="#"><i class="fa-brands fa-twitter" aria-hidden="true"></i></a></li>
                            <li class="bg-warning"><a href="#"><i class="fa-brands fa-google-plus" aria-hidden="true"></i></a></li>
                            <li class="bg-danger"><a href="#"><i class="fa-brands fa-youtube" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
    
        </div>
    </div>
    
    <footer class="footer_widgets">
        <%@include file="/views/footer/footer.jsp"%>
    </footer>
    
	<%@include file="/views/foot/linkfoot.jsp"%>
	
</body>

</html>