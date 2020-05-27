



$("#result").on("click","#payClick",function(){
	
		var priceAll = $("#payment").text();
		priceAll = removeCommas(priceAll);
		var charge = $("#deli").text();
		charge = removeCommas(charge);
		var discount = $("#discount").text();
		discount = removeCommas(discount); 
		var id =$("#id").attr("title");
		
		var count=0;
		$(".check").each(function(){
			
			var check=$(this).prop("checked");
			if(check){
				count++;
			}
		});
		if(count>0){
		 	$.ajax({
				type:"post",
				traditional : true,
				url:"./memberPayment",
				data:{
					priceAll:priceAll,
					charge:charge,
					id:id
				},
				success:function(data){
					var ids=[];
					$(".plus").each(function(){						//오더인포에 정보 보낼떄 사용
						var title =$(this).attr("title");
						var check = $("#"+title+"_check").prop("checked");
						var cnum = $("#"+title+"_amount").attr("name");
						if(check){
							ids.push(cnum);
						}
					});
					 $.ajax({
						type:"post",
						traditional : true,
						url:"./memberPaymentList",
						data:{
							ids:ids
						},
						success:function(data){
							 location.href="./memberPayment"; 
						}
					});
					
				}
			}); 
		} else{
			alert("선택된 상품이 없습니다.\n상품을 선택해 주세요.");
		}
});


//--------------------선택상품삭제---------------


