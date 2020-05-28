<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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

<div class="container"  style="margin-bottom: 200px;">

<div class="path" style="display: block; height: auto; width:100%; margin-top: 80px; text-align: right;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인 > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>비밀번호 찾기</strong></li>
	</ol>
</div>

<div style="text-align: center; display: block; border-bottom: 3px solid black;height: 100px; margin-top: 50px;">
<h1 style=" margin-top: 50px; font-weight: bold; font-size: 36px; margin-bottom: 15px;">비밀번호 찾기</h1>
</div>
<div style="height: 400px;">
<div style=" width: 400px; height:100%; margin: 0 auto; text-align: center; margin-top: 50px">
	<i class='fas fa-paw' style="font-size: 36px; margin-top: 30px;" ></i>
	<div class="contensts" style="margin-top: 10px;">
	<p>${param.id} 고객님의 임시 비밀번호가 <br>
	 ${param.mailto} 로 전송됐습니다!</p>
	<p>로그인 후 비밀번호를 변경해 주세요.</p>
	</div>
	
	<button id="find_btn" class="btn btn-info" style="background-color: #FF324D; border: none; width: 300px; margin-top: 10px;" onclick="login()">로그인하기</button>
	<p style="font-size: small;">이메일을 찾을 수 없나요?<u> <a href="javascript:reload();">임시비밀번호 재전송</a></u></p>
</div>

</div>

</div>

<c:import url="../template/footer.jsp"></c:import>

<script type="text/javascript">

function reload() {
	location.reload();
	alert("메일을 재발송했습니다!");
}

function login() {
	location.href="./memberLogin";
};




</script>


</body>
</html>