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
	
	
	
	<div class="container-fulid border mt-5">
		<c:import url="./memberSide.jsp"></c:import>
		<div class="row border">
			
			<div class="col border">
				<div class="row border">
					<div class="col border">
						<span>주문 조회</span>
						<div class="row border">
							<a href="#">주문한 물건...</a>  <!-- a태그 주문내역으로 product Num 통해서  -->
						</div>
						<div class="row border">
							<a href="#">주문한 물건...</a>
						</div>
					</div>
					
					
					
					<div class="col border">
						<span>구매 내역</span>
						<div class="row border">
							<a href="#">구매한 물건...</a> <!-- a태그 리뷰쓰는곳으로  product Num 통해서-->
						</div>
						<div class="row border">
							<a href="#">구매한 물건...</a>
						</div>
						<div class="row border">
							<a href="#">구매한 물건...</a>
						</div>
						<div class="row border">
							<a href="#">구매한 물건...</a>
						</div>
						<div class="row border">
							<a href="#">구매한 물건...</a>
						</div>
					</div>
					
				
				</div>
			
			
			</div>
		
		
		</div>
	
	
	</div>
	
</body>
</html>