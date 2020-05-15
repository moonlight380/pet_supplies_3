<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.popup-footer{
width: auto;
height: 15px;
}

</style>

</head>
<body>


<img alt="popup" src="${pageContext.request.contextPath}/resources/images/popup.jpg">



<script type="text/javascript">
$(document).ready(function() {
	$("#popupClose").click(function() { 
		self.close();
	}); 
});
</script>



</body>
</html>

