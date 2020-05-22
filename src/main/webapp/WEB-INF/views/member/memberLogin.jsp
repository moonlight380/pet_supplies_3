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
<c:import url="../template/header.jsp"></c:import>

<div class="container">


<div class="path" style="display: block; height: auto; width:100%; margin-top: 80px; text-align: right;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>로그인</strong></li>
	</ol>
</div>


<div style="text-align: center; display: block; border-bottom: 3px solid black;height: 100px; margin-top: 50px;">
<h1 style="font-weight: bold; font-size: 36px; margin-top: 30px;">로그인</h1>
</div>

<div class="row" style="margin-top: 50px;">
<div class="col"></div>
<div style="height: 600px; width:500px;">

<form class="form-signin" action="./memberLogin" method="post">

	<div class="text-center">
	<a href="${pageContext.request.contextPath}">
	<img class="m-5 mb-4" 
		src="${pageContext.request.contextPath}/resources/images/logo_dark.png"
		alt="" width="182" height="47">
	</a>
	</div>
	
	<input style="width: 400px; margin: 0 auto;" type="text" id="id" name="id" class="form-control" placeholder="아이디 입력" value="${cookie.cId.value}">
	<input style="width: 400px; margin: 0 auto;" type="password" id="pw" name="pw" class="form-control mt-2 mb-2" placeholder="비밀번호 입력" value="">
		
	<div style="margin-left: 50px;">		
		<label class="ml-0" style="font-size: small; font-style: inherit;"> <input type="checkbox" value="remember" name="remember">
			아이디 저장
		</label>
	</div>
	
	<button class="btn btn-lg btn-block" id="btn"style="background-color: #FF324D; width: 400px; margin: 0 auto; color: white;">로그인</button>
	
	<div class="text-center" style="font-size:medium; height: 50px; margin-top: 15px;">
		<a href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a> |
		<a href="${pageContext.request.contextPath}/member/memberID">아이디 찾기</a> |
		<a href="${pageContext.request.contextPath}/member/memberPW">비밀번호 찾기</a>
	</div>
	
</form>

<!-- kakao 로그인 -->
 <form action="./kakaoLogin" method="get">
	<div class="kakaoLogin" style="margin-top: 50px; width: 320px; margin: 0 auto;">
	
	<c:if test="${member.nickname eq null}">
	<a 		href="https://kauth.kakao.com/oauth/authorize?
			client_id=ccfe4411fa1bfc86a27222555a4dba8c
			&redirect_uri=http://localhost:8080/p1/member/kakaoLogin
			&response_type=code" >
		<img src="${pageContext.request.contextPath}/resources/images/kakao_login_btn_large_wide.png">
	</a>
	
	</c:if>
	
	
	</div>

</form> 
	
	<c:if test="${member.id ne null}">
        <input type="button" value="로그아웃" onclick="location.href='kakaoLogout'">
    </c:if>
  
<!-- naver 로그인 --> 
<!-- <div id = "naverIdLogin" style="margin: 0 auto; margin-left: 90px; margin-top: 10px;"></div>
    -->
    
</div> 

<div class="col"></div>

</div>
</div>


<!-- 

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
 
 네이버아디디로로그인 초기화 Script
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "dkthWuzZwGIygDF5_hF2",
			callbackUrl: "http://localhost:8080/p1/member/naverLogin",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
// 네이버아이디로로그인 초기화 Script
 
 
  -->
 
<!-- <script type="text/javascript">
 
         var naver_id_login = new naver_id_login("dkthWuzZwGIygDF5_hF2", "http://localhost:8080/p1/member/naverLogin");    // Client ID, CallBack URL 삽입
                                            // 단 'localhost'가 포함된 CallBack URL
         var state = naver_id_login.getUniqState();
        
         naver_id_login.setButton("green", 4, 70);
         naver_id_login.setDomain("http://localhost:8080/p1/member/memberLogin");    //  URL
         naver_id_login.setState(state);
         naver_id_login.setPopup();
         naver_id_login.init_naver_id_login();
 
</script> -->




</html>