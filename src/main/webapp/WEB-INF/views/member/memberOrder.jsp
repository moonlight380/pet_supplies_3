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
			<h1>-----------------------------------------------</h1>
			
		</c:forEach>
		
<script type="text/javascript">
	var count=0;
	$(".count").each(function(){
		var a = $(this).attr("id");
		var id = $("#orderId").attr("title");
		var orderNum = $("#orderNum").attr("title");
		var fileName = $("#filename"+a).attr("title");
		var amount = $("#amount"+a).attr("title");
		var point = $("#point"+a).attr("title");
		var price = $("#price"+a).attr("title");
		var pnum = $("#pNum"+a).attr("title");
		var pname = $("#pName"+a).attr("title");
		
		console.log(fileName);
		console.log(amount);
		console.log(point);
		console.log(price);
		console.log(pnum);
		console.log(pname);
		
		/* $.ajax({
			type : "post",
			traditional : true,
			url:"./memberOrder",
			data:{
				
			}
		}); */		
	});


</script>
		
</body>

</html>