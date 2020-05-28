<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>404 page</title>

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>

<style type="text/css"></style>


</head>

<body style="padding-top: 70px; font-family: 'Do Hyeon', sans-serif;">

	<c:import url="../template/header.jsp"></c:import>

	<!-- START MAIN CONTENT -->
	<div class="main_content">

		<!-- START 404 SECTION -->
		<div class="section">
			<div class="error_wrap">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-lg-6 col-md-10 order-lg-first">
							<div class="text-center">
								<div class="error_txt"
									style="font-family: 'Do Hyeon', sans-serif; font-size: 250px;">
									404 <img
										src="${pageContext.request.contextPath}/resources/images/icon_404.gif"
										style="width: 159px; height: auto" />
								</div>
								<h5 class="mb-2 mb-sm-3"
									style="font-family: 'Do Hyeon', sans-serif; font-size: 35px;">페이지를
									찾지 못하였습니다.</h5>
								<p>해당 페이지가 삭제 또는 수정되었는지 다시 한번 확인해 주세요!</p>
								<div class="search_form pb-3 pb-md-4">

									<!-- 									<form method="post">
										<input name="text" id="text" type="text" placeholder="Search"
											class="form-control">
										<button type="submit" class="btn icon_search">
											<i class="ion-ios-search-strong"></i>
										</button>
									</form> -->
								</div>

								<a href="${pageContext.request.contextPath}"
									class="btn btn-fill-out">처음 페이지로 돌아가기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END 404 SECTION -->
	</div>
	<!-- END MAIN CONTENT -->

	<c:import url="../template/footer.jsp"></c:import>

</body>

</html>