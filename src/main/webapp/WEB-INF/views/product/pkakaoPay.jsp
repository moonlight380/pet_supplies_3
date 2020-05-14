<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="Anil z" name="author">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Shopwise is Powerful features and You Can Use The Perfect Build this Template For Any eCommerce Website. The template is built for sell Fashion Products, Shoes, Bags, Cosmetics, Clothes, Sunglasses, Furniture, Kids Products, Electronics, Stationery Products and Sporting Goods.">
<meta name="keywords" content="ecommerce, electronics store, Fashion store, furniture store,  bootstrap 4, clean, minimal, modern, online store, responsive, retail, shopping, ecommerce store">
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>

<style>
span {
	width: 60px;
	display: inline-block;
}

textarea {
	width: 40%;
	height: 280px;
}

.kakao_div{
display:inline-block; 
width: 300px;
height: 600px;
border: solid gray 1px;
background-color: rgba(255,238,51,0.99);
margin-left: 38%;
padding: 15px;


}


.kakao_margin{
margin-bottom: 15px;

}
</style>
</head>



<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
	<div class="kakao_div">
	<i class='fas fa-comment kakao_margin'></i> kakao pay
	<br>
		  <form action="./kakao" method="get">
		    <div class="form-group">
		      <label for="name">Name:</label>
		      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
		    </div>
		    
		 	<div class="form-group">
		      <label for="phone">Phone:</label>
		      <input type="tel" class="form-control" id="phone" placeholder="Enter phone" name="phone">
		    </div>
		    
		     <div class="form-group">
		      <label for="totalPrice">TotalPrice:</label>
		      <input type="text" class="form-control" id="totalPrice" placeholder="Enter totalPrice" name="totalPrice">
		    </div>
		    
		    <input type="submit" class="btn btn-danger" value="Submit"><br>
		    <br>
		    <input type="reset" class="btn btn-danger" value="Cancel">
		    <br>
		    <br>
		    
		  </form>
	</div>
</div>
<br>
<br>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>

