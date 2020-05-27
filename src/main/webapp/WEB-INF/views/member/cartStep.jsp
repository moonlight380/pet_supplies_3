<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<div class="row" style="margin-top: 150px;">
			<div class="col-sm-1"></div>
			<div class="col ">
				<div class="row" style="/*  border-bottom: 1px solid #333333; */">
					<div class="col" style="font-size: 38px;line-height: 56px; color: #363636;
					font-weight: bold; letter-spacing: -1px;" id="step_text">장바구니
					</div>
					<div class="col" style="text-align: right; line-height: 3;">
						
						<span  id="step1">장바구니 ></span>
						<span  id="step2">주문/결제 ></span>
						<span  id="step3">주문완료 </span>
					</div>
				</div>
				
				
			</div>
			
			<div class="col-sm-2"></div>
		
		</div>

<script type="text/javascript">
	var step = $("#step").attr("title");
	$("#"+step).css({'font-weight':'bold','color':'#FF324D'});
	var step1 = "장바구니";
	var step2 = "주문/결제";
	var step3 = "주문완료";
	
	if(step=="step1"){
		$("#step_text").text("장바구니");
	} else if(step=="step2"){
		$("#step_text").text("주문/결제");
		
	} else if(step=="step3"){
		$("#step_text").text("주문완료");
		
	}

</script>
</html>