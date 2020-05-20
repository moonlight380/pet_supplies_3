<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
/* 	table{
		border-collapse: collapse;
	}
	table tbody{
		border-top: 15px solid white;
	} */

	table{
		border-collapse: separate;
		border-spacing: 5em;
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
									<c:forEach items="${ cartSelect}" var="cart" begin="0" end="0">
										<tr class="table_body pCount" style="text-align: center;">      <!-- for문으로 뿌리고 자바스크립트로 테이블 고치기 -->
											<td rowspan="" id="c">${cart.cnum }tm12325s</td>
											<td><img src="../resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
											<td>1545t43tdetr</td>
											<td>123,123</td>
											<td>5개</td>
											<td>500P</td>
											<td>합계asdasdas</td>
										
										</tr>
										<c:forEach items="${cartSelect}" var="cart" begin="1">
											<tr class="table_body pCount" style="text-align: center;"> 
												<td><img src="../resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
												<td>1545t43tdetr</td>
												<td>123,123</td>
												<td>5개</td>
												<td>500P</td>
												<td>합계</td>
											</tr>
										
										</c:forEach>
									</c:forEach>
									<tr style="line-height: 30px;">
											<th>&nbsp;</th>
										</tr>
									
									<c:forEach items="${ cartSelect}" var="cart" begin="0" end="0">
										<tr class="table_body pCount2" style="text-align: center;">      <!-- for문으로 뿌리고 자바스크립트로 테이블 고치기 -->
											<td rowspan="" id="d">${cart.cnum }tm12325s</td>
											<td><img src="../resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
											<td>1545t43tdetr</td>
											<td>123,123</td>
											<td>5개</td>
											<td>500P</td>
											<td>합계</td>
										
										</tr>
										<c:forEach items="${cartSelect}" var="cart" begin="1">
											<tr class="table_body pCount2" style="text-align: center;"> 
												<td><img src="../resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
												<td>1545t43tdetr</td>
												<td>123,123</td>
												<td>5개</td>
												<td>500P</td>
												<td>합계</td>
											</tr>
										
										</c:forEach>
									</c:forEach>
										
									<%-- 	<tr class="table_body" style="text-align: center;">
											<td>asd</td>
											<td><img src="../resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>
											<td>d</td>
											<td>f</td>
											<td>g</td>
											<td>h15656</td>
											<td>j124</td>
										
										</tr> --%>
										
										
										<tr style="line-height: 30px;">
											<th>&nbsp;</th>
										</tr>
										
									
								</tbody>
							</table>
							<script type="text/javascript">
								var a = $("#c").attr("rowspan");
								var b = 0;
								var c = 0;
								$(".pCount").each(function(){
									b++;
								});
								$(".pCount2").each(function(){
									c++;
								});
								console.log("asdasd");
								console.log(a);
								console.log(b);
								$("#c").attr("rowspan",b);
								$("#d").attr("rowspan",b);
								console.log("asd : "+$("#c").attr("rowspan"));
							</script>
							
							
							
								
						</div>
						
						
						
						<div class="row mt-5" style="border-bottom: 1px solid black; font-weight: bold; color: black;">
							<div style="margin-left: 21px;">
							구매 내역
							</div>
							
						
						</div>
						<div class="row">asdasd25345asrfet23</div>
					
					</div>
					<div class="col-sm-2"></div>
				</div>
			
			</div>		

		
		
		</div>
	
	
	</div>
	
</body>
</html>