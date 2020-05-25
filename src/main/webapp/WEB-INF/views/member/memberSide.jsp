<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>





<div class="col-sm-2">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col" style="border: 1px solid black">
			<div class="row">
				<div class="col text-center" style="background-color:#bbbfc3; width: 221px;height: 256px">
					

						<a href="#"> <i class="far fa-grin text-center"
							style="font-size: 94px; color: white; margin: 0 auto; padding-top: 25px"></i>
						</a>
				

					<div style="color:white">${member.id }님</div>
					<div class="btn btn-danger" id="update">
							<b style="font-size:13px;">회원정보수정	</b>					
					</div>
					
				
				</div>
			</div>
		
			<ul>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberPage">회원정보</a></li>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberOrderInfo">주문조회</a></li>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberPurchase">구매내역</a></li>
				<li class="ml-5 mt-5"><a href="${pageContext.request.contextPath}/member/memberCart">장바구니</a></li>
				<li class="ml-5 mt-5">쿠폰/포인트</li>
				<li class="ml-5 mt-5">상품 리뷰</li>
				<li class="ml-5 mt-5">상품Q&amp;A</li>
				
		
		
		
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
