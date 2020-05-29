<%@page import="com.pet.p1.cart.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="text" hidden="hidden" value="${member.id}" id="memberId">
<input type="text" hidden="hidden" value="${cartCount}" id="ccount">
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm modal-dialog-centered">
      <div class="modal-content col">
      
        <!-- Modal Header -->
        <div class="mt-2 row">
        	<div class="col-sm-1">
        	
        	</div>
        	<div class="col text-center">
	          	<strong class="modal-title" style="color: black;">장바구니에<br> 상품을 담았습니다.</strong>
        	</div>
        	<div class="col-sm-1">
		        <button type="button" class="close" data-dismiss="modal" style="right:15px;position:absolute; height: 15px;width: 15px;">
		        ×
		        </button>
        	</div>
        </div>
    
        
        
      	<div class="row mt-3 mb-3">
      		<div class="col-sm-1"></div>
      		<div class="col text-center">
      			<a href="${pageContext.request.contextPath}/member/memberCart" 
      			class="btn border" style="font-size: 13px;padding: 5px; color: gray;">장바구니보기</a>
      			<a class="btn border" style="font-size: 13px; padding: 5px; margin-left: 0px; color: gray;" data-dismiss="modal">닫기</a>
	          	
      		</div>
      		<div class="col-sm-1"></div>
      		
      	</div>

        
      </div>
    </div>
  </div>
<script type="text/javascript">
	
	$(".cart").mouseover(function(){
		$(".cart").css({
			'cursor':'pointer'
		});
	});
	
	$(".cart").each(function(){
		$(this).click(function(){
			
			$(this).attr("data-target","#myModal");
			var id = $("#memberId").val();
			var productNum = $(this).attr("id");
			var cAmount = 1*$("#quantityNum_amount").text();
			var list=[];
			var check=0;
			



			<%
				if(session.getAttribute("ids")!=null){
					Long ids[] = (Long[])session.getAttribute("ids");
					for(int i=0;i<ids.length;i++){
						%>
						list.push('<%= ids[i]%>');

						
					<%	
					}
				}
			%>
			for(var i=0;i<list.length;i++){
				if(productNum==list[i]){
					check++;
				}
			}
			
			if(check>0){
				if(confirm("장바구니에 동일한 상품이 있습니다.\n장바구니에 추가하시겠습니까?")){
					$.ajax({
						type:"post",
						url:"../cart/overUpdate",
						data:{
							id:id,
							productNum:productNum
						},error : function(request, status, error) {
							alert(productNum);
							console.log("code = " + request.status + " message = "
									+ request.responseText + " error = " + error);
						}
					});
				} else{
					
					$(this).attr("data-target","");
					alert("취소 됐습니다.");
				}
				
				
			} else{
			
				if(confirm("장바구니에 추가하시겠습니까?")){
				$.ajax({
						type:"post",
						url:"../cart/cartInsert",
						data:{
							cAmount : cAmount,
							productNum:productNum,
							id:id
						},success : function(data){
							$.get("../member/memberCartHeader",function(data){
								$("#header").html(data.trim());
								console.log("asdasd");
							});
							$.get("../member/memberCartRefresh");
							console.log("check");
							
						} 
					});  
					} else{
						
						$(this).attr("data-target","");
						alert("취소 됐습니다.");
				}
			}
			
		});
	});
	


</script>



