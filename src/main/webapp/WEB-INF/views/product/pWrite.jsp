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
<form action="./${p}Write" method="post" enctype="multipart/form-data" id="frm">

    <div class="form-group">
      <label for="productName">productName:</label>
      <input type="text" class="form-control" id="productName" placeholder="Enter productName" name="productName" >
    </div>
    
   <div class="form-group">
      <label for="price">price :</label>
      <input type="text" class="form-control" id="price " placeholder="Enter price " name="price" >
      <!-- 밸류값을 줘서 로그인 하고 들어가야 함 -->
    </div>

   <div class="form-group" >
		    <label for="contents">Contents:</label>
		    <textarea rows="20" cols="" class="form-control" id="contents" name="contents"></textarea>
	</div> 
	
    <div class="form-group">
      <label for="point">POINT:</label>
      <input type="text" class="form-control" id="point" placeholder="Enter point" name="point" >
    </div>
    <div class="form-group">
      <label for="point">SALE%(숫자만입력):</label>
      <input type="text" class="form-control" id="sale" placeholder="Enter sale%" name="sale" >
    </div>
    
	<!-- 이 버튼을 클릭하면 파일 추가하는 버튼이 생기는 것 // 받을 때는 배열로 받음-->
		<input type="button" id="add" class="btn btn-info" value="AddFile"><br>
		<!-- 메인에 올 첫번째 사진파일 버튼을 준다 -->
		<br>
		<input type="file" name="firstFile">
		<div id="file">
		
		</div> 
	<br>
    <input type="button" id="btn" class="btn btn-danger" value="submit">
  </form>

</div>


<!-- 썸머노트경로를 준다. -->
<script type="text/javascript" src="../resources/script/productForm.js"> </script>  

</body>
</html>
