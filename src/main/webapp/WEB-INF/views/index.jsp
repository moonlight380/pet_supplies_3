<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<c:import url="./template/boot.jsp"></c:import>
<c:import url="./template/css.jsp"></c:import>

<style type="text/css">
.footersubbtn {
	height: 100%;
}
</style>


</head>
<body>

	<c:import url="./template/header.jsp"></c:import>

	<!-- START SECTION BANNER -->
	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="${pageContext.request.contextPath}/resources/images/index_1.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/resources/images/index_2.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/resources/images/index_3.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleFade"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleFade"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- END SECTION BANNER -->

	<!-- END MAIN CONTENT -->
	<div class="main_content">

		<!-- START SECTION BANNER -->
		<div class="section pb_20">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="single_banner">
							<img
								src="${pageContext.request.contextPath}/resources/images/singleb1.png"
								alt="shop_banner_img1" />
							<div class="single_banner_info">
								<h5 class="single_bn_title1">Super Sale</h5>
								<h3 class="single_bn_title">New Collection</h3>
								<a href="shop-left-sidebar.html" class="single_bn_link">Shop
									Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="single_banner">
							<img
								src="${pageContext.request.contextPath}/resources/images/singleb2.png"
								alt="shop_banner_img2" />
							<div class="single_banner_info">
								<h3 class="single_bn_title">New Season</h3>
								<h4 class="single_bn_title1">Sale 40% Off</h4>
								<a href="shop-left-sidebar.html" class="single_bn_link">Shop
									Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END SECTION BANNER -->

		<!-- START SECTION SHOP -->
		<div class="section small_pt pb_70">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6">
						<div class="heading_s1 text-center">
							<h2>이주의 상품</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="tab-style1">
							<ul class="nav nav-tabs justify-content-center" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="arrival-tab" data-toggle="tab" href="#arrival" role="tab"
									aria-controls="arrival" aria-selected="true">신상품</a></li>
								<li class="nav-item"><a class="nav-link" id="sellers-tab"
									data-toggle="tab" href="#sellers" role="tab"
									aria-controls="sellers" aria-selected="false">베스트 셀러</a>
								</li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="arrival"
								role="tabpanel" aria-labelledby="arrival-tab">
								<div class="row shop_container">

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품1</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품2</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품3</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품4</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품5</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품6</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품7</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-lg-3 col-md-4 col-6">
										<div class="product">
											<div class="product_img">
												<a href="shop-product-detail.html"> <img
													src="${pageContext.request.contextPath}/resources/images/item1.jpg"
													alt="product_img1">
												</a>
												<div class="product_action_box">
													<ul class="list_none pr_action_btn">
														<li class="add-to-cart"><a href="#"><i
																class="icon-basket-loaded"></i> Add To Cart</a></li>
														<li><a
															href="${pageContext.request.contextPath}/resources/images/item1.jpg"
															class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
														<li><a href="#"><i class="icon-heart"></i></a></li>
													</ul>
												</div>
											</div>
											<div class="product_info">
												<h6 class="product_title">
													<a href="shop-product-detail.html">상품8</a>
												</h6>
												<div class="product_price">
													<span class="price">$45.00</span>
													<del>$55.25</del>
													<div class="on_sale">
														<span>35% Off</span>
													</div>
												</div>
												<div class="rating_wrap">
													<div class="rating">
														<div class="product_rate" style="width: 80%"></div>
													</div>
													<span class="rating_num">(21)</span>
												</div>
												<div class="pr_desc">
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Phasellus blandit massa enim. Nullam id varius nunc
														id varius nunc.</p>
												</div>
												<div class="pr_switch_wrap">
													<div class="product_color_switch">
														<span class="active" data-color="#87554B"></span> <span
															data-color="#333333"></span> <span data-color="#DA323F"></span>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
							<!--first row end -->


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- END SECTION SHOP -->


	<!-- START SECTION TESTIMONIAL -->
	<div class="section bg_redon">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="heading_s1 text-center">
						<h2> 이주의 우수 리뷰</h2>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div
						class="testimonial_wrap testimonial_style1 carousel_slider owl-carousel owl-theme nav_style2"
						data-nav="true" data-dots="false" data-center="true"
						data-loop="true" data-autoplay="true" data-items='1'>
						<div class="testimonial_box">
							<div class="testimonial_desc">
								<p>강아지 사료 잘먹었습니다.</p>
							</div>
							<div class="author_wrap">
								<div class="author_img">
									<img
										src="${pageContext.request.contextPath}/resources/images/mainbanner.jpg"
										alt="user_img1" />
								</div>
								<div class="author_name">
									<h6>작성자1</h6>
									<span>상품명</span>
								</div>
							</div>
						</div>
						<div class="testimonial_box">
							<div class="testimonial_desc">
								<p>고양이 사료를 강아지가 먹었어요.</p>
							</div>
							<div class="author_wrap">
								<div class="author_img">
									<img
										src="${pageContext.request.contextPath}/resources/images/mainbanner.jpg"
										alt="user_img2" />
								</div>
								<div class="author_name">
									<h6>작성자2</h6>
									<span>상품명</span>
								</div>
							</div>
						</div>
						<div class="testimonial_box">
							<div class="testimonial_desc">
								<p>빠른 배송 감사합니다.</p>
							</div>
							<div class="author_wrap">
								<div class="author_img">
									<img
										src="${pageContext.request.contextPath}/resources/images/mainbanner.jpg"
										alt="user_img3" />
								</div>
								<div class="author_name">
									<h6>작성자3</h6>
									<span>상품명</span>
								</div>
							</div>
						</div>
						<div class="testimonial_box">
							<div class="testimonial_desc">
								<p>리뷰리뷰리뷰리뷰리뷰리뷰리뷰리뷰</p>
							</div>
							<div class="author_wrap">
								<div class="author_img">
									<img
										src="${pageContext.request.contextPath}/resources/images/mainbanner.jpg"
										alt="user_img4" />
								</div>
								<div class="author_name">
									<h6>작성자4</h6>
									<span>상품명</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END SECTION TESTIMONIAL -->

	<!-- START SECTION SHOP INFO -->
	<div class="section pb_70">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-lg-4">
					<div class="icon_box icon_box_style1">
						<div class="icon">
							<i class="flaticon-shipped"></i>
						</div>
						<div class="icon_box_content">
							<h5>무료 배송</h5>
							<p>저희 쇼핑몰의 모든 상품은 무료배송입니다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="icon_box icon_box_style1">
						<div class="icon">
							<i class="flaticon-money-back"></i>
						</div>
						<div class="icon_box_content">
							<h5>한달 동안 무료 환불</h5>
							<p>저희는 제품에 문제가 발생할 경우를 대비해, 한달간 무료 반품 서비스를 제공합니다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="icon_box icon_box_style1">
						<div class="icon">
							<i class="flaticon-support"></i>
						</div>
						<div class="icon_box_content">
							<h5>24시간 고객 지원</h5>
							<p>챗봇 서비스와 고객센터를 통해 24시간 서비스를 지원합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END SECTION SHOP INFO -->

	<!-- START SECTION SUBSCRIBE NEWSLETTER -->
	<div class="section bg_default small_pt small_pb">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<div class="heading_s1 mb-md-0 heading_light">
						<h3>이벤트 소식 받기</h3>
					</div>
				</div>
				<div class="col-md-6">
					<div class="newsletter_form">
						<form>
							<input type="text" required="" class="form-control rounded-0"
								placeholder="Enter Email Address">
							<button type="submit" class="btn btn-dark footersubbtn"
								name="submit" value="Submit">
								<h4 style="color: white">구독하기</h4>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- START SECTION SUBSCRIBE NEWSLETTER -->

	</div>
	<!-- END MAIN CONTENT -->

	<c:import url="./template/footer.jsp"></c:import>
</body>
</html>
