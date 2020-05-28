<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaopaySuccess</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>
<body>
<div id="header">
<c:import url="../template/header.jsp"></c:import>
</div>

<div class="container"style="margin-top: 150px;margin-bottom: 150px;">

<div class="path" style="display: block; height: auto; width:100%; margin-top: 150px; text-align: right;">
		<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home ></a></li>
			<li style="display: inline;"><a href="${pageContext.request.contextPath}">장바구니 ></a></li>
			<li style="display: inline;">주문결제</li>
			<li style="display: inline;" title="현재 위치"><strong>주문완료 </strong></li>
		</ol>
</div>



<div style="text-align: center; display: block; border-bottom: 3px solid black;height: 100px; margin-top: 100px;">
<h1 style="font-weight: bold; font-size: 36px; margin-top: 30px;">주문완료</h1>
</div>

<div class="" style="margin: 0 auto; width: 800px; text-align: center; margin-top: 60px;">
<i class='far fa-check-circle' style='font-size:70px'></i>
<p style="margin-top: 30px;"><strong style="font-size: 30px;">고객님의 주문이 성공적으로 완료되었습니다.</strong><br>
주문내역 및 배송에 관한 안내는 <a href="./memberOrderInfo"><strong style="text-decoration: underline; color: red"> 주문조회</strong></a> 를 통하여 확인 가능합니다.</p>
<p>주문번호 : <span>${order.orderNum}</span><br>
주문날짜 : <span id="day"></span></p>

</div>


</div>
</div>
	<div hidden="hidden">
		<h1 id="orderNum" title="${order.orderNum }">orderNum : ${order.orderNum}</h1>
		<h1 id="orderPriceAll"title="${order.priceAll }">orderPriceAll : ${order.priceAll}</h1>
		<h1 id="orderId" title="${order.id }">order id : ${order.id}</h1>
		<h1>orderDate : ${order.pDate}</h1>
		<h1>orderCoupon : ${order.coupon}</h1>
		<h1>orderCharge : ${order.charge}</h1>
		
		<c:forEach items="${cartSelect}" var="cart" varStatus="index">
			<div class="count" id="_${index.index}">aa</div>
			
			<h3>id : ${cart.id}</h3>
			<h1>index:${index.index }</h1>
			<h3 id="filename_${index.index}" title="${cart.fileName}" >filename : ${cart.fileName}</h3>
			<h3 id="amount_${index.index}" title="${cart.cAmount}" >amount : ${cart.cAmount}</h3>
			<h3 id="point_${index.index}" title="${cart.point}" >point : ${cart.point}</h3>
			<h3 id="price_${index.index}" title="${cart.price}" >price : ${cart.price}</h3>
			<h3 id="pNum_${index.index}" title="${cart.productNum}" >pNum : ${cart.productNum}</h3>
			<h3 id="pName_${index.index}" title="${cart.productName}" >pName : ${cart.productName}</h3>
			<h3 id="cnum_${index.index}" title="${cart.cnum }">cnum : ${cart.cnum }</h3>
			<h1>-----------------------------------------------</h1>
		</c:forEach>
		<span id="h_path">${pageContext.request.contextPath}</span>
	</div>




</body>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	today = yyyy+'/'+mm+'/'+dd;
	$("#day").text(today);
	
</script>
<script type="text/javascript">
	var path = $("#h_path").text();
	var ids =[];
	$(".count").each(function(){
		var a = $(this).attr("id");
		var id = $("#orderId").attr("title");
		var orderNum = $("#orderNum").attr("title")*1;
		var fileName = $("#filename"+a).attr("title");
		var amount = $("#amount"+a).attr("title")*1;
		var point = $("#point"+a).attr("title")*1;
		var price = $("#price"+a).attr("title")*1;
		var productNum = $("#pNum"+a).attr("title")*1;
		var productName = $("#pName"+a).attr("title");
		var cnum = $("#cnum"+a).attr("title");
		ids.push(cnum);
		$.ajax({
			type : "post",
			traditional : true,
			url:"./orderInfoInsert",
			data:{
				id:id,
				orderNum:orderNum,
				fileName:fileName,
				amount:amount,
				point:point,
				price:price,
				productNum:productNum,
				productName:productName
			},
			success:function(data){
				$.ajax({
					type:"get",
					traditional : true,
					url:"./cartDelete",
					data:{
						ids:ids
					},
					success:function(data){
						$.get("./memberCartRefresh")
					} ,success:function(data){
						$.get("../member/memberCartHeader",function(data){
							$("#header").html(data.trim());
						});
					} 
					
					
					
					
				});
			}
		});		
	});


</script>


</html>