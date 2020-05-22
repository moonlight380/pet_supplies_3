<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="Anil z" name="author">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Shopwise is Powerful features and You Can Use The Perfect Build this Template For Any eCommerce Website. The template is built for sell Fashion Products, Shoes, Bags, Cosmetics, Clothes, Sunglasses, Furniture, Kids Products, Electronics, Stationery Products and Sporting Goods.">
<meta name="keywords" content="ecommerce, electronics store, Fashion store, furniture store,  bootstrap 4, clean, minimal, modern, online store, responsive, retail, shopping, ecommerce store">



<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>

<style type="text/css">

.product_header_right{
	margin-left: 96%;

}
.bg_gray{
	width: auto;
	height: 60px;
}
</style>
</head>

<!-- --------------------------------------------------바디시작--------------------------------------------- -->
<body>
<div id="header">
<c:import url="../template/header.jsp"></c:import>
</div>

<!-- LOADER -->
<div class="preloader">
    <div class="lds-ellipsis">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- END LOADER -->

<!-- START SECTION BREADCRUMB -->
<div class="breadcrumb_section bg_gray page-title-mini">
    <div class="container"><!-- STRART CONTAINER -->
        <div class="row align-items-center">
        	<div class="col-md-6">
                <div class="page-title">
            		<h1>Shop Load More</h1>
                </div>
            </div>
            <div class="col-md-6">
 				<ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="../">홈</a></li>
                    <li class="breadcrumb-item"><a href="#">타임세일 리스트</a></li>                    
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->



<!-- START MAIN CONTENT -->
<div class="main_content">

<!-- START SECTION SHOP -->
 
<div class="section">
	<div class="container">
    	<div class="row">
			<div class="col-12">
            	<div class="row align-items-center mb-4 pb-1">
                    <div class="col-12">
                        <div class="product_header">

                            
                            <div class="product_header_right">
                            	<div class="products_view">
<!------------------------------------------------------admin 계정만 write 버튼이 보일 수 있도록//  -------------------------------------------------------------------- -->

								<c:if test="${member.id eq 'admin' }">
								
									<a href="./${p}Write"><i class='far fa-edit' style='font-size:44px;color:#FF324D'></i></a>	
									
								</c:if>
               
                                </div>
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------- -->      
                            	  <a href="javascript:Void(0);" class="shorting_icon grid active"><i class="ti-view-grid"></i></a>
      

                            </div>
                        </div>
                    </div>
                </div> 
                
                
                <!-- 시작 -->
                <div class="row shop_container grid_container loadmore" data-item="8" data-item-show="4" data-finish-message="No More Item to Show" data-btn="Load More">
                    
                    <c:forEach items="${list}" var="vo" varStatus="status" begin="0" end="300"> 
                    <div class="col-lg-3 col-md-4 col-6 grid_item">
                        
                        <div class="product">
                            <div class="product_img">
                                <a href="./${p}Select?productNum=${vo.productNum}">                             
                                    <img src="${pageContext.request.contextPath}/resources/dogUpload/${vo.productFileVOs['0'].fileName}" alt="X">
                              <!--  첫번째 이미지 가져오기 -->
                                </a>
                                <div class="product_action_box">
                                    <ul class="list_none pr_action_btn">
                                        <li class="add-to-cart">
                                             <a>	<!-- 추가한부분 class에 cart id,data-toggle,data-target -->
		                                        <i class="icon-basket-loaded cart" id="${vo.productNum}" data-toggle="modal" data-target="#myModal"></i>
		                                         Add To Cart
	                                         </a>   
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                            <div class="product_info">
                                <h6 class="product_title"><a href="./${p}SelectTimeSale?productNum=${vo.productNum}">${vo.productName} </a></h6>
                                <div class="product_contents">
                                
                                <span class="contents"><a href="./${p}SelectTimeSale?productNum=${vo.productNum}">${vo.contents}</a></span>				
								<!-- 타이머기능 -->                 			
                 				<div class="notice">               	
								 <div id="displayTimeSale" class="time_sale" style="">
				                    <strong class="time_sale_num"><span class="skip">타임세일</span></strong>
				                    <strong class="time_day">
									<span id="displayTimeSaleDay" class="time_day_view"><script type="text/javascript" src="../resources/script/timeSale.js"> </script> </span>
				                    </strong>
				                </div> 
								</div>  
  
                                </div>
                                <div class="product_price">
		                              <span class="price">
		                              <fmt:formatNumber value=" ${vo.price*(vo.sale*0.01)}" type="number"></fmt:formatNumber></span>
                                    <del>${vo.price}</del>
                                    <div class="on_sale">
                                        <span>${vo.sale}% Off</span>
                                    </div>
                                </div>
                                
                                
                           
                                <div class="list_product_action_box">
                                    <ul class="list_none pr_action_btn">
                                        <li class="add-to-cart">
                                             <a>	<!-- 추가한부분 class에 cart id,data-toggle,data-target -->
		                                        <i class="icon-basket-loaded cart" id="${vo.productNum}" data-toggle="modal" data-target="#myModal"></i>
		                                         Add To Cart
	                                         </a>   
                                        </li>
                                    </ul>
                                </div>
                                
                            </div><!-- product_info" -->
                        </div> <!-- product -->
                    </div> <!-- "col-lg-3 col-md-4 col-6 grid_item" -->

                    
                  </c:forEach>  
                </div><!-- "row shop_container grid_container loadmore" -->
                
                
        	</div> <!-- col-12 -->
        </div> <!-- row -->
    </div> <!-- container -->
