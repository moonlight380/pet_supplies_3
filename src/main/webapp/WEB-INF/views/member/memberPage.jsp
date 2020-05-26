<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<style type="text/css">
.left {
	font-size: 15px;
	font-family: '돋움', dotum, sans-serif;
	line-height: 1.5;
	color: #333;
	font-weight: bold;
	
	
	
	 
	
}
.right{
	font-size: 15px;
	font-family: '돋움', dotum, sans-serif;
	line-height: 1.5;
	color: gray;
	font-weight: bold;
	
}
.box{
	position: relative;
    padding: 31px 0 18px 5px;
    border-bottom: 1px solid #e8e9ed;
}

</style>


<meta charset="UTF-8">
<title>Insert title here</title>




<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>


	<div class="container-fulid  mt-5">
		<div class="row ">
			<c:import url="./memberSide.jsp"></c:import>

			<div class="col ">
				<div class="row ">
					<div class="col ">
						<div class="row " style="height: 170px;">

							<div class="col text-center border fa fa-shopping-cart"
								style="color: #FF324D;">
								<span>주문배송</span>
								<div>
									<span style="font-size: 30px;">${ocount}</span>
								</div>
							</div>


							<div class="col text-center border fa fa-credit-card" style="color:#6699ff">
								<span>보유 쿠폰</span>
								<div>
								 	<span style="font-size: 30px">0</span>
								 </div>	
							</div>
									
							
							<div class="col text-center border fa fa-product-hunt" style="color:#ccad00">
								
								<span>포인트</span>
								
								<div>
								 	<span style="font-size: 30px">${member.point }</span>
								 </div>	
							</div>
							
							
						
						
						</div>
						
						<div class="row" style="margin-top: 100px;">
							<div class="col-sm-2"></div>
							<div class="col ">
								<div class="row">
									<div class="col border left box">
										<strong>아이디</strong>
									</div>
									<div class="col border right box">
										${member.id }
									</div>
								</div>
								<div class="row">
									<div class="col border left box">
										<strong>이름</strong>
									</div>
									<div class="col border right box">
										${member.name }
									</div>
								</div>
								<div class="row">
									<div class="col border left box">
										<strong>나이</strong>
									</div>
									<div class="col border right box">
										${member.age }
									</div>
								</div>
								<div class="row">
									<div class="col border left box">
										<strong>전화번호</strong>
									</div>
									<div class="col border right box">
										${member.phone }
									</div>
								</div>
								<div class="row">
									<div class="col border left box">
										<strong>E-Mail</strong>
									</div>
									<div class="col border right box">
										${member.email }
									</div>
								</div>
								<div class="row">
									<div class="col border left box">
										<strong>주소</strong>
									</div>
									<div class="col border right box ">
										${member.address }
									</div>
								</div>
								
							
							</div>
							<div class="col-sm-2"></div>
						</div>

						
					</div>
					
					
					<div class="col-sm-2">
						
					</div>
				
				</div>
			
			
			</div>
			 
			
			
			
			
		
		</div>
		
		
			<c:import url="../template/footer.jsp"></c:import>
		
	
	</div>
	
	
	
</body>



</html>