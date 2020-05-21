<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.table_body td{
		border : 1px solid gray;
		
	}
	
	.table_title th{
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
			<div class="col">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col">
						<div class="row mb-4" style="border-bottom: solid 1px black; font-weight: bold; color: black;">
							<div style="margin-left: 21px;">주문 조회</div>
						</div>
						<div class="row">
							<table>
								<colgroup>
									<col style="width: 130px"/>
									<col style="width: 250px" />
									<col style="width: 400px" />
									<col style="width: 150px" />
									<col style="width: 120px" />
									<col style="width: 100px" />
									<col style="width: 130px" />
								</colgroup>
								
								<thead>
								
									<tr class="table_title"  style="text-align: center;  line-height: 60px;">
										<th>주문 번호</th>
										<th>이미지</th>
										<th>상품정보</th>
										<th>판매가</th>
										<th>수량</th>
										<th>적립금</th>
										<th>후기</th>
										
									</tr>
									<tr style="line-height: 30px;">
										<th>&nbsp;</th>
									</tr>
							
									
								</thead>
							
							
								
									
								<tbody>
								
								
									<c:forEach items="${ orderList}" var="order" varStatus="index">
										<tr class="table_start table_body" id="id_${index.index}" title="${order.orderNum}" style="text-align: center;">      <!-- for문으로 뿌리고 자바스크립트로 테이블 고치기 -->
											<td rowspan="1" class="${order.orderNum}_row"  title="${index.index}">${order.orderNum }<br>${order.regDate }</td>
											<td><img src="${pageContext.request.contextPath}/resources/dogUpload/${order.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
											<td>${order.productName }</td>
											<td class="price comma" title="price">${order.price}</td>
											<td class="comma" title="amount">${order.amount}</td>
											<td class="comma" title="point">
												<c:set var="point" value="${order.amount * order.point}"/>
												<c:out value="${point}"/>
											</td>
											<td>합계</td>
										
										</tr>
										
									</c:forEach>
									
									
									
									
								</tbody>
							</table>
							
							
							
							<script type="text/javascript">
								
								$(".table_start").each(function(){
									var title = $(this).attr("title");
									var cname = "."+title+"_row";
									$(cname).each(function(){
										var rows = $(cname+":contains('"+$(this).text()+ "')" );
										if(rows.length>1){
											rows.eq(0).attr("rowspan",rows.length);
											rows.not(":eq(0)").remove();
											var id = rows.first().attr("title");
											id = "id_"+id;
										
											$('#'+id).before('<tr style="line-height: 30px;">'+
															'<th>&nbsp;</th>'+
															'</tr>');
											
											
										}
										
									});
									
									
									
								});
								
								$(".comma").each(function(){
									var x = $(this).text();
									x = addCommas(x);
									var check = $(this).attr("title");
									if(check=="price"){
										x = x+"원";
										$(this).text(x);
									} else if(check=="point"){
										x = x+"P";
										$(this).text(x);
									} else if(check=="amount"){
										x = x+"개";
										$(this).text(x);
										
									}
								});
								
								
								function addCommas(x) {
									return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								}
								
							</script>
					
							
							
							
								
						</div>
						
						
						
						<div class="row mt-5" style="border-bottom: 1px solid black; font-weight: bold; color: black;">
							<div style="margin-left: 21px;">
							구매 내역
							</div>
							
						
						</div>
						<div class="row">aa</div>
						<div class="row">bb</div>
						<div class="row">cc</div>
						<div class="row">bb</div>
						<div class="row">bb</div>
						<div class="row" id="c">bb</div>
						<script type="text/javascript">
							$("#c").after("<h1>asd</h1>");
						
						</script>
						
					</div>
					<div class="col-sm-2"></div>
				</div>
			
			</div>		

		
		
		</div>
	
	
	</div>
	
</body>
</html>