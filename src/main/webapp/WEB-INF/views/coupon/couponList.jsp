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
<form action="./couponSelect" method="post">
  <h1 style="font-size: medium;">쿠폰 조회/적용</h1>
<div class="content">

<div class="ec-base-help" style="font-size: small; border: 1px solid gray;">
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
<div class="ec-base-table gLayoutFixed typeList" style="font-size: small;">
<table class="table table-hover" style="border-bottom: 1px solid black; border-top: 1px solid black;">
<colgroup>
<col style="width:85px">
<col style="width:90px">
<col style="width:auto">
<col style="width:100px">
<col style="width:120px">
<col style="width:100px">
<col style="width:80px">
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
<tbody class="center">

<tr class="xans-element- xans-coupon xans-coupon-aprd xans-record-"><td><span class="txtInfo">기본배송</span></td>
<td class="thumb"><img src="//www.gang2.co.kr/web/product/tiny/201901/31523b8ad62931f9f062951d7bb8b9f9.jpg" alt=""></td>
<td class="left txtBreak">
<strong>♡ 2+2 ♡ 동물농장 껌씹는하루 (블루베리) 12P</strong>
<div class="option"></div>
<div class="type"><input name="ordPrice" id="ordPrice22292_1" value="7900" type="hidden"><input name="cpnDcPrice" id="cpnDcPrice22292_1" value="300" type="hidden"><input name="cpnDcPricecash" id="cpnDcPricecash22292_1" value="300" type="hidden"><input name="cpnDcPriceBasiccash" id="cpnDcPriceBasiccash22292_1" value="0" type="hidden"><input name="cpnDcPricecard" id="cpnDcPricecard22292_1" value="300" type="hidden"><input name="cpnDcPriceBasiccard" id="cpnDcPriceBasiccard22292_1" value="0" type="hidden"><input name="cpnDcPricetcash" id="cpnDcPricetcash22292_1" value="300" type="hidden"><input name="cpnDcPriceBasictcash" id="cpnDcPriceBasictcash22292_1" value="0" type="hidden"><input name="cpnDcPriceicash" id="cpnDcPriceicash22292_1" value="300" type="hidden"><input name="cpnDcPriceBasicicash" id="cpnDcPriceBasicicash22292_1" value="0" type="hidden"><input name="cpnDcPricecell" id="cpnDcPricecell22292_1" value="300" type="hidden"><input name="cpnDcPriceBasiccell" id="cpnDcPriceBasiccell22292_1" value="0" type="hidden"><input name="cpnDcPricekakaopay" id="cpnDcPricekakaopay22292_1" value="300" type="hidden"><input name="cpnDcPriceBasickakaopay" id="cpnDcPriceBasickakaopay22292_1" value="0" type="hidden"><input name="cpnDcPricepayco" id="cpnDcPricepayco22292_1" value="300" type="hidden"><input name="cpnDcPriceBasicpayco" id="cpnDcPriceBasicpayco22292_1" value="0" type="hidden"><input name="cpnDcPricedeposit" id="cpnDcPricedeposit22292_1" value="300" type="hidden"><input name="cpnDcPriceBasicdeposit" id="cpnDcPriceBasicdeposit22292_1" value="0" type="hidden"><input name="cpnDcPriceBasic" id="cpnDcPriceBasic22292_1" value="0" type="hidden"><input name="cpnSalePrice" id="cpnPrice22292_1" value="0" type="hidden"><input name="cpnMilePrice" id="cpnMilePrice22292_1" value="0" type="hidden"><input name="cpnRstPrice" id="cpnRstPrice22292_1" value="0" type="hidden"></div>
</td>
<td class="price right"><strong>7,900원</strong></td>
<td class="right">2,800원</td>
<td class="select"><span class="txtInfo">
<select name="cpnPrdSelect" id="coupon_select" onchange="select()">
<option value="">선택하세요</option>
<c:forEach items="${coupon}" var="coupon">
<option value="coupon">${coupon.name} ${coupon.exdate}</option>
</c:forEach>
</select></span></td>

<td class="right"><strong><span id="txtCpnPrice">0</span>

</strong></td>
</tr>

</tbody>
</table>
</div>
</div>


<div class="ec-base-table typeList total gBlank20" style="font-size: medium; border: 1px solid black;margin-top:20px;">
<table class="table table-hover">
<colgroup>
<col style="width:33.33%">
<col style="width:33.33%">
<col style="width:33.33%">
</colgroup>
<thead><tr>
<th scope="col"><strong>총 상품별 쿠폰 할인금액</strong></th>
<th scope="col"><strong>총 주문별 쿠폰 할인금액</strong></th>
<th scope="col"><strong>총 배송비 쿠폰 할인금액</strong></th>
</tr></thead>
<tfoot class="right"><tr>
<td colspan="3">
<strong>= 총 쿠폰 할인금액</strong>(적립금) : <span class="txtEm gIndent10"><strong id="mTotalCouponDiscount" class="txt23">0</strong><strong>원</strong> (<img src="/web/upload/icon_201312240915061500.gif" alt=""> &nbsp;<span id="mTotalCouponMileage">0원</span>)</span>
</td>
                    </tr></tfoot>
<tbody class="center"><tr>
<td><div class="box txt16"><strong id="mProductCouponDiscount" class="txt23">0</strong><strong>원</strong> <span class="txt12 txtInfo">(<img src="/web/upload/icon_201312240915061500.gif" alt=""> &nbsp;<span id="mProductCouponMileage">0원</span>)</span>
</div></td>
                        <td><div class="box txt16">
<strong>- <strong id="mOrderCouponDiscount" class="txt23">0</strong>원</strong> <span class="txt12 txtInfo">(<img src="/web/upload/icon_201312240915061500.gif" alt=""> &nbsp;<span id="mOrderCouponMileage">0원</span>)</span>
</div></td>
                        <td><div class="box txt16"><strong>- <strong id="mDeliveryCouponDiscount" class="txt23">0</strong>원</strong></div></td>
                    </tr></tbody>
<tbody class="detail center"><tr>
<td class="left">
                            <ul id="mSelectedProductCoupon"></ul>
</td>
                        <td class="left">
                            <ul id="mSelectedOrderCoupon" class="select">
<li>사용가능한 쿠폰이 없습니다.</li>
                            </ul>
</td>
                        <td class="left">
                            <ul id="mSelectedDeliveryCoupon"></ul>
</td>
                    </tr></tbody>
</table>
</div>
    </div>
<div class="ec-base-button">
		<a id="dd" href="#none" onclick="couponSelect.setCpnResult()" class="btn_pop btncolor_subordinate"><span>쿠폰 적용하기</span></a>
		<a href="#none" onclick="couponSelect.initCpn()" class="btn_pop btncolor_basic"><span>적용 취소하기</span></a>
    </div>

</form>


            
<script type="text/javascript">


 $("#coupon_select").change(function() {
	 var ec = $("#coupon_select option:selected").text();
 	 var result = ec.substring(10,15);
	 $("#txtCpnPrice").text(result);
	
});  
 
 
 
</script>

</body>
</html>