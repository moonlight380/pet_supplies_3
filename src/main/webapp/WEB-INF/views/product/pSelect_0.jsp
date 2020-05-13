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
<c:import url="../template/summer.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading">productName</div>
    <div class="panel-body">${vo.productName}</div>
  </div>
  
    <div class="panel panel-default">
    <div class="panel-heading">price</div>
    <div class="panel-body">${vo.price}</div>
  </div>
  
      <div class="panel panel-default">
    <div class="panel-heading">Contents</div>
    <div class="panel-body">${vo.contents}</div>
  </div>
  
  <div class="panel panel-default">
  <div class="panel-body">${vo.amount}</div>
</div>

  <div class="panel panel-default">
  <div class="panel-body">${vo.regDate}</div>
</div>


  	<!-- 이미지가 여러개 이므로 반복문 -->		
	 <c:forEach items="${vo.productFileVOs}" var="file">
			 <div>
			 <img alt="" src="../resources/dogUpload/${file.fileName}">			
			</div> 
	</c:forEach>
		</div> 

<div class="container"> 
	<a href="./${p }Update?productNum=${vo.productNum}"  class="btn btn-danger">Update</a>
	<a href="./${p }Delete?productNum=${vo.productNum}"  class="btn btn-primary">Delete</a>
	
</div>

	
</body>
</html>