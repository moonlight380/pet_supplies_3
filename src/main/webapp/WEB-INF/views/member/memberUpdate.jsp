<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	
	<div class="container-fulid  mt-5">
		<div class="row">
		
		<c:import url="./memberSide.jsp"></c:import>
	
<div class="col" style="margin-top: 150px; margin-left: 250px;">
<form action="./memberUpdate" method="post" id="frm" style="font-style: inherit; font-size: small;">

				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col">
						<div class="row mb-4"
							style="border-bottom: solid 1px black; font-weight: bold; color: black;">
							<div style="margin-left: 21px; font-size: medium;">회원 정보 수정</div>
						</div>

<h4 style="float: right; margin-top: 20px; font-size: 14px;"><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수">필수입력사항</h4>

<table class="table table-bordered" style="margin-bottom: -1px;">

<colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>

<colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>
<tbody>
<tr>
<th scope="row">아이디 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id="id" name="id" readonly="readonly" value="${member.id}" type="text"><span id="idt" style="font-size: small;"> (영문소문자/숫자, 4~12자)</span></td>
 </tr>
 
<tr id="kakao" style="display: none;">
<c:if test="${kmember.kakaoId ne null}">
<th scope="row">비밀번호 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
 <td><input id="kakaopw" name="pw" class="input_Join" autocomplete="off" maxlength="16" type="password" readonly="readonly"><span id="pwt" style="font-size: small;"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span></td>
 </c:if>
</tr>

<tr id="mem">
<th scope="row">비밀번호 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
 <td><input id="pw" name="pw" class="input_Join" autocomplete="off" maxlength="16" type="password"><span id="pwt" style="font-size: small;"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span></td>
</tr>

<tr id="kaka" style="display: none;">
<c:if test="${kmember.kakaoId ne null}">
<th scope="row">비밀번호 확인 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id ="kakaocheck_pw" name="check_pw" class="input_Join" autocomplete="off" maxlength="16" type="password" readonly="readonly"><span id="pwc"></span></td>
</c:if>
</tr>

<tr id="member">
<th scope="row">비밀번호 확인 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id="check_pw" name="check_pw" class="input_Join" autocomplete="off" maxlength="16" type="password"><span id="pwc"></span></td>
</tr>

<tr>
<th scope="row" id="nameTitle">이름 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
  <td>
    <input style="width: 100px;" type="text" name="name" id="name" value="${member.name}" class="input_Join" maxlength="20"><span id="nameContents"></span>
  </td>
</tr>

<tr>
<th scope="row">이메일 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
 <td><input style="width: 250px;" id="email" name="email" class="input_Join" value="${member.email}" type="email"><span id="emailCheck"></span>
 </td>
</tr>

<tr class="">
<th scope="row">주소 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" class="" alt="필수"></th>
 <td>
   <input style="width: 80px;" id="postcode1" name="address" value="${member.address}" class="input_Join" placeholder="우편번호" readonly="readonly" maxlength="14" type="text">
   <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
   <input style="width: 400px;" id="addr1" name="addr1" value="${member.addr1}" class="input_Join" placeholder="기본주소" readonly="readonly"type="text" ><br>
   <input style="width: 250px;" id="addr2" name="addr2" value="${member.addr2}" class="input_Join" placeholder="상세주소" type="text">
 </td>
</tr>
<tr class="">
<th scope="row">휴대전화 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" class="" alt="필수"></th>
 <td><select id="mobile1" id="phone" class="input_Join tel" name="phone">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input style="width: 50px;" name="phone1" id="mobile2"class="input_Join tel" maxlength="4" value="${member.phone1}" type="text">-<input style="width: 50px;"name="phone2" id="mobile3" class="input_Join tel"  maxlength="4" value="${member.phone2}" type="text">
<span id="mobile"></span>
</td>
</tr>


<tr class="">
<th scope="row">생년월일</th>
<td>
<input id="birth" name="birth_year" placeholder="ex)19991104" maxlength="8" value="" type="text"> 
<input hidden="hidden" name=age id=age>
<input id="calendar0" name="calendar" value="T" type="radio" checked="checked"><label for="is_solar_calendar0">양력</label>
<input id="calendar1" name="calendar" value="F" type="radio"><label for="is_solar_calendar1">음력</label>
<span id="msg"></span>
</td>
</tr>


<tr class="sex">
<th scope="row">성별</th>
<td><input id="sex0" name="sex" value="M" type="radio"><label for="is_sex0">남자</label>
<input id="sex1" name="sex" value="F" type="radio" checked="checked"><label for="is_sex1">여자</label></td>
</tr>

</tbody>
</table>
</div>

</div>

</form>

<div class="row center"  style="margin-left:110px; ; margin-top: 50px; float: left;">
	<button type="button" id="button" class="btn btn-default">수정</button>
	<button type="button" id="cancel" class="btn btn-primary" onclick="goback()">취소</button>
</div>
<div style="float: right; margin-top: 10px;">
	<button type="button" id="delete" class="btn btn-danger btn-sm">회원탈퇴</button>
</div>

	
</div>

<div class="col-sm-2 "></div>

</div>
</div>


</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript" src="../resources/js/memberUpdate.js"></script>






</html>