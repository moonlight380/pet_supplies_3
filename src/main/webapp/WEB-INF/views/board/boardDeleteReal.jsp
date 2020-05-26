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
		alert("삭제완료");
		location.href = "${path}";
	</script>

	<h2>${board}</h2>
	<h2>${vo.id}</h2>
	<h2>${vo.num}</h2>
	<h2>${member.id}</h2>

	<input type="hidden" value="${board}">
	<input type="hidden" value="${vo.id}">
	<input type="hidden" value="${vo.num}">
	<input type="hidden" value="${member.id}">

</body>
</html>