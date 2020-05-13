<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
 
</head>

<body>
<c:import url="../template/header.jsp"></c:import>
  <!-- Page Content -->
  <div class="container">
	<div class="row">
	
	<h1>${p} New List PAGE</h1>
	
	<form class="col-xs-6" action="./${p}NewList">
    <div class="input-group">
    <select class="form-control" id="sel1" name="kind">
		    <option value="pn">productName</option>
		    <option value="pc">Contents</option>
			<option value="pnum">productNum</option>
			
		</select>
		<input type="text" class="form-control" placeholder="Search" name="search">
		
		<div class="input-group-btn">
       		 <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
     	 </div>
	</div>
 	 </form>
 	 
	</div>
 <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3"> Welcome to product Mall!</h1>
      <p class="lead">신상품</p>
      <a href="#" class="btn btn-primary btn-lg">Call to action!</a>
    </header>  

    <!-- Page Features -->

    <div class="row text-center">
<c:forEach items="${list}" var="vo">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="${pageContext.request.contextPath}/resources/product_img/gum.jpg" alt="">
          <div class="card-body">
    
            <h4 class="card-title"><a href="./${p}Select?productNum=${vo.productNum}">${vo.productName}</a></h4>
            <h4 class="card-title">${vo.price}</h4>
            <p class="card-text">${vo.contents}</p>
     
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>
  </c:forEach>



      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">상품리스트</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<div class="container">

	


<table class="table table-hover">
			<tr>
				<td>productNum</td>
				<td>productName</td>
				<td>price</td>
				<td>contents </td>
				<td>amount</td>
				<td>HIT</td>
				<td>date</td>
			</tr>
			<c:forEach items="${list}" var="vo">
			<tr>
			<td>${vo.productNum}</td>
			<td><a href="./${product}Select?productNum=${vo.productNum}">${vo.productName}</a></td>
			<td>${vo.price}</td>
			<td>${vo.contents}</td>
			<td>${vo.amount}</td>
			<td>${vo.hit}</td>
			<td>${vo.regDate}</td>
			</tr>
			
			</c:forEach>

		</table>
</div>	
	
		<div class="container">
			<ul class="pagination">
			<c:if test="${pager.curBlock gt 1 }">
			<!-- 1보다 크다면 -->
					<li><a href="./${p}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
			</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><a href="./${p}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
			<!-- 작다면 lt -->
				<li><a href="./${p}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a></li>
			</c:if>
			</ul>
		
		
		

		
		</div>
	

		

</body>
</html>