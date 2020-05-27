<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fulid mt-5">
		<div class="row">
			<c:import url="./memberSide.jsp"></c:import>
			<div class="col-sm-1"></div>
			<div class="col">
				<div class="row mt-5 mb-5" style="border-bottom: 1px solid black;padding-left: 15px;" >리뷰 목록</div>
				<div class="row">
				
					
					<table>
									<colgroup>
										<col style="width: 200px" />
										<col style="width: 700px" />
										<col style="width: 150px" />
										
									</colgroup>

									<thead>

										<tr class="table_title"
											style="text-align: center; line-height: 60px;">
											<th>상품 이미지</th>
											<th>상품 후기</th>
											<th>등록일</th>

										</tr>
										<tr style="line-height: 30px;">
											<th>&nbsp;</th>
										</tr>
										
										<c:forEach items="${mr }" var="mr">
											<tr class="table_title"
											style="text-align: center; line-height: 60px;">
											<td>
												<a href="${pageContext.request.contextPath}/product/dogSelect?productNum=${mr.productNum}" target="_blank">
													<img src="${pageContext.request.contextPath}/resources/dogUpload/${mr.fileName }"
														style="width: 100px; height: 100px; margin: 15px 0px 15px 0px;">
												</a>
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/review/reviewSelect?num=${mr.num}">
													${mr.title }
													${mr.contents }
												</a>
											</td>
											<td>
												${mr.regDate }<br>
												조회수 : ${mr.hit }<br>
												작성자 : ${mr.id }
												
											</td>

										</tr>
										<tr style="line-height: 30px; border-bottom: 1px solid #bbbfc3" >
											<th>&nbsp;</th>
											<th></th>
											<th></th>
										</tr>
										
										
										</c:forEach>


									</thead>




									<tbody>


										




									</tbody>
								</table>
				
				
				</div>
				
				
			
			
			</div>
			<div class="col-sm-2"></div>
			
			
		</div>
	
	
	</div>
	
	
	
	
	
	
</body>
</html>