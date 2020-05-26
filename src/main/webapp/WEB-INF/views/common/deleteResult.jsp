<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var result = confirm('정말 삭제하시겠습니까?');

		if (result) {
			location.href = "${truePath}";
		} else {
			location.href = "${path}";
		}
	</script>

	<input type="hidden" value="${board}">
	<input type="hidden" value="${vo.id}">
	<input type="hidden" value="${vo.num}">
	<input type="hidden" value="${member.id}">

</body>
</html>