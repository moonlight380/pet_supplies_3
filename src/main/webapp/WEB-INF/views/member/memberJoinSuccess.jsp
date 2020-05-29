<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoinSuccess</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="wrap"  style="margin-bottom: 200px; margin-top: 150px;">
<div class="container">

<div class="path" style="display: block; height: auto; width:100%; margin-top: 80px; text-align: right;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인 > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>회원가입</strong></li>
	</ol>
</div>


<div id="contents"  style="margin-top: 100px;height: 700px;">

<div style="text-align: center; display: block; border-bottom: 3px solid black;height: 100px; margin-top: 50px;">
<h1 style=" margin-top: 50px; font-weight: bold; font-size: 36px; margin-bottom: 30px;">회원 가입</h1>
</div>

<div class="joincomplete" style="margin: 0 auto; text-align: center;">

<div class="joinComplete" style="margin: 0 auto; width: 80%; height: 250px; margin-top: 50px;">

<h3><img style="height: 100px;" src="${pageContext.request.contextPath}/resources/images/logo_index.jpeg" alt="회원가입"></h3>

<p class="desc" style="font-size: 30px; margin-top: 30px;"><i class='fas fa-paw' style="font-size: 28px;"></i>
<strong style="color: #FF324D;">OH!DALI</strong> 회원가입을 축하합니다!
<i class='fas fa-paw' style="font-size: 28px;"></i></p>

<div class="ec-base-box typeMember gMessage">
<strong class="message">회원가입이 완료되었습니다</strong>
<p style="font-size: small; color: #FF324D">가입 시 받은 적립금은 바로 사용하실 수 있습니다.</p>

</div>
 
</div>

<p class="ec-base-button">
	<button onclick="login()" class="btn" style="background-color: #FF324D; color: white;">로그인</button>
	<button onclick="main()" class="btn btn-info" style="color: white;">메인으로 이동</button>
</p>

</div>
</div>

</div>
</div>

<script type="text/javascript">

function login() {
	location.href="./memberLogin";
}

function main() {
	location.href="../";
}

</script>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>