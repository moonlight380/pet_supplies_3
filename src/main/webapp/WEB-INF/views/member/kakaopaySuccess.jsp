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

<div class="path" style="display: block; float: right; position: relative; height: auto; margin-top: 50px; margin-right: 200px;">
		<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home ></a></li>
			<li style="display: inline;"><a href="${pageContext.request.contextPath}">장바구니 ></a></li>
			<li style="display: inline;">주문결제</li>
			<li style="display: inline;" title="현재 위치"><strong>주문완료 </strong></li>
		</ol>
</div>

<div class="container">

<div style="height: 800px;margin-top: 200px;">
<div style="text-align: center; display: block; border-bottom: 3px solid black;height: 100px; margin-top: 50px;">
<h1 style=" margin-top: 50px; font-weight: bold; font-size: 36px;">주문 완료</h1>
</div>

<div class="" style="margin: 0 auto; width: 800px; text-align: center; margin-top: 60px;">
<i class='far fa-check-circle' style='font-size:70px'></i>
<p style="margin-top: 30px;"><strong style="font-size: 30px;">고객님의 주문이 성공적으로 완료되었습니다.</strong><br>
주문내역 및 배송에 관한 안내는 <a href="#">주문조회</a> 를 통하여 확인 가능합니다.</p>
<p>주문번호 : <br>
주문날짜 : </p>

</div>


</div>
</div>




</body>
</html>