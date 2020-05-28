<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.table_body td {
	
	
}

.table_title th {
	border-bottom: 2px solid #FF324D;
}
</style>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>


<body>
	<c:import url="../template/header.jsp"></c:import>



	<div class="container-fulid  mt-5">
		<div class="row">
			<c:import url="./memberSide.jsp"></c:import>
			<div class="col" style="margin-left: 250px;">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col">



						<div class="row mb-4"
							style="border-bottom: solid 1px black; font-weight: bold; color: black; margin-top: 150px;">
							<div style="margin-left: 21px;">주문 조회</div>
						</div>
						
						
							<c:if test="${member.id eq 'admin' }">
									<div class="row">
								<table>
									<colgroup>
										<col style="width: 130px" />
										<col style="width: 250px" />
										<col style="width: 300px" />
										<col style="width: 150px" />
										<col style="width: 120px" />
										<col style="width: 100px" />
										<col style="width: 130px" />
										<col style="width: 200px" />
										
									</colgroup>

									<thead>

										<tr class="table_title"
											style="text-align: center; line-height: 50px;">
											<th>주문 번호</th>
											<th>이미지</th>
											<th>상품정보</th>
											<th>판매가</th>
											<th>수량</th>
											<th>적립금</th>
											<th>금액</th>
											<th>결제 확인</th>
											

										</tr>
										<tr style="line-height: 30px;">
											<th>&nbsp;</th>
										</tr>


									</thead>




									<tbody>
									
									<c:forEach items="${aorderList}" var="List" varStatus="index">
											<tr class="table_start table_body" id="id_${index.index}"
												title="${List.orderNum}" style="text-align: center;">
												<!-- for문으로 뿌리고 자바스크립트로 테이블 고치기 -->
												<td class="${List.orderNum}_row" title="${index.index}">${List.orderNum }<br>${List.regDate }
												<br><c:if test="${List.orderCheck eq '0'}">
												<button id ="orderbtn" title="${List.orderNum}">결제완료</button>
												</c:if>
												</td>
												<td><a
													href="${pageContext.request.contextPath}/product/dogSelect?productNum=${List.productNum}"
													target="_blank"> <img
														src="${pageContext.request.contextPath}/resources/dogUpload/${List.fileName }"
														style="width: 100px; height: 100px; margin: 15px 0px 15px 0px;">
												</a></td>
												<td><a
													href="${pageContext.request.contextPath}/product/dogSelect?productNum=${List.productNum}"
													target="_blank"> ${List.productName } </a></td>
												<td class="price comma" title="price">${List.price}</td>
												<td class="comma" title="amount">${List.amount}</td>
												<td class="comma" title="point"><c:set var="point"
														value="${List.amount * List.point}" /> <c:out
														value="${point}" /></td>
												<td class="${List.orderNum}_row2 comma price" title="price">${List.priceAll }</td>
												
												<td>${List.orderCheck}</td>
												
											</tr>

										</c:forEach>
									
									
									
									</tbody></table></div>
									<div class="row">
									<div class="col-12">
										<ul
											class="pagination mt-3 justify-content-center pagination_style1">
											<c:if test="${pager.curBlock gt 1}">
												<li class="page-item active"><a class="page-link"
													href="./memberOrderInfo?curPage=${pager.startNum-1}">이전</a></li>
											</c:if>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
												var="i">
												<li class="page-item"><a class="page-link"
													href="./memberOrderInfo?curPage=${i}">${i}</a></li>
											</c:forEach>
											<c:if test="${pager.curBlock lt pager.totalBlock}">
												<li class="page-item"><a class="page-link"
													href="./memberOrderInfo?curPage=${pager.lastNum+1}">다음</a></li>
											</c:if>
										</ul>
									</div>
								</div>
									</c:if>
									

				<c:if test="${member.id ne 'admin' }">
						<c:if test="${empty orderList}">
							<div class="row mt-5 mb-5">
								<div class="col text-center">
									<i class="linearicons-cart" style="font-size: 50px"></i>
								</div>

							</div>


							<div class="row mb-5">
								<div class="col text-center"
									style="font-weight: 2px; color: black;">주문내역이 없습니다.</div>
							</div>

							<div class="row">
								<div class="col text-center">
									<a href="${pageContext.request.contextPath}"
										class="btn btn-danger" style="font-size: 16px;">쇼핑 홈 가기</a>
								</div>
							</div>
						</c:if>

						<c:if test="${not empty orderList }">
							<div class="row">
								<table>
									<colgroup>
										<col style="width: 130px" />
										<col style="width: 250px" />
										<col style="width: 400px" />
										<col style="width: 150px" />
										<col style="width: 120px" />
										<col style="width: 100px" />
										<col style="width: 130px" />
									</colgroup>

									<thead>

										<tr class="table_title"
											style="text-align: center; line-height: 60px;">
											<th>주문 번호</th>
											<th>이미지</th>
											<th>상품정보</th>
											<th>판매가</th>
											<th>수량</th>
											<th>적립금</th>
											<th>금액</th>

										</tr>
										<tr style="line-height: 30px;">
											<th>&nbsp;</th>
										</tr>


									</thead>




									<tbody>
								

										<c:forEach items="${ orderList}" var="order" varStatus="index">
											<tr class="table_start table_body" id="id_${index.index}"
												title="${order.orderNum}" style="text-align: center;">
												<!-- for문으로 뿌리고 자바스크립트로 테이블 고치기 -->
												<td class="${order.orderNum}_row" title="${index.index}">${order.orderNum }<br>${order.regDate }</td>
												<td><a
													href="${pageContext.request.contextPath}/product/dogSelect?productNum=${order.productNum}"
													target="_blank"> <img
														src="${pageContext.request.contextPath}/resources/dogUpload/${order.fileName }"
														style="width: 100px; height: 100px; margin: 15px 0px 15px 0px;">
												</a></td>
												<td><a
													href="${pageContext.request.contextPath}/product/dogSelect?productNum=${order.productNum}"
													target="_blank"> ${order.productName } </a></td>
												<td class="price comma" title="price">${order.price}</td>
												<td class="comma" title="amount">${order.amount}</td>
												<td class="comma" title="point"><c:set var="point"
														value="${order.amount * order.point}" /> <c:out
														value="${point}" /></td>
												<td class="${order.orderNum}_row2 comma price" title="price">${order.priceAll }</td>

											</tr>

										</c:forEach>




									</tbody>
								</table>
	</div>
	


							
							<div class="row">
								<div class="col-12">
									<ul
										class="pagination mt-3 justify-content-center pagination_style1">
										<c:if test="${pager.curBlock gt 1}">
											<li class="page-item active"><a class="page-link"
												href="./memberOrderInfo?curPage=${pager.startNum-1}">이전</a></li>
										</c:if>
										<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
											var="i">
											<li class="page-item"><a class="page-link"
												href="./memberOrderInfo?curPage=${i}">${i}</a></li>
										</c:forEach>
										<c:if test="${pager.curBlock lt pager.totalBlock}">
											<li class="page-item"><a class="page-link"
												href="./memberOrderInfo?curPage=${pager.lastNum+1}">다음</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</c:if>
						</c:if>





					</div>
					<div class="col-sm-2"></div>
				</div>

			</div>



		</div>


	</div>

