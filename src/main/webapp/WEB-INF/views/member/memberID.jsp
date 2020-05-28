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

<div class="container" style="margin-bottom: 200px; margin-top: 150px;">

<div class="path" style="display: block; height: auto; width:100%; margin-top: 80px; text-align: right;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인 > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>아이디 찾기</strong></li>
	</ol>
</div>


<div style="text-align: center; display: block; border-bottom: 3px solid black;height: 100px; margin-top: 50px;">
<h1 style=" margin-top: 50px; font-weight: bold; font-size: 36px;">아이디 찾기</h1>
</div>

<div class="IDserch" style="height: 400px;">

<form action="./memberID" method="get" style=" width: 400px; height:100%; margin: 0 auto; margin-top: 50px;">
 
<fieldset>
<div style="margin-top: 30px; text-align: center; font-size: 24px; font-weight: bold;">
<p>아이디 찾기</p>
</div>

<div style="margin-left: 30%; font-size: small;">
<input id="check_email" name="check_find" type="radio" value="1" onclick="setDisplay()" checked="checked"><label for="check_email">이메일</label>
<input id="check_phone" name="check_find" type="radio" value="2" onclick="setDisplay()"><label for="check_phone">휴대폰 번호</label>
</div>

<div style="height: 57px;">
 <p id="name" class="name" ><strong style="font-size: small;">이름</strong>
  <input id="check_name" name="name" class="ec check_name pc" placeholder="" value="" type="text" style="margin-left: 80px;">
  <span id = "nameContents" style="margin-left: 110px; font-size: xx-small;"></span></p>
 </div>
<div id="find_email" style="margin-top: 1px;">
 <p id="email_view" class="email" ><strong style="font-size: small;">이메일 입력</strong> 
 <input id="email" name="email"class="ec" placeholder="" value="" type="email" style="margin-left: 37px;"></p>
 <div class="ec-base-button gColumn">
    <input id="email_btn" type="button" value="확인" class="btn btn-lg btn-block" style="background-color: #FF324D; width: 300px; height:50px; margin: 0 auto; font-size: small; text-align: center; color: white;"> 
</div>
 </div>

<div id="find_phone" style="display: none; font-size: small;">
 <p id="phone_view" class="phone" style=""><strong>휴대폰 입력</strong> 
 <select id="mobile1" name="phone" id="mobile1" class="input_Join tel pc" style="margin-left: 39px;">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input style="width: 50px;" id="mobile2" name="phone" class="input_Join tel pc" maxlength="4" value="" type="text">-<input style="width: 50px;" id="mobile3" class="input_Join tel pc" name="phone" maxlength="4" value="" type="text">
<div class="ec-base-button gColumn">
 	<input id="phone_btn" type="button" value="확인" class="btn btn-lg btn-block" style="background-color: #FF324D; width: 300px; height:50px; margin: 0 auto; font-size: small; text-align: center; color: white;"> 

   
</div>
</div>

</fieldset>
</form>

</div>
</div>

<c:import url="../template/footer.jsp"></c:import>

<script type="text/javascript" src="../resources/js/memberID.js"></script>


</body>
</html>