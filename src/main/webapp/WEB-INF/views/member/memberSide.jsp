<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>



<div class="col-sm-2" style="margin-top: 30px;">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col" style="border: 1px solid black; margin-bottom: 10px;">
			<div class="row">
				<div class="col text-center" style="background-color: #e0e0eb; width: 221px;height: 256px">
					

						<a href="#"> <i class="far fa-grin text-center"
							style="font-size: 94px; color: white; margin: 0 auto; padding-top: 25px"></i>
						</a>
				

					<div style="color:white; margin-top: 20px;">${member.id }님</div>
					<div class="btn btn-danger" id="update">
							<b style="font-size:13px;">회원정보 조회 및 수정	</b>					
					</div>
					<div style="margin-top: 5px;">
						<i class='fab fa-product-hunt' style="color:#FF324D"></i><a> 보유 포인트 : ${member.point}</a>
					</div>
				
				</div>
			</div>
		
			<ul style="margin-bottom: 50px;">
		
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberOrderInfo">주문조회</a></li>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberPurchase">구매내역</a></li>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberCart">장바구니</a></li>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberReview">상품 리뷰</a></li>

				
		
	
		
			</ul>		
		
		
		</div>
		<div class="col-sm-2"></div>
	
	
	</div>
</div>


<script type="text/javascript">
	$("#update").click(function() {
		location.href="./memberUpdate";
	});

</script>



</html>
