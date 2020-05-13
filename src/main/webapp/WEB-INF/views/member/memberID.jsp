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

<div class="container">

<div class="path" style="display: block; float: right; position: relative; height: auto;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인 > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>아이디 찾기</strong></li>
	</ol>
</div>

<div style="margin-top: 100px; text-align: center;">
<h1 style="border: 1px solid red; margin-bottom: 30px; font-weight: bold; font-size: 36px;">아이디 찾기</h1>
</div>
<div class="IDserch" style="border: 1px solid #d7d5d5; height: 400px;">

<form action="./memberID" method="get" style="border: 1px solid black; width: 400px; height:100%; margin: 0 auto;">
 
<fieldset>
<legend>아이디 찾기</legend>
<p class="member"><strong>회원유형</strong>
<input value="개인회원" readonly="readonly">
</p>

<input title="e" class="radio1" id="check_email" name="check_find" type="radio" value="1" checked="checked"><label for="check_email">이메일</label>
<input title="p" class="radio1" id="check_phone" name="check_find" type="radio" value="2"><label for="check_phone">휴대폰 번호</label>

<div id="find_email">
 <p id="name_view" class="name" style=""><strong id="name_lable">이름</strong>
  <input id="name" name="name" class="lostInput" placeholder="" value="" type="text"></p>

 <p id="email_view" class="email" style=""><strong>이메일로 찾기</strong> 
 <input id="email" name="email"class="lostInput" placeholder="" value="" type="text"></p>
 <div class="ec-base-button gColumn">
    <button type="submit">확인</button>
</div>
 </div>

<div id="find_phone">
 <p id="name_view" class="name" style=""><strong id="name_lable">이름</strong>
  <input id="name" name="name" class="lostInput" placeholder="" value="" type="text"></p>
  
 <p id="phone_view" class="phone" style=""><strong>휴대폰 번호로 찾기</strong> 
 <select id="mobile1" name="phone" id="mobile1" class="input_Join tel">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input style="width: 50px;" id="mobile2" name="phone" class="input_Join tel" maxlength="4" value="" type="text">-<input style="width: 50px;" id="mobile3" class="input_Join tel" name="phone" maxlength="4" value="" type="text">
<div class="ec-base-button gColumn">
    <button type="submit">확인</button>
   
</div>
</div>

</fieldset>
</form>

</div>
</div>

</body>
</html>