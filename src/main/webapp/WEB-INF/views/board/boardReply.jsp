<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h1>${board}replyForm</h1>


		<form action="./${board}Reply" id="frm" method="post">
			<input type="hidden" name="num" value="${num}">
			<div class="form-group">
				<label for="title">제목:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="Writer">작성자:</label> <input type="text"
					class="form-control" id="reply" name="id">
			</div>
			<div class="form-group">
				<label for="contents">내용:</label>
				<textarea rows="5" cols="" class="form-control" id="contents"
					name="contents"></textarea>
			</div>




			<input type="submit" id="btn" class="btn btn-default" value="작성하기">
		</form>

	</div>

	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>