</div><!-- section -->


<!-- 추가한부분 div addCart -->
<div id="quantityNum_amount"hidden="hidden">1</div>
<c:import url="../cart/addCart.jsp"></c:import>

<!-- END SECTION SHOP -->


</div>
<!-- END MAIN CONTENT -->



<!-- 추가한부분 div addCart -->
<div id="quantityNum_amount"hidden="hidden">1</div>
<c:import url="../cart/addCart.jsp"></c:import>


<!-- START FOOTER -->
<c:import url="../template/footer.jsp"></c:import>
<!-- END FOOTER -->



<a href="#" class="scrollup" style="display: none;"><i class="ion-ios-arrow-up"></i></a>                                                                                                                                                                                                                                                                                
<!-- Latest jQuery --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script> 
<!-- jquery-ui --> 
<script src="${pageContext.request.contextPath}/resources/s/jquery-ui.js"></script>
<!-- popper min js -->
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<!-- Latest compiled and minified Bootstrap --> 
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script> 
<!-- owl-carousel min js  --> 
<script src="${pageContext.request.contextPath}/resources/owlcarousel/js/owl.carousel.min.js"></script> 
<!-- magnific-popup min js  --> 
<script src="${pageContext.request.contextPath}/resources/js/magnific-popup.min.js"></script> 
<!-- waypoints min js  --> 
<script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script> 
<!-- parallax js  --> 
<script src="${pageContext.request.contextPath}/resources/js/parallax.js"></script> 
<!-- countdown js  --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script> 
<!-- fit video  -->
<script src="${pageContext.request.contextPath}/resources/js/Hoverparallax.min.js"></script>
<!-- imagesloaded js --> 
<script src="${pageContext.request.contextPath}/resources/js/imagesloaded.pkgd.min.js"></script>
<!-- isotope min js --> 
<script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script>
<!-- jquery.appear js  -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.appear.js"></script>
<!-- jquery.dd.min js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.dd.min.js"></script>
<!-- slick js -->
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<!-- Google Map Js -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7TypZFTl4Z3gVtikNOdGSfNTpnmq-ahQ&amp;callback=initMap"></script>
<!-- isotope-loadmore js -->
<script src="${pageContext.request.contextPath}/resources/js/isotope-loadmore.js"></script>
<!-- elevatezoom js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.elevatezoom.js"></script>
<!-- scripts js --> 
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>








</body>
</html>