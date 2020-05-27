<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
<style type="text/css"></style>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* .form-control-sm, .form-control-sm:focus, .custom_select select.form-control-sm,
	.custom_select select.form-control-sm:focus {
	height: 30px;
} */
/* .form-inline {
	margin: 0 auto;
} */
.section2 {
	padding: 15px 0;
	position: relative;
}

.hit {
	
}
</style>

</head>

<body>

	<c:import url="../template/header.jsp"></c:import>
	<div class="section2"></div>
	<div class="container">

		<c:if test="${board eq 'notice'}">
			<h2>공지</h2>
		</c:if>
		<c:if test="${board eq 'qna'}">
			<h2>QnA</h2>
		</c:if>
		<c:if test="${board eq 'review'}">
			<h2>리뷰게시판</h2>
		</c:if>

		<div class="section2"></div>

		<table class="table table-hover">
			<thead>
				<tr align="left">
					<th>글번호</th>
					<th width="50%">제목</th>
					<th>ID</th>
					<th style="padding-left: 1.65em">날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo" varStatus="status">
					<tr align="left">
						<td style="padding-left: 1.5em;">${listNo[status.index]}</td>
						<td width="50%"><c:catch>
								<!-- for(int i=0;i<=0;i++) -->
								<c:forEach begin="1" end="${vo.depth}">
					--
					<!-- &nbsp;&nbsp; -->
								</c:forEach>
							</c:catch> <a href="./${board}Select?num=${vo.num}">${vo.title}</a></td>
						<td style="padding-left: 0em;">${vo.id}</td>
						<td style="padding-left: 0;">${vo.regDate}</td>
						<td style="padding-left: 2em;">${vo.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:catch>
			<c:choose>
				<c:when test="${board eq 'notice'}">
					<c:if test="${member.id eq 'admin'}">
						<div align="right">
							<a href="./${board}Write" class="btn btn-danger">글쓰기</a>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${not empty member}">
						<div align="right">
							<a href="./${board}Write" class="btn btn-danger">글쓰기</a>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:catch>

		<c:if test="${not empty list}">
			<div class="row">
				<div class="col-12">
					<ul
						class="pagination mt-3 justify-content-center pagination_style1">
						<c:if test="${pager.curBlock gt 1}">
							<li class="page-item active"><a class="page-link"
								href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i">
							<li class="page-item"><a class="page-link"
								href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li class="page-item"><a class="page-link"
								href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>

	</div>

	<div class="section2"></div>

	<div class="form-group row justify-content-center">
		<form action="./${board}List" class="form-inline">
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="kind"
						id="searchType">
						<option value="bt">제목</option>
						<option value="bc">본문</option>
						<option value="bw">작성자</option>
					</select>
				</div>

				<div class="w300" style="padding-right: 10px">
					<input type="text" class="form-control form-control-sm"
						name="search" id="keyword">
				</div>

				<div>
					<button class="btn btn-sm btn-primary" type="submit"
						name="btnSearch" id="btnSearch">검색</button>
				</div>
			</div>
		</form>
	</div>

	<c:import url="../template/footer.jsp"></c:import>

</body>
</html>