$("#result").on("click","#del",function() {
	var ids = [];
	$(".check").each(function() {
		if($(this).prop("checked")){
			
			
			ids.push($(this).attr("name"));
		}
	});
	
	

	$.ajax({
					type : "get",
					traditional : true,
					url : "./cartDelete",
					data : {
						ids : ids
					},
					success : function(data) {
						$.get("./memberCartRefresh", function(data) {
							$("#result").html(data.trim());
							location.reload();
							reset();
						});
					}
					

				});
				

			});

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

	$("#result").on("click", "#check_all", function() {
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

	$("#result").on("click", ".check", function() {
		var result = true;
		var name = "[title=" + $(this).attr("id") + "]";
		var title = $(this).attr("title");

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
		set();

	});

	//-------------------------Cursor---------------------------------
	$("#result").on("mouseover", ".material-icons", function() {

		$(".material-icons").css({
			'cursor' : 'pointer'
		});
	});

	//---------------------------------------------------------------------------------------------

	//--------------------minus--------------------------------
	$("#result").on("click", ".minus", function() {
		var title = $(this).attr("title");
		var num = $("#" + title + "_amount").val();
		num--;
		if (num < 1) {
			num = 0;
		} else {

			$("#" + title + "_amount").val(num);
			set();

		}

		cartUpdate(title);

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

	$("#result").on("click", ".plus", function() {
		var title = $(this).attr("title");
		var num = $("#" + title + "_amount").val();
		num++;
		$("#" + title + "_amount").val(num);
		cartUpdate(title);
		set();
		var check = $("#" + title + "_check").prop("checked");
		var name = $(this).attr("class");
		if (check) {
			clickchange(title, name);
		}
	});

	//--------------첫 화면 뿌리기---------------------------------------

	function reset() {
		$(".price").each(function() {
			var id = $(this).attr("id");
			var price = parseInt($(this).text());
			var text = addCommas(price);
			text = text + "원";
			$("#" + id).text(text);
			
			

		});
		inout(); //--blur함수 적용
		set();
	}

	$(document).ready(function() {
		$("#check_all").prop("checked", true);
		$(".check").prop("checked", $("#check_all").prop("checked"));
		var name = ('.' + $("#check_all").prop("title"));
		var sum = set();
		check(name);
		final_set(sum);

		reset();

	});

	//-------------------총 합계---------------------------------------

	function set() {

		//---------plus가 공통 클래스여서 사용 다른의미는 없음-----------------
		var sum = 0;
		var view_point=0;
		var sumP=0;
		var title;
		var sd=0;
		$(".plus").each(function() {
			title = $(this).attr("title");

			var amount = $("#" + title + "_amount").val();
			var price = $("#" + title + "_price").text();
			var point = $("#"+title+"_point").attr("name");
			var discount = $("#"+title+"_sale").attr("title");
			$("#"+title+"_sd").text(discount*amount);
			
			
			
			
			
			view_point = amount*point;
			sumP=sumP+view_point;
			view_point = addCommas(view_point);
			view_point = view_point + "P";
			
			$("#"+title+"_point").text(view_point);
			price = removeCommas(price) * 1;
			var set = (price * amount);
			var check = $("#" + title + "_check").prop("checked");

			if (check) {
				sd = sd + $("#"+title+"_sd").text()*1;
				sum = sum + set;
			}
			
			var text = addCommas(set); // set은 각각의 합계 , sum은 모든 합계
			text = text + "원";
			$("#" + title + "_total").text(text);
		});
		sd = addCommas(sd);
		sd = sd+"원";
		$("#discount").text(sd);
		
			
		
		
		sumP=addCommas(sumP);
		sumP=sumP+"P";
		
		$("#mAllMileageSum").text(sumP);
		
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
		$(".all_sum").each(function(){
			$(this).text(text);
		});
		$("#all_sum").text(text);

		//------------쿠폰 적립금 사용시-----------------------
	/*	var discount = $("#discount").text();
		discount = removeCommas(discount);*/
		var discount=0;
		$(".plus").each(function() {
			var title = $(this).attr("title");
			var price = $("#" + title + "_price").text();
			price = removeCommas(price);
			var amount = $("#" + title + "_amount").val();
			var sale = $("#"+title+"_sale").attr("title");
			var check = $("#" + title + "_check").prop("checked");
			var a=amount*sale;
			
			price = amount*(price-sale);
			if(check){
				discount=discount+a;
			}
			$("#discount").text(addCommas(discount)+"원");
			price = addCommas(price);
			price = price+"원";
			$("#"+title+"_dc").text(price);
		});
		
		
		//--------------배송비----------------------------
		var deli = 3000;
		if (sum-discount > 100000 || sum == 0) {
			deli = 0;
		}
		var text = addCommas(deli) + "원";
		$("#deli").text(text);


		//-----------최종 결제 금액------------------
		var payment = sum + deli - discount;
		text = addCommas(payment) + "원";
		$(".paymentPrice").each(function(){
			$(this).text(text);
			
		});  
		$("#payment").text(text);

	}

	//-------------직접 입력하고 빠져 나올 때---------------------------------
	function inout() {
		$(".in").each(function() {
			$(this).blur(function() {

				var sum = set();
				var title = $(this).attr("title");
				var check = $("#" + title + "_check").prop("checked");

				cartUpdate(title);
				if (check) {

					final_set(sum);
				}
			});
		});

	}

	//----------------숫자 콤마 생성--------------------------------------------
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//-----------------콤마 삭제-------------------------------------

	function removeCommas(x) {
		if (!x || x.length == 0)
			return "";
		else {
			
			var text = x.split("원").join("");
		} 
		return text.split(",").join("");
	}
	
	function removeP(x){
		if (!x || x.length == 0)
			return "";
		else {
			
			var text = x.split("P").join("");
		} 
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

	//-----------------수량 변경시 DB Update--------------------

	function cartUpdate(title) {
		var cnum = $("#" + title + "_amount").attr("name");
		var cAmount = $("#" + title + "_amount").val();
		$.ajax({
			type : "post",
			url : "./cartUpdate",
			traditional : true,
			data : {
				cnum : cnum,
				cAmount : cAmount
			}

		});

	}
	
/*	에러코드확인
 	error : function(request, status, error) {
		alert("code = " + request.status + " message = "
				+ request.responseText + " error = " + error);
	}
	
	*/
