<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coupon Page</title>
</head>
<body>

<body id="popup">
<form action="./couponList" method="post">
  <h1 style="font-size: medium;">쿠폰 조회/적용</h1>
<div class="content">

<div class="ec-base-help" style="font-size: small; border: 1px solid gray;width:820px; height: 100px;">
<h2 style="font-size: small;margin-left: 5px;">쿠폰 사용에 따른 유의사항</h2>
<div class="inner" style=" border-top: 1px solid gray; ">
 <ul>
<li>사용 가능한 쿠폰만 보여지게 됩니다.</li>
<li>쿠폰은 회원등급 할인 이후에 적용되므로, 현재 페이지에서 보여지는 판매가와 실제 적용되는 금액과 다를 수 있습니다.</li>
</ul>
</div>
</div>

<div class="" style="width: 1000px;">
<div class="title" style="font-size: small;">
<h3>상품별 쿠폰 적용</h3>
</div>
<div class="ec-base-table gLayoutFixed typeList" style="font-size: small;width:850px;">
<table class="table table-hover" style="border-bottom: 1px solid black; border-top: 1px solid black;">
<colgroup>
<col style="width:85px">
<col style="width:90px">
<col style="width:auto">
<col style="width:100px">
<col style="width:120px">
<col style="width:100px">
<col style="width:90px">
</colgroup>
<thead><tr>
<th scope="col">배송구분</th>
<th scope="col">이미지</th>
<th scope="col">상품정보</th>
<th scope="col">판매가</th>
<th scope="col">할인혜택</th>
<th scope="col">상품별 쿠폰선택</th>
<th scope="col">상품별<br> 쿠폰 할인액</th>
</tr></thead>
<tbody class="center" style="font-size: small; text-align: center;">
<c:forEach items="${cartSelect}" var="cart" varStatus="i">
<tr class="xans-element- xans-coupon xans-coupon-aprd xans-record-"><td><span class="txtInfo count" name="txtCpnPrice${i.index}">기본배송</span></td>
<td class="thumb"><img src="../resources/dogUpload/${cart.fileName}"  style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
<td class="left txtBreak">
<strong>${cart.productName}</strong>
<div class="option"></div>
<td class="price right"><strong>${cart.price}</strong></td>
<td class="right">2,800원</td>
<td class="select"><span class="txtInfo">
<select name="cpnPrdSelect" class="coupon_select coupon_s${i.index}" id="c_select" title="${i.index}">
<option value="sel">선택하세요</option>
<c:forEach items="${coupon}" var="coupon">
<option value="coupon" title="${coupon.disc}" id="${i.index}" class="select" name="${coupon.num}">${coupon.name} ${coupon.exdate}</option>
</c:forEach>
</select></span></td>
<td class="right"><strong><span id="txtCpnPrice${i.index}">0</span>
</strong></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>


<div class="ec-base-table typeList total gBlank20" style="font-size: medium;margin-top:20px;  width:800px; height: 80px;">

<div style="float: right;">
<strong>= 총 쿠폰 할인금액</strong>(적립금) : <span class="txtEm gIndent10" style="color: red">
<strong id="mTotalCouponDiscount" class="txt23" style="font-size: 32px;">0</strong><strong>원</strong></span>
</div>

</div>

</div>

<div class="ec-base-button" style="text-align: center; word-spacing: 20px; height: 50px;">
	<input type="button" onclick="couponSelect.setCpnResult()" id="btncolor_subordinate" value="쿠폰 적용하기" style="background-color: red; color: white; height: 40px; width: 120PX;">
	<input type="button" onclick="couponSelect.initCpn()" id="btncolor_basic" value="적용 취소하기" style="height: 40px; width: 120PX;">
</div>

</form>


            
<script type="text/javascript">


	
	$(document).ready(function(){
		
	 var ar = new Array();
	 $(".coupon_select").change(function() {
		 var dc = $(this).attr('title');
		 var ec = $(".coupon_s"+dc+" option:selected").attr('title');
	 	 $("#txtCpnPrice"+dc).html(ec);  
	 	 
	 	 
	 		var ac = $(".coupon_s"+dc+" option:selected").text();
	 		var num = $(".coupon_s"+dc+" option:selected").attr("name");
	 		
	 		$(".coupon_s"+dc+" option:selected").val(num);
	 		var val = $(".coupon_s"+dc+" option:selected").val();
	 		for(var i = 0; i<ar.length;i++){
	 			console.log("ar:"+ar[i]);
	 			if(ar[i]==val){
	 				alert("쿠폰은 중복사용이 안됩니다");
	 				$("#txtCpnPrice"+dc).text("0"); 
	 				val="";
	 				$(this).val('sel');
	 			}
	 		}
	 		
	 		
	 		$(".select").each(function(){
	 			var val = $(this).val();
	 			
	 			
	 			if(val!="coupon" && val!=""){
				 		ar.push(val);
	 			}
	 	
	 		});
	 		
	 		ar = ar.reduce(function(a,b){
	 			if(a.indexOf(b)<0){
	 				a.push(b);
	 			}
	 			return a;
	 		},[]);

	 	var sum = 0; 
	 	var count=0;
	 	$(".count").each(function(){
	 		count++;
	 		var id = $(this).attr("name");
	 		var s=$("#"+id).text();
	 		sum=sum+s*1;
	 		
	 	});
	 
			$("#mTotalCouponDiscount").text(sum);
		 
	}); 
	 
		 $("#btncolor_subordinate").click(function() {
			 var result = $("#mTotalCouponDiscount").text();
			 
 			 var cresult = opener.document.getElementById("c_in");
			 cresult.value=result; 
			 
			 window.opener.postMessage(result, "http://localhost:8080/p1/member/memberPayment");
			 close();
			
		});
		 
		 $("#btncolor_basic").click(function() {
			 window.location.reload()
		});
	 
	});
	

</script>

</body>
</html>