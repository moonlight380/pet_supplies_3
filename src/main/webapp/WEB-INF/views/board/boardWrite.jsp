<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>

<c:import url="../template/header.jsp"></c:import>
<body style="padding-top: 150px">

	<div class="container">
		<h1>${board}작성폼</h1>


		<form action="./${board}Write" id="frm" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="writer">Writer:</label> <input type="text"
					class="form-control" id="id" value="${member.id}"
					readonly="readonly" name="id">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="20" cols="" class="form-control" id="contents"
					name="contents"></textarea>
			</div>

			<%
				String cpage = request.getParameter("productNum");
			%>
			<!-- <div id="num_1"></div> -->

			<input type="hidden" value="<%=cpage%>" name="productNum"
				id="productNum"> <input type="button" id="add"
				class="btn btn-info" value="파일추가" style="margin-bottom: 3%;">
			<div id="file"></div>

			<!-- contents Server null이 될때 
 		  <input type="hidden" name="contents" id="con">
 		-->


			<input type="button" id="btn" class="btn btn-danger" value="글쓰기"
				style="margin-bottom: 3%;">
		</form>

	</div>



	<!-- 	<script type="text/javascript">
	
	var pnum_1 = $("#.num_1").text;
	$("#.productNum").val = pnum_1;
	
	</script> -->

	<script type="text/javascript" src="../resources/script/boardForm.js"></script>
	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>