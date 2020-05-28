<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:if test="${board eq 'notice'}">
	<title>공지 수정폼</title>
</c:if>
<c:if test="${board eq 'qna'}">
	<title>QnA 수정폼</title>
</c:if>
<c:if test="${board eq 'review'}">
	<title>리뷰 수정폼</title>
</c:if>

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>

</head>
<c:import url="../template/header.jsp"></c:import>

<body style="padding-top: 150px; font-family: 'Do Hyeon', sans-serif; font-size: 19px;">



	<div class="container">

		<c:if test="${board eq 'notice'}">
			<h2 style="font-family: 'Do Hyeon', sans-serif; font-size: 59px;">공지
				수정폼</h2>
		</c:if>
		<c:if test="${board eq 'qna'}">
			<h2 style="font-family: 'Do Hyeon', sans-serif; font-size: 59px;">QnA
				수정폼</h2>
		</c:if>
		<c:if test="${board eq 'review'}">
			<h2 style="font-family: 'Do Hyeon', sans-serif; font-size: 59px;">리뷰
				수정폼</h2>
		</c:if>


		<form action="./${board}Update" id="frm" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="num" value="${vo.num}">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					value="${vo.title}" class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="writer">Writer:</label> <input type="text"
					disabled="disabled" value="${vo.id}" class="form-control" id="id"
					name="id">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="5" cols="" class="form-control" id="contents"
					name="contents"></textarea>
			</div>


			<input type="button" id="add" class="btn btn-info" value="AddFile">
			<div id="file"></div>

			<div class="form-group">
				<label for="contents">Files:</label>

				<c:forEach items="${vo.boardFileVOs}" var="fileVO">
					<p id="pdel">${fileVO.oriName}<i id="${fileVO.fileNum}"
							title="${fileVO.board}" class="fas fa-paw remove fileDelete"></i>
					</p>
				</c:forEach>

			</div>

			<input type="submit" id="btn" class="btn btn-danger" value="수정완료"
				style="margin-bottom: 3%;">
		</form>

	</div>


	<script type="text/javascript" src="../resources/script/boardForm.js"></script>
	<script type="text/javascript">
	
	var size = ${size};
	size = ${vo.boardFileVOs.size()};
	
	size = ${fn:length(vo.boardFileVOs)};
	
	count = count+size;
		
		$("#contents").summernote('code', '${vo.contents}');

		$(".fileDelete").click(function() {

			var check = confirm("Delete??");

			if (check) {
			
			var s = $(this);
			
			$.post("../boardFile/fileDelete", {
				fileNum : $(this).attr("id"),
				board : $(this).attr("title")
			}, function(data) {
				if (data> 0) {
					s.parent().remove();
					count--;
				} else {
					alert("파일삭제 실패");
				}
			})
			
			}//if
		})
		
		
	</script>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>