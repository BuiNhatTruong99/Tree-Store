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

<title>Web</title>
</head>

<body>
		<!-- HEADER BEGIN -->
		<%@include file="/views/header/header.jsp"%>
		<!-- HEADER END -->

		<section class="slider owl-carousel owl-theme" id="owl-trans">
			<div class="slider-items slider-items-one">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider-content">
								<h1 class="fw-bold title">TOP SALE</h1>
								<p class="decs">
									Discount <span>20% Off </span> For Lukani Members
								</p>
								<a class="button" href="shop.html">Discover Now </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="slider-items slider-items-two">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider-content">
								<h1 class="fw-bold title">LOVELY PLANTS</h1>
								<p class="decs">
									Discount <span>20% Off </span> For Lukani Members
								</p>
								<a class="button" href="shop.html">Discover Now </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="slider-items slider-items-three">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider-content">
								<h1 class="fw-bold title">BIG SALE</h1>
								<p class="decs">
									Discount <span>20% Off </span> For Lukani Members
								</p>
								<a class="button" href="shop.html">Discover Now </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="shipping-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="single-shipping">
							<div class="shipping-icon">
								<i class="fas fa-truck-fast"></i>
							</div>
							<div class="shipping_content">
								<h3>Free Delivery</h3>
								<p>
									Free shipping around the world for all <br> orders over
									$120
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="single-shipping">
							<div class="shipping-icon">
								<i class="fas fa-credit-card"></i>
							</div>
							<div class="shipping_content">
								<h3>Safe Payment</h3>
								<p>
									With our payment gateway, donât worry <br> about your
									information
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="single-shipping">
							<div class="shipping-icon">
								<i class="fas fa-id-card"></i>
							</div>
							<div class="shipping_content">
								<h3>Friendly Services</h3>
								<p>
									You have 30-day return guarantee for <br> every single
									order
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="banner_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<figure class="single_banner">
							<div class="banner_thumb">
								<a href="shop.html"><img
									src="<c:url value='/images/Slide/banner1.png'/>" alt=""></a>
								<div class="banner_content">
									<h3>Big Sale Products</h3>
									<h2>
										Plants <br> For Interior
									</h2>
									<a href="shop.html">Shop Now</a>
								</div>
							</div>
						</figure>
					</div>
					<div class="col-lg-6 col-md-6">
						<figure class="single_banner">
							<div class="banner_thumb">
								<a href="shop.html"><img
									src="<c:url value='/images/Slide/slider2.png'/>" alt=""></a>
								<div class="banner_content">
									<h3>Top Products</h3>
									<h2>
										Plants <br> For Healthy
									</h2>
									<a href="shop.html">Shop Now</a>
								</div>
							</div>
						</figure>
					</div>
				</div>
			</div>
		</div>
		<section class="analysis"
			style="background-image: url('/images/Slide/analysis.png');">
			<div class="analysis_container">
				<div class="home-analysis__wrapper">
					<div class="home-analysis__content">
						<div class="home-analysis__content-text">
							<span class="home-analysis__content-name">Find out</span><span
								class="home-analysis__content-now">Now</span>
						</div>
						<div class="home-analysis__btn">
							<div class="triangle"></div>
						</div>
						<span class="gooey gooey1"></span><span class="gooey gooey2"></span><span
							class="gooey gooey3"></span>
					</div>
				</div>
				<div class="analysis_content container-fluid">
					<div class="row align-items-center">
						<div class="col-lg-3 col-content">
							<div style="opacity: 1;">
								<span class="home-analysis__qnt" style="opacity: 1;">350</span><span
									class="home-analysis__qnt">+</span>
							</div>
							<div class="home-analysis__description">Collections</div>
						</div>
						<div class="col-lg-3 col-content">
							<div style="opacity: 1;">
								<span class="home-analysis__qnt" style="opacity: 1;">2,678</span><span
									class="home-analysis__qnt">+</span>
							</div>
							<div class="home-analysis__description">Orders Everyday</div>
						</div>
						<div class="col-lg-3 col-content">
							<div style="opacity: 1;">
								<span class="home-analysis__qnt" style="opacity: 1;">60</span><span
									class="home-analysis__qnt"></span>
							</div>
							<div class="home-analysis__description">Skilled
								Professionals</div>
						</div>
						<div class="col-lg-3 col-content">
							<div style="opacity: 1;">
								<span class="home-analysis__qnt" style="opacity: 1;">30</span><span
									class="home-analysis__qnt"></span>
							</div>
							<div class="home-analysis__description">Order a day</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="blog_section">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="section_title">
							<h2>Our Latest Posts</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div
						class="blog_carousel blog_column3 owl-carousel owl-loaded owl-drag owl-theme">
						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(-1608px, 0px, 0px); transition: all 0.25s ease 0s; width: 4020px;">
								<div class="owl-item" style="width: 372px; margin-right: 30px;">
									<div class="col-lg-10 m-auto">
										<article class="single_blog">
											<figure>
												<div class="blog_thumb">
													<a href="blog-details.html"><img
														src="<c:url value='/images/Slide/1.jpg'/>" alt=""></a>
												</div>
												<figcaption class="blog_content">
													<h4 class="post_title">
														<a href="blog-details.html">Libero lorem</a>
													</h4>
													<div class="articles_date">
														<p>
															By <span>admin / July 16, 2021</span>
														</p>
													</div>
													<p class="post_desc">Donec vitae hendrerit arcu, sit
														amet faucibus nisl. Cras pretium arcu ex. Aenean posuere
														libero eu augue condimentum rhoncus praesent</p>
													<footer class="blog_footer">
														<a href="blog-details.html">Continue Reading</a>
														<p>
															<i class="fas fa-comment"></i><span>0</span>
														</p>
													</footer>
												</figcaption>
											</figure>
										</article>
									</div>
								</div>
								<div class="owl-item active"
									style="width: 372px; margin-right: 30px;">
									<div class="col-lg-10 m-auto">
										<article class="single_blog">
											<figure>
												<div class="blog_thumb">
													<a href="blog-details.html"><img
														src="<c:url value='/images/Slide/2.jpg'/>" alt=""></a>
												</div>
												<figcaption class="blog_content">
													<h4 class="post_title">
														<a href="blog-details.html">Blog image post</a>
													</h4>
													<div class="articles_date">
														<p>
															By <span>admin / July 16, 2021</span>
														</p>
													</div>
													<p class="post_desc">Donec vitae hendrerit arcu, sit
														amet faucibus nisl. Cras pretium arcu ex. Aenean posuere
														libero eu augue condimentum rhoncus praesent</p>
													<footer class="blog_footer">
														<a href="blog-details.html">Continue Reading</a>
														<p>
															<i class="fas fa-comment"></i><span>0</span>
														</p>
													</footer>
												</figcaption>
											</figure>
										</article>
									</div>
								</div>
								<div class="owl-item active"
									style="width: 372px; margin-right: 30px;">
									<div class="col-lg-10 m-auto">
										<article class="single_blog">
											<figure>
												<div class="blog_thumb">
													<a href="blog-details.html"><img
														src="<c:url value='/images/Slide/3.jpg'/>" alt=""></a>
												</div>
												<figcaption class="blog_content">
													<h4 class="post_title">
														<a href="blog-details.html">Post with Gallery</a>
													</h4>
													<div class="articles_date">
														<p>
															By <span>admin / July 16, 2021</span>
														</p>
													</div>
													<p class="post_desc">Donec vitae hendrerit arcu, sit
														amet faucibus nisl. Cras pretium arcu ex. Aenean posuere
														libero eu augue condimentum rhoncus praesent</p>
													<footer class="blog_footer">
														<a href="blog-details.html">Continue Reading</a>
														<p>
															<i class="fas fa-comment"></i><span>0</span>
														</p>
													</footer>
												</figcaption>
											</figure>
										</article>
									</div>
								</div>
								<div class="owl-item active"
									style="width: 372px; margin-right: 30px;">
									<div class="col-lg-10 m-auto">
										<article class="single_blog">
											<figure>
												<div class="blog_thumb">
													<a href="blog-details.html"><img
														src="<c:url value='/images/Slide/4.jpg'/>" alt=""></a>
												</div>
												<figcaption class="blog_content">
													<h4 class="post_title">
														<a href="blog-details.html">Post with Audio</a>
													</h4>
													<div class="articles_date">
														<p>
															By <span>admin / July 16, 2021</span>
														</p>
													</div>
													<p class="post_desc">Donec vitae hendrerit arcu, sit
														amet faucibus nisl. Cras pretium arcu ex. Aenean posuere
														libero eu augue condimentum rhoncus praesent</p>
													<footer class="blog_footer">
														<a href="blog-details.html">Continue Reading</a>
														<p>
															<i class="fas fa-comment"></i><span>0</span>
														</p>
													</footer>
												</figcaption>
											</figure>
										</article>
									</div>
								</div>
								<div class="owl-item cloned"
									style="width: 372px; margin-right: 30px;">
									<div class="col-lg-10 m-auto">
										<article class="single_blog">
											<figure>
												<div class="blog_thumb">
													<a href="blog-details.html"><img
														src="<c:url value='/images/Slide/1.jpg'/>" alt=""></a>
												</div>
												<figcaption class="blog_content">
													<h4 class="post_title">
														<a href="blog-details.html">Post with Gallery</a>
													</h4>
													<div class="articles_date">
														<p>
															By <span>admin / July 16, 2021</span>
														</p>
													</div>
													<p class="post_desc">Donec vitae hendrerit arcu, sit
														amet faucibus nisl. Cras pretium arcu ex. Aenean posuere
														libero eu augue condimentum rhoncus praesent</p>
													<footer class="blog_footer">
														<a href="blog-details.html">Continue Reading</a>
														<p>
															<i class="fas fa-comment"></i><span>0</span>
														</p>
													</footer>
												</figcaption>
											</figure>
										</article>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer class="footer_widgets">
			<%@include file="/views/footer/footer.jsp"%>
		</footer>
		
		<%@include file="/views/foot/linkfoot.jsp"%>

</body>

</html>