</body>

<script type="text/javascript">

	var ids = [];
	$(".table_start").each(function() {
		var title = $(this).attr("title");
		var cname = "." + title + "_row";
		var cname2 = "." + title + "_row2";
		$(cname).each(function() {
			var rows = $(cname + ":contains('" + $(this).text() + "')");
			var rows2= rows.siblings(cname2);
			
			if (rows.length > 1) {
				rows.eq(0).attr("rowspan", rows.length);
				rows2.eq(0).attr("rowspan", rows.length);
				rows.not(":eq(0)").remove();
				rows2.not(":eq(0)").remove();

			} else if (rows.length == 1) {
				var id = rows.first().attr("title");
				id = "id_" + id;
				ids.push(id);
			}
			

		});
		


	});
	var list = ids.reduce(function(a, b) {
		if (a.indexOf(b) < 0) {
			a.push(b);
		}
		return a;
	}, []);

	for (var i = 0; i < list.length; i++) {
		var id = list[i];
		$("#" + id)
				.before(
						'<tr style="line-height: 30px; border-bottom:solid 1px #bbbfc3;">' + '<th>&nbsp;</th><th></th><th></th><th></th><th></th><th></th><th></th>'
								+ '</tr> <tr><th>&nbsp;</th></tr>');
	}


	$(".comma").each(function() {
		var x = $(this).text();
		x = addCommas(x);
		var check = $(this).attr("title");
		if (check == "price") {
			x = x + "원";
			$(this).text(x);
		} else if (check == "point") {
			x = x + "P";
			$(this).text(x);
		} else if (check == "amount") {
			x = x + "개";
			$(this).text(x);

		}
	});

	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	$("#orderbtn").click(function() {
		var orderNum = $(this).attr("title");
		location.href="./adminUpdate?orderNum="+orderNum;
	});
</script>
</html>