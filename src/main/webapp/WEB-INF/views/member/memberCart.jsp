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
</style>
</head>


<body>
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
								<div class='cart_count'
									style="margin-left: 4px; top: 0px; margin-top: 1px;">${cartCount }</div>
							</div>
						</div>

						<div class="row" style="padding: 15px;">
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
									<tr class="table_title">
										<th scope="col"><input type="checkbox" id="check_all"
											title="checkbox" hidden="hidden"> <label
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

								<tbody>
									<tr class="table_title">
										<td><input type="checkbox" class="check"
											id="${member.id}1_check" hidden="hidden"
											title="${member.id}1"> <label
											for="${member.id}1_check" class="material-icons checkbox"
											title="${member.id}1_check">check</label></td>
										<td>img</td>
										<td>info</td>
										<td id="${member.id}1_price" class="price">35000</td>
										<td>
										
										
										
								<%-- 		<input type="button"
											style="width: 20px; height: 20px;" value="-" class="minus"
											title="${member.id}1"> 
											
											
											<input type="text"
											style="width: 30px; height: 20px;" value="1"
											title="${member.id }1" class="in" id="${member.id}1_amount"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											
											
											
											<input type="button" style="width: 20px; height: 20px;"
											value="+" class="plus" title="${member.id}1"> --%>
											
											
											
											
										<div class="row " style="height: 20px; width: 112px; padding-left: 28px;">
											<button class="minus" title="${member.id }1"
												style="width: 20px; border: 1px solid #d9dde0;">-</button>
											<input class="text-center in" id="${member.id}1_amount" title="${member.id }1"
												style="color: #333; width: 40px; border: 1px solid #d9dde0;"
												value="1"
												onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<button class="plus" title="${member.id}1"
												style="width: 20px; border: 1px solid #d9dde0;">+</button>

										</div>
											
											
											</td>

										<td>a</td>

										<td><span id="${member.id}1_total" class="sum_text"></span>
										</td>






									</tr>


								</tbody>
								<tbody>
									<tr class="table_title">
										<td><input type="checkbox" class="check"
											id="${member.id}2_check" hidden="hidden"
											title="${member.id}2"> <label
											for="${member.id}2_check" class="material-icons checkbox"
											title="${member.id}2_check">check</label></td>
										<td>img</td>
										<td>info</td>
										<td id="${member.id}2_price" class="price">42000</td>
										<td>
										
										
										<div class="row " style="height: 20px; width: 112px; padding-left: 28px;">
											<button class="minus" title="${member.id }2"
												style="width: 20px; border: 1px solid #d9dde0;">-</button>
											<input class="text-center in" id="${member.id}2_amount" title="${member.id }2"
												style="color: #333; width: 40px; border: 1px solid #d9dde0;"
												value="1"
												onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<button class="plus" title="${member.id}2"
												style="width: 20px; border: 1px solid #d9dde0;">+</button>

										</div>
											
											
											</td>
										<td>a</td>

										<td><span id="${member.id}2_total" class="sum_text"></span>
										</td>






									</tr>


								</tbody>



							</table>

						</div>
						<div class="row">
							<div class="col">
								<button class="btn"
									style="border: 1px solid gray; padding: 3px 7px 3px 7px; font-size: 12px;">선택
									상품 삭제</button>
							</div>
						</div>

						<div class="row"
							style="margin:15px 0 15px 0; padding: 15px; text-align: center; font-weight: bold; color: black; border: 1px solid #9ca0aa;">
							
								<div class="col-sm-8" style="border-right: 1px solid gray;">

		
									<div class="row">
										<div class="col-sm-4 border">
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
						<div class="row">
							<div class="col-sm-8" style="padding-right: 7.5px;">
								<a href="${pageContext.request.contextPath}"
									class="btn btn-danger" style="float: right; font-size: 16px;">쇼핑
									홈 가기</a>
							</div>
							<div class="col-sm-4" style="padding-left: 0px;">
								<a href="./memberPayment" class="btn btn-danger"
									style="font-size: 16px;">결제 하기</a>
							</div>

						</div>

					</div>


					<div class="col-sm-2">
						asdasd
						<div class="row " style="height: 27px; width: 112px;">
							<button class=" text-center	"
								style="width: 28px; border: 1px solid #d9dde0;">-</button>
							<input class="text-center"
								style="color: #333; width: 51px; border: 1px solid #d9dde0;"
								value="125">
							<div class=" text-center"
								style="width: 28px; border: 1px solid #d9dde0;">+</div>


						</div>

					</div>
				</div>
			</div>




		</div>
	</div>



</body>

