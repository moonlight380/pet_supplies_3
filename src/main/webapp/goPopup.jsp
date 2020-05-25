<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--위치는 WEBAPP 밑에 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#popClose_btn{
margin-left: 0px;
}


</style>

</head>
<body>

<div class="container">
<img alt="popup" src="${pageContext.request.contextPath}/resources/images/samplePopup.jpg">
<input id="popClose_btn" type='BUTTON' value="닫기x" onClick="self.close()">
</div>

</body>
</html>
