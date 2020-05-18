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

<body>

</body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fulid mt-5" id="step" title="step2">
	<div class="row">
		<c:import url="./memberSide.jsp"></c:import>
		<div class="col">
			<c:import url="./cartStep.jsp"></c:import>
		</div>
	</div>

	<h1>id : ${order.id}</h1>
	<h1>priceAll : ${order.priceAll}</h1>
	<h1>charge : ${order.charge}</h1>
	<h1>cartSelect : ${cartSelect }</h1>
	v>
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
										<th scope="col" ><input type="checkbox" id="check_all"
											title="checkbox" hidden="hidden"><div class="row" style="height: 10px;"></div><label style="margin: 0 auto;"
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




								<c:forEach items="${cartSelect }" var="cart">
								
									<tbody>
										<tr class="table_title">
											<td>
												<input type="checkbox" class="check" id="${cart.id}${cart.cnum}_check" hidden="hidden" title="${cart.id}${cart.cnum}" name="${cart.cnum}">
												 <label	for="${cart.id}${cart.cnum}_check" class="material-icons checkbox"title="${cart.id}${cart.cnum}_check">check</label>
												 
											</td>
											<td><img src="../resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
											<td>${cart.productName }</td>
											<td id="${cart.id}${cart.cnum}_price" class="price">${cart.price }</td>
											<td>
												<div class="row " style="height: 20px; width: 112px; padding-left: 28px;">
													<button class="minus" title="${cart.id}${cart.cnum}" style="width: 20px; border: 1px solid #d9dde0;">-</button>
													<input class="text-center in" id="${cart.id}${cart.cnum}_amount"	title="${cart.id}${cart.cnum}" 
														style="color: #333; width: 40px; border: 1px solid #d9dde0;"
														value="${cart.cAmount }" name="${cart.cnum }"
														onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<button class="plus" title="${cart.id}${cart.cnum}"style="width: 20px; border: 1px solid #d9dde0;">+</button>
												</div>
											</td>

											<td>${cart.point }</td>

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


</div>




<div class="container">
	<div class="row">
		<div class="col"></div>
		<div class="col border m-7" style="height: 400px;">

			<form class="form-signin" action="./memberLogin" method="post">
				<div class="text-center">
					<a href="${pageContext.request.contextPath}"> <img
						class="m-5 mb-4"
						src="${pageContext.request.contextPath}/resources/images/logo_dark.png"
						alt="" width="182" height="47">
					</a>
				</div>

				<input type="text" id="id" name="id" class="form-control"
					placeholder="아이디 입력" required autofocus value="${cookie.cId.value}">
				<input type="password" id="pw" name="pw"
					class="form-control mt-2 mb-2" placeholder="비밀번호 입력" required>
				<button class="btn btn-lg btn-block" id="btn" type="submit">로그인</button>

				<div class="checkbox mt-3">
					<label class="ml-0"> <input type="checkbox"
						value="remember-me"> Remember me
					</label>
				</div>

				<div class="text-center"
					style="background-color: #ffffff; border: 1px solid #d7d5d5; font-size: large; height: 50px;">
					<a href="${pageContext.request.contextPath}/member/memberJoin"
						class="member">회원가입</a>
				</div>

			</form>

			<%-- <form action="./kakaoLogin" method="get">
	<div class="kakaoLogin" style="margin-top: 50px;">
	
	<c:if test="${member.id eq null}">
	<a href="https://kauth.kakao.com/oauth/authorize?
			client_id=ccfe4411fa1bfc86a27222555a4dba8c
			&redirect_uri=http://localhost:8080/p1/member/kakaoLogin
			&response_type=code">
		<img src="${pageContext.request.contextPath}/resources/images/kakao_login_btn_large_wide.png">
	</a>
	</c:if>
	
	<c:if test="${member.id ne null}">
        alert("로그인 성공!");
        <input type="button" value="로그아웃" onclick="">
    </c:if>
    
	
	</div>

</form> --%>
		</div>
		<div class="col"></div>
	</div>
</div>



<script type="text/javascript">
	/* kakao Login  */
	

	$("#btn").click(function() {
		alert("click");
	});
	document.getElementById('btn').style.backgroundColor = '#ff9999';
	document.getElementById('btn').style.color = 'white';
	$('.member').css({'color':'gray','font-size':'5px'});
	
	
	
	
</script>


</html>