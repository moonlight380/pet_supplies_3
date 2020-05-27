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
	<s:authorize access="isAuthenticated()">
		<div class="col-md-auto">
			<c:if test="${member.id eq vo.id}">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-secondary" data-toggle="modal"
					data-target="#exampleModal">삭제</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">게시물을 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="clickDel(boardInfo)">삭제하기</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소하기</button>
							</div>
						</div>
					</div>
				</div>

				<script>
					function clickDel(formName) {
						formName.action = "./${board}Delete?num=${vo.num}";
						formName.method = "get";
						formName.submit();
					}
				</script>
			</c:if>
		</div>
	</s:authorize>
	${pageContext.request.contextPath}
	<input type="hidden" value = "${vo.num}">

</body>
</html>