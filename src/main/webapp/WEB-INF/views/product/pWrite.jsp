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


<style type="text/css">
.productName_div{
	margin-top: 30px;
}
.bg_gray{
	margin-top:100px;
	width: auto;
	height: 0px;
}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container">
<form action="./${p}Write" method="post" enctype="multipart/form-data" id="frm">
 <div class="breadcrumb_section bg_gray page-title-mini">
     <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
        	<div class="col-md-6">
                <div class="page-title">
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="../">홈</a></li>
                    <li class="breadcrumb-item"><a href="./dogList"><strong>상품 전체 리스트</strong></a></li>
                    <li class="breadcrumb-item"><a href="#"><strong>상품 입력 폼</strong></a></li>                    
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
    <div class="form-group productName_div">
    	<label for="productName">productName:</label>
    	<input type="text" class="form-control" id="productName" placeholder="Enter productName" name="productName" >
    </div>
   <div class="form-group">
      <label for="price">price(숫자만입력) :</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price">
    </div>
    
	<div id="priceContents"></div>
	
   <div class="form-group" >
		    <label for="contents">Contents:</label>
		    <textarea rows="20" cols="" class="form-control" id="contents" name="contents"></textarea>
	</div> 
	
    <div class="form-group">
      <label for="point">POINT(숫자만입력):</label>
      <input type="text" class="form-control" id="point" placeholder="Enter point" name="point" >
    </div>
    <div id="pointContents"></div>
    
    <div class="form-group">
      <label for="point">SALE%(숫자만입력):</label>
      <input type="text" class="form-control" id="sale" placeholder="Enter sale %" name="sale" >
    </div>
    <div id="saleContents"></div>
    
	<!-- 이 버튼을 클릭하면 파일 추가하는 버튼이 생기는 것 // 받을 때는 배열로 받음-->
		<input type="button" id="add" class="btn btn-info" value="AddFile"><br>
		<!-- 메인에 올 첫번째 사진파일 버튼을 준다 -->
		<br>
		<input type="file" name="firstFile">
		<div id="file">
		
		</div> 
	<br>
    <input type="submit" id="btn" class="btn btn-danger" value="submit">
  </form>

</div>


<script type="text/javascript" src="../resources/script/pWrite.js"> </script>



</body>
</html>