<script type="text/javascript">
	//-------------------------Function------------------------

	function check(name) {
		$(name).css({
			'background-color' : '#FF324D',
			'color' : 'white',
			'border-color' : '#FF324D'
		});
	}
	function uncheck(name) {
		$(name).css({
			'background-color' : 'white',
			'color' : 'gray',
			'border-color' : 'gray'
		});
	}
	//-----------------------All check--------------------------

	$("#check_all").click(function() {
		$(".check").prop("checked", $(this).prop("checked"));

		var name = ('.' + $("#check_all").prop("title"));
		var sum = set();
		if ($("#check_all").prop("checked")) {
			check(name);

			final_set(sum);

		} else {
			uncheck(name);
			num = 0;
			final_set(num);
		}

	});

	//-----------------------Select Check---------------------------

	$(".check").click(function() {
		var result = true;
		var name = "[title=" + $(this).attr("id") + "]";
		var title = $(this).attr("title");

		/* 	var amount = $("#" + title + "_amount").val();
		 var price = parseInt($("#" + title + "_price").text());
		 var set = (price * amount); */

		//낼 다시할것
		var eachsum = each_sum(title);
		var allsum = $("#all_sum").text();
		allsum = removeCommas(allsum) * 1;

		if ($(this).prop("checked")) {
			allsum = allsum + eachsum;

			final_set(allsum);

			//------
			check(name);
		} else {
			uncheck(name);
			allsum = allsum - eachsum;
			final_set(allsum);
		}

		$(".check").each(function() {
			if (!$(this).prop("checked")) {
				result = false;
			}
		});
		$("#check_all").prop("checked", result);

		name = "[title=check_all]";
		if (result) {
			check(name);
		} else {
			uncheck(name);
		}

	});

	//-------------------------Cursor---------------------------------
	$(".material-icons").mouseover(function() {
		$(".material-icons").css({
			'cursor' : 'pointer'
		});
	});

	//---------------------------------------------------------------------------------------------

	//--------------------minus--------------------------------
	$(".minus").click(function() {
		var title = $(this).attr("title");
		var num = $("#" + title + "_amount").val();
		num--;
		if (num < 1) {
			num = 0;
		} else {

			$("#" + title + "_amount").val(num);
			set();

		}

		var check = $("#" + title + "_check").prop("checked");
		var name = $(this).attr("class");
		if (check && num > 0) {
			clickchange(title, name);
		}

	});

	//---------체크일 때 수량 변경시 결제가격 수정-------------------------
	function clickchange(title, name) {
		var eachsum = each_sum(title);
		var allsum = $("#all_sum").text();
		allsum = removeCommas(allsum) * 1;
		var price = $("#" + title + "_price").text();

		price = removeCommas(price);

		if (name == "minus") {
			allsum = allsum - price;
		} else if (name == "plus") {
			allsum = allsum + price * 1;
		}
		final_set(allsum);

	}

	//-----------------plus--------------------------------------	

	$(".plus").click(function() {
		var title = $(this).attr("title");
		var num = $("#" + title + "_amount").val();
		num++;
		$("#" + title + "_amount").val(num);
		set();
		var check = $("#" + title + "_check").prop("checked");
		var name = $(this).attr("class");
		if (check) {
			clickchange(title, name);
		}
	});

	//--------------첫 화면 뿌리기---------------------------------------
	$(document).ready(function() {
		$(".price").each(function() {
			var id = $(this).attr("id");
			var price = parseInt($(this).text());
			var text = addCommas(price);
			text = text + "원";
			$("#" + id).text(text);

		});

		set();

	});

	//-------------------총 합계---------------------------------------

	function set() {

		//---------plus가 공통 클래스여서 사용 다른의미는 없음-----------------
		var sum = 0;
		$(".plus").each(function() {
			var title = $(this).attr("title");

			var amount = $("#" + title + "_amount").val();
			var price = $("#" + title + "_price").text();

			price = removeCommas(price) * 1;
			var set = (price * amount);
			sum = sum + set;
			var text = addCommas(set); // set은 각각의 합계 , sum은 모든 합계
			text = text + "원";

			$("#" + title + "_total").text(text);

		});

		return sum;
	}

	//----------------합계 금액 함수------------------------
	function each_sum(title) {

		var amount = $("#" + title + "_amount").val();
		var price = $("#" + title + "_price").text();
		price = removeCommas(price);

		var set = (price * amount);

		return set;
	}

	//------------------- 마지막 계산 금액 함수-------------------

	function final_set(sum) {

		//--------합계 금액-----------------
		var text = addCommas(sum);
		text = text + "원";
		$("#all_sum").text(text);

		//--------------배송비----------------------------
		var deli = 3000;
		if (sum > 100000 || sum == 0) {
			deli = 0;
		}
		var text = addCommas(deli) + "원";
		$("#deli").text(text);
		//------------쿠폰 적립금 사용시-----------------------
		if (sum > 0) {
			var discount = 5000; //나중에 값 받아올곳 
		} else {
			discount = 0;
		}

		text = addCommas(discount) + "원";
		$("#discount").text(text);

		//-----------최종 결제 금액------------------
		var payment = sum + deli - discount;
		text = addCommas(payment) + "원";
		$("#payment").text(text);

	}

	//-------------직접 입력하고 빠져 나올 때---------------------------------

	$(".in").each(function() {
		$(this).blur(function() {

			var sum = set();
			var title = $(this).attr("title");
			var check = $("#" + title + "_check").prop("checked");
			if (check) {

				final_set(sum);
			}
		});
	});

	//----------------숫자 콤마 생성--------------------------------------------
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//-----------------콤마 삭제-------------------------------------

	function removeCommas(x) {
		if (!x || x.length == 0)
			return "";
		else
			var text = x.split("원").join("");
		return text.split(",").join("");
	}

	function removeId(x, id) {
		if (!x || x.length == 0)
			return "";
		else
			var text = x.split(id).join("");
		return text;
	}

	//-------------------------------
	$(".sum_text").css({
		'color' : 'red',
		'font-weight' : 'bold'
	});
</script>
</html>