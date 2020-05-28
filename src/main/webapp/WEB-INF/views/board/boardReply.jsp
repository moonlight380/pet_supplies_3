<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:if test="${board eq 'notice'}">
	<title>공지 답글 작성폼</title>
</c:if>
<c:if test="${board eq 'qna'}">
	<title>QnA 답글 작성폼</title>
</c:if>
<c:if test="${board eq 'review'}">
	<title>리뷰 답글 작성폼</title>
</c:if>

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>
<c:import url="../template/header.jsp"></c:import>

<body style="padding-top: 150px; font-family: 'Do Hyeon', sans-serif; font-size: 19px;">

	<div class="container">

		<c:if test="${board eq 'notice'}">
			<h2 style="font-family: 'Do Hyeon', sans-serif; font-size: 59px;">공지 답글
				작성폼</h2>
		</c:if>
		<c:if test="${board eq 'qna'}">
			<h2 style="font-family: 'Do Hyeon', sans-serif; font-size: 59px;">QnA 답글
				작성폼</h2>
		</c:if>
		<c:if test="${board eq 'review'}">
			<h2 style="font-family: 'Do Hyeon', sans-serif; font-size: 59px;">리뷰 답글
				작성폼</h2>
		</c:if>

		<form action="./${board}Reply" id="frm" method="post">
			<input type="hidden" name="num" value="${num}">
			<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="Writer">작성자:</label> <input type="text"
					class="form-control" id="reply" name="id" value="${member.id}"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="contents">내용:</label>
				<textarea rows="5" cols="" class="form-control" id="contents"
					name="contents"></textarea>
			</div>

			<input type="submit" id="btn" class="btn btn-info" value="작성하기"
				style="margin-bottom: 3%;">
		</form>

	</div>


	<input type="hidden" value="${vo.id}">
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>