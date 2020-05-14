<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.footersubbtn {
	height: 100%;
}

.product_search_form {
	width: 50%;
}


</style>

<!-- START HEADER -->
<header class="header_wrap fixed-top header_with_topbar">
	<div class="bottom_header dark_skin main_menu_uppercase">
		<div class="container">
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand" href="${pageContext.request.contextPath}">
					<img class="logo_light"
					src="${pageContext.request.contextPath}/resources/images/catdog.jpg"
					alt="logo" /> <img class="logo_dark"
					src="${pageContext.request.contextPath}/resources/images/catdog.jpg"
					alt="logo" />
				</a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent" aria-expanded="false">
					<span class="ion-android-menu"></span>
				</button>

				<div class="product_search_form rounded_input"
					style="margin-left: 30px;">
					<form>
						<div class="input-group">
							<div class="input-group-prepend">
								<div class="custom_select">
									<select class="first_null">
										<option value="">모든 카테고리</option>
										<option value="dog">강아지</option>
										<option value="cat">고양이</option>
										<option value="etc">기타</option>
									</select>
								</div>
							</div>
							<input class="form-control" placeholder="검색어 입력" required=""
								type="text">
							<button type="submit" class="search_btn2">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>

				<%-- 				<input type="text" placeholder="검색어입력"> <a
					href="${pageContext.request.contextPath}"
					class="nav-link searchmargin"-><i class="lineariconsmagnifier"></i></a> --%>


				<div class="collapse navbar-collapse justify-content-end"
					id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="dropdown"><a class="dropdown-toggle nav-link"
							href="#" data-toggle="dropdown">게시판</a>
							<div class="dropdown-menu">
								<ul>
									<li><a class="dropdown-item nav-link nav_item"
										href="about.html">회사 소개</a></li>
									<li><a class="dropdown-item nav-link nav_item"
										href="${pageContext.request.contextPath}/notice/noticeList">공지
											사항</a></li>
									<li><a class="dropdown-item nav-link nav_item"
										href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a class="dropdown-toggle nav-link"
							href="#" data-toggle="dropdown">제품</a>
							<div class="dropdown-menu">
								<ul>
									<li><a class="dropdown-item nav-link nav_item"
										href="${pageContext.request.contextPath}/product/dogBestList">베스트</a></li>
									<li><a class="dropdown-item nav-link nav_item"
										href="${pageContext.request.contextPath}/product/dogNewList">신상품</a></li>
									<li><a class="dropdown-item nav-link nav_item"
										href="${pageContext.request.contextPath}/product/dogTimeSale">행사상품</a></li>
								</ul>
							</div></li>

						<li><a class="nav-link nav_item"
							href="${pageContext.request.contextPath}/nav/contact">매장 위치</a></li>

					</ul>
				</div>

				<ul class="navbar-nav attr-nav align-items-center">

					<c:if test="${empty member}">
						<li><a href="#" class="nav-link"><i
								class="linearicons-user"></i></a>
							<div class="dropdown-menu">
								<ul>
									<li><a class="dropdown-item nav-link nav_item "
										href="${pageContext.request.contextPath}/member/memberLogin">로그인</a></li>
									<c:if test="${empty member}">
										<li><a class="dropdown-item nav-link nav_item"
											href="${pageContext.request.contextPath}/member/memberLogin">마이페이지</a></li>
									</c:if>
									<c:if test="${not empty member}">
										<li><a class="dropdown-item nav-link nav_item"
											href="${pageContext.request.contextPath}/member/memberPage">마이페이지</a></li>
									</c:if>
								</ul>
							</div></li>
					</c:if>

					<c:if test="${not empty member}">
						<li><a href="#" class="nav-link"><i
								class="linearicons-user"></i></a>
							<div class="dropdown-menu">
								<ul>
									<li><a class="dropdown-item nav-link nav_item "
										href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a></li>
									<li><a class="dropdown-item nav-link nav_item"
										href="${pageContext.request.contextPath}/member/memberPage">마이페이지</a></li>
								</ul>
							</div></li>
					</c:if>

					<c:if test="${not empty member}">
						<li><a class="nav-link"
							href="${pageContext.request.contextPath}/member/memberCart"><i
								class="linearicons-cart"></i><span class="cart_count">0</span></a></li>
					</c:if>
					<c:if test="${empty member}">
						<li><a class="nav-link"
							href="${pageContext.request.contextPath}/member/memberLogin"><i
								class="linearicons-cart"></i><span class="cart_count">0</span></a></li>
					</c:if>

				</ul>
			</nav>
		</div>
	</div>
</header>
<!-- END HEADER -->