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

<style type="text/css">
.table_title {
	font: 0.75em "Malgun Gothic", "Gulim", "Tahoma", "Verdana", "Arial",
		"sans-serif", Verdana, Dotum, AppleGothic, sans-serif;
	padding: 13px 0px 15px;
	vertical-align: middle;
	font-weight: normal;
	color: black;
	text-align: center;
	border-bottom: 1px solid #9ca0aa;
}

.material-icons {
	background-color: white;
	color: gray;
	font-size: 20px;
	border: 1px solid gray;
}
.sum_text{
	color:red;
	font-weight: bold;

}

</style>
</head>


<body id="result">
	<c:import url="../template/header.jsp"></c:import>

	<div class="container-fulid  mt-5" id="step" title="step1">
		<div class="row">
			<c:import url="./memberSide.jsp"></c:import>

			<div class="col">
				<c:import url="./cartStep.jsp"></c:import>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col" style="margin-top: 100px; padding: 0px;">
						<div
							style="font-size: 12px; color: black; border-bottom: solid 1px black; padding: 15px;">
							<div class="row" style="vertical-align: middle;">

								<div style="padding-top: -2px; margin-left: 3px;">장바구니 목록</div>
								<div class='cart_count'	id="id" title="${member.id}" style="margin-left: 4px; top: 0px; margin-top: 1px;">
									
									<c:if test="${not empty member}">
										${cartCount }
									</c:if>
									<c:if test="${empty member }">		<!-- 로그인했을 때만 들어올수 있어서 지워도 괜찮 -->
										0
									</c:if>						
									
								</div>
							</div>
						</div>
						
						
						
			
						
					<c:if test="${empty cart}">
						<div class="row mt-5 mb-5" >
							<div class="col text-center">
								<i class="linearicons-cart" style="font-size: 50px"></i>
							</div>
						
						</div>
						
						
						<div class="row mb-5">
							<div class="col text-center" style="font-weight: 2px; color: black;">
								장바구니에 담긴 상품이 없습니다.
							</div>
						</div>
					
						<div class="row">
							<div class="col text-center">
									<a href="${pageContext.request.contextPath}"
										class="btn btn-danger" style="font-size: 16px;">쇼핑
										홈 가기</a>
							</div>
						</div>
					</c:if>	
						
					<c:if test="${not empty cart}">
					<div>
						<div class="row" style="padding: 0px 15px 15px 15px;" >
							<table>
								<colgroup>
									<col style="width: 27px" />

									<col style="width: 250px" />
									<col style="width: 400px" />
									<col style="width: 150px" />
									<col style="width: 120px" />
									<col style="width: 100px" />

									<col style="width: 130px" />



								</colgroup>
								<thead>
									<tr class="table_title"  style="text-align: center;   line-height: 60px;">
										<th scope="col" ><input type="checkbox" id="check_all" hidden="hidden"
											title="checkbox" ><div class="row" style="height: 10px;"></div><label style="margin: 0 auto;"
											for="check_all" class="material-icons checkbox"
											title="check_all"> check </label></th>
										<th scope="col">이미지</th>
										<th scope="col">상품정보</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">적립금</th>


										<th scope="col">합계</th>


									</tr>
								</thead>




								<c:forEach items="${cart }" var="cart">
								
									<tbody>
										<tr class="table_title">
											<td>
												<input type="checkbox" class="check" id="${cart.id}${cart.cnum}_check" hidden="hidden" title="${cart.id}${cart.cnum}" name="${cart.cnum}">
												 <label	for="${cart.id}${cart.cnum}_check" class="material-icons checkbox"title="${cart.id}${cart.cnum}_check">check</label>
												 
											</td>
											
											
											<td>
												<a href="${pageContext.request.contextPath}/product/dogSelect?productNum=${cart.productNum}" target="_blank">
													<img src="${pageContext.request.contextPath}/resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;">
												</a>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/product/dogSelect?productNum=${cart.productNum}" target="_blank">
													${cart.productName }
												</a>
											</td>
											
											
											
											<td id="${cart.id}${cart.cnum}_price" class="price">${cart.price }</td>
											<td>
												<div class="row " style="height: 20px; width: 112px; padding-left: 28px;">
													<button class="minus" title="${cart.id}${cart.cnum}" style="width: 20px; border: 1px solid #d9dde0;">-</button>
													<input class="text-center in" id="${cart.id}${cart.cnum}_amount"	title="${cart.id}${cart.cnum}" 
														style="color: #333; width: 40px; border: 1px solid #d9dde0;" maxlength="10"
														value="${cart.cAmount }" name="${cart.cnum }"
														onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<button class="plus" title="${cart.id}${cart.cnum}"style="width: 20px; border: 1px solid #d9dde0;">+</button>
												</div>
											</td>

											<td id="${cart.id}${cart.cnum}_point" name="${cart.point}"></td>

											<td><span id="${cart.id}${cart.cnum}_total" class="sum_text"></span>
											</td>

										</tr>
									</tbody>



								</c:forEach>
							</table>

						</div>
						<div class="row">
							<div class="col">
								<button class="btn" id="del"
									style="border: 1px solid gray; padding: 3px 7px 3px 7px; font-size: 12px;">선택
									상품 삭제</button>
							</div>
						</div>

						<div class="row"
							style="margin:15px 0 15px 0; padding: 15px; text-align: center; font-weight: bold; color: black; border: 1px solid #9ca0aa;">
							
								<div class="col-sm-8" style="border-right: 1px solid gray;">

		
									<div class="row">
										<div class="col-sm-4">
											<div>총 상품금액</div>
											<div id="all_sum">0원</div>
										</div>
										<div class="col-sm-1">
											<div>&nbsp;</div>
											<div style="color: gray;">+</div>
										</div>
										<div class="col-sm-3">
											<div>배송비</div>
											<div id="deli">0원</div>
										</div>
										<div class="col-sm-1">
											<div>&nbsp;</div>
											<div style="color: gray;">-</div>
										</div>
										<div class="col-sm-3">
											<div>할인금액</div>
											<div id="discount">0원</div>


										</div>


									</div>
									
								</div>
								<div class="col-sm-3">
									<div>결제 금액</div>
									<div style="color: #FF324D;" id="payment">0원</div>

								</div>
						</div>
					</div>
						
						<div class="row">
							<div class="col-sm-8" style="padding-right: 7.5px;">
								<a href="${pageContext.request.contextPath}"
									class="btn btn-danger" style="float: right; font-size: 16px;">쇼핑
									홈 가기</a>
							</div>
							<div class="col-sm-4" style="padding-left: 0px;">
								<!-- <a href="./memberPayment" class="btn btn-danger" id="payClick"
									style="font-size: 16px;">결제 하기</a> -->
								<button class="btn btn-danger" id="payClick">결제 하기</button>
							</div>

						</div>
					</c:if>	

					</div>


					<div class="col-sm-2">
						
					</div>
				</div>
			</div>




		</div>
	</div>



</body>

<script type="text/javascript" src="../resources/js/cart.js"></script>
</html>