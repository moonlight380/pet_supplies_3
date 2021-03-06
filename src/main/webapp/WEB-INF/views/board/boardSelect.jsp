<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>

<style type="text/css">
.section2 {
	padding: 15px 0;
	position: relative;
}
</style>

<c:if test="${board eq 'notice'}">
	<title>공지 게시판</title>
</c:if>
<c:if test="${board eq 'qna'}">
	<title>QnA 게시판</title>
</c:if>
<c:if test="${board eq 'review'}">
	<title>리뷰 게시판</title>
</c:if>

</head>
<c:import url="../template/header.jsp"></c:import>
<body
	style="padding-top: 70px; font-family: 'Do Hyeon', sans-serif; font-size: 19px;">



	<div class="section">
		<div class="container">
			<div class="row">
				<div class="container">
					<div class="single_post">
						<h2 class="blog_title"
							style="font-family: 'Do Hyeon', sans-serif;">${vo.title}</h2>
						<ul class="list_none blog_meta">
							<li><a><i class="ti-calendar"></i>등록일 : ${vo.regDate} </a></li>
							<li><a
								href="./${board}List?kind=bw&search=${vo.id}&btnSearch="><i
									class="ti-comments"></i>작성자 : ${vo.id}</a></li>
						</ul>
						<div class="blog_content">
							<div class="blog_text">

								<blockquote class="blockquote_style3" style="color: black">
									<div
										style="width: 100%; overflow: hidden; word-wrap: break-word; color: black;">${vo.contents}</div>
									<c:forEach items="${vo.boardFileVOs}" var="boardfile">
										<div>
											<img alt=""
												src="../resources/${board}Upload/${boardfile.fileName}">
										</div>
									</c:forEach>
								</blockquote>

								<div align="left" style="float: left;"></div>
								<a href="./${board}List" class="btn btn-success">글 목록으로</a>
								<div style="float: right;">
									<a href="./${board}Update?num=${vo.num}"
										class="btn btn-primary">글수정</a> <a
										href="./${board}Delete?num=${vo.num}" class="btn btn-danger">글삭제</a>
									<c:if test="${board ne 'notice'}">
										<a href="./${board}Reply?num=${vo.num}" class="btn btn-info">답변달기</a>
									</c:if>
								</div>

								<div class="blog_post_footer">
									<div class="row justify-content-between align-items-center">
										<div class="col-md-4">
											<ul class="social_icons text-md-right"
												style="width: 100%; margin-left: 216%;">
												<li><a href="http://www.facebook.com"
													class="sc_facebook" target="_blank"><i
														class="ion-social-facebook"></i></a></li>
												<li><a href="http://www.twitter.com" class="sc_twitter"
													target="_blank"><i class="ion-social-twitter"></i></a></li>
												<li><a href="http://www.google.com" class="sc_google"
													target="_blank"><i class="ion-social-googleplus"></i></a></li>
												<li><a href="http://youtube.com" class="sc_youtube"
													target="_blank"><i class="ion-social-youtube-outline"></i></a></li>
												<li><a href="http://instagram.com" class="sc_instagram"
													target="_blank"><i class="ion-social-instagram-outline"></i></a></li>
											</ul>
										</div>
									</div>
								</div>

								<c:if test="${board ne 'qna'}">
									<c:if test="${board ne 'review'}">
										<div style="float: left;">
											<a href="./${board}Select?num=${maxNum}" class="btn btn-link"
												id="previous" title="${maxNum}">이전글로</a>
										</div>

										<div style="float: right;">
											<a href="./${board}Select?num=${minNum}" class="btn btn-link"
												id="next" title="${minNum}">다음글로</a>
										</div>
									</c:if>
								</c:if>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<input type="hidden" title="${vo.num}" id="compareNum">

	<script type="text/javascript">
		$("#previous").click(
				function() {
					if ($("#compareNum").attr("title") == $("#previous").attr(
							"title")) {
						alert("맨 처음 글입니다");
					}
				})

		$("#next").click(function() {
			if ($("#compareNum").attr("title") == $("#next").attr("title")) {
				alert("맨 마지막 글입니다");
			}
		})
	</script>


	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>