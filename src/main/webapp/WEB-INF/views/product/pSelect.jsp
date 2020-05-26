<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="Anil z" name="author">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Shopwise is Powerful features and You Can Use The Perfect Build this Template For Any eCommerce Website. The template is built for sell Fashion Products, Shoes, Bags, Cosmetics, Clothes, Sunglasses, Furniture, Kids Products, Electronics, Stationery Products and Sporting Goods.">
<meta name="keywords" content="ecommerce, electronics store, Fashion store, furniture store,  bootstrap 4, clean, minimal, modern, online store, responsive, retail, shopping, ecommerce store">
<title>Insert title here</title>




<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>


<style type="text/css">
.bg_gray{
	width: auto;
	height: 60px;
}
.sum{
float: right;

}
.line{
	clear:both;
    margin-top: 30px;
    margin-bottom: 30px;
    border: 0;
    border-top: 1px solid rgba(0,0,0,.1);
}

.total_price{
	margin-bottom: 50px;
}

.cart_margin{
	float:right;
	margin-bottom: 20px;
}

.kakao-purchase{
	border-width: 1px;
	cursor: pointer;
	line-height: normal;
	padding: 12px 12px;
	text-transform: capitalize;
	transition: all 0.3s ease-in-out;
	background-color: rgba(255,238,51,0.99);
	float: right;
	margin-bottom: 20px;
	margin-right: 20px;
}

.admin_btn{
	float: right;
	margin-left: 20px;
}
#prdInfo .cont h3 {
    font-family: 'NotokrBold',sans-serif;
    font-size: 22px;
    color: #111;
    margin-bottom: 20px;
    font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
}

#prdInfo .prdInfo-cont .cont {
	font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
    display: inline-block;
    width: 50%;
    vertical-align: top;
    box-sizing: border-box;
    font-size: 13px;
    color: #999;
    margin-bottom: 3px;
    line-height: 1.8;
}
.contents_div_1{
	width: 45%;
	border: solid 1px #687188;
	line-height: auto;
	float: left;
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 70px;
	padding: 30px;
}
.contents_div_2{
	width: auto;
	border: solid 1px #687188;
	line-height: auto;
	clear:both;
	margin-left: 30px;
	margin-right: 30px;
	padding: 30px;
}

#page_free{
	z-index:99;
	position:absolute;
	top:10px;
	left:10px;
	text-align:left;
	border:1px solid #000;
	width: 720px;
	height: 850px;
	margin: 300px 1000px;
	padding: 10px;
}
#page_free img{border:10px soild #FFF;}
#page_free .new_btn{width:417px; height: 20px; background: #FFF; padding-top: 10px;text-align: right; border: 10px solid #FFF;}
body, th, td, input, select, textarea {
    font-size: 15px;
    line-height: 1.5;
    font-family: 'Montserrat','Noto Sans KR',-apple-system,BlinkMacSystemFont,helvetica,Apple SD Gothic Neo,sans-serif;
    color: #333;
}
.item_choice_list table tbody:last-child tr td {
    border-bottom: 1px solid #dbdbdb;
}
.item_choice_list .cart_prdt_name {
    text-align: left;
    padding: 20px 0 20px 20px;
}
.item_choice_list table colgroup+tbody tr td {
    border: none;
}
 #quantity_minus{
	 width: 30px;
	 height: 30px;
	 text-align: center;
	 padding: 0px; 
	 
}
#quantityNum{
	height: 30px;
	width: 30px; 
	text-align: center;
}

#quantity_plus{
	 width: 30px;
	 height:30px;
	 text-align: center;
	 padding: 0px;
} 

.item_detail_list dt {
    float: left;
    width: 70px;
    margin: 0 10px 0 0;
    color: #888888;
    font-weight: normal;
    word-wrap: break-word;
}
.item_mileage{
	margin-left: 10px;
}
</style>

<!-- 팝업창띄우기 -->

<!-- <script type="text/javascript">
	
function goPopup(){
		var popUrl = "../goPopup.jsp";	//팝업창에 출력될 페이지 URL

		var popOption ="width=800,height=900,scrollbars=no,location=no,toolbars=no,status=no"  
		//크롬에서는 속성값이 먹지 않음
		window.open( popUrl ,"popup name","width=800,height=900,scrollbars=no,location=no,toolbars=no,status=no");
	}
	
</script> -->

<!-- 레이어팝업 -->
<!-- <script type="text/javascript">
$(document).ready(function(){
//오늘 하루 팝업 열지 않기
$('#close_popup').click(function(){
	$.cookie('page_free','ck',{expires:1,path:'/'});
	$("#page_free").hide();
});
//팝업 닫기
$('#close_popup2').click(function(){
	$("#page_free").hide();
});
});
</script> -->
</head>

<!-- ------------------------------------body 시작---------------------------------- -->
<body>
<!-- <body onload="goPopup()"> -->

<%-- 
<!-- 레이어팝업 시작 -->
<div style="" id="page_free">
	<img src="${pageContext.request.contextPath}/resources/images/goPopup.jpg">
	<div class="new_btn">오늘 하루 열지 않기 <input type="checkbox" name="close_popup" id="close_popup"> &nbsp; &nbsp; &nbsp; &nbsp;닫기
	<input type="checkbox" name="close_popup2" id="close_popup2">
	</div>
</div>

<!--레이어팝업  끝--> --%>






<div id="header"> <!-- 추가한부분  header reset -->
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
            		<h1>Product Detail</h1>
                </div>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb justify-content-md-end">
                    <li class="breadcrumb-item"><a href="../">Home</a></li>  
                    <li class="breadcrumb-item active">Product Detail</li>
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->

<!-- START MAIN CONTENT -->
<div class="main_content">



<!-- select 시작 -->
<!-- START SECTION SHOP -->
<div class="section">
<div class="container">
		<div class="row">
            <div class="col-lg-6 col-md-6 mb-4 mb-md-0">      
              <div class="product-image">
              
                    <div class="product_img_box">
                        <img id="product_img" src="${pageContext.request.contextPath}/resources/dogUpload/${vo.productFileVOs['0'].fileName}" data-zoom-image="${pageContext.request.contextPath}/resources/dogUpload/${vo.productFileVOs['0'].fileName}" alt="product_img1" />
                       
                        <a href="#" class="product_img_zoom" title="Zoom">
                            <span class="linearicons-zoom-in"></span>
                        </a>
                        
                    </div> <!--  class="product_img_box" -->
                    
                </div> <!--  END class="product-image" -->
            </div> <!-- END class="col-lg-6 col-md-6 mb-4 mb-md-0" -->
            
        
            <div class="col-lg-6 col-md-6">
    
                <div class="pr_detail ">

                        <h4 class="product_title"><a href="#">${vo.productName}</a></h4>                       
   
           <!-- ------------------------------------------------------------------------------------------------------------ -->            
                  
			                    
			<div class="item_detail_list">
				<dl>
			      <dt>짧은설명</dt>
			           <dd>내 반려견을 위한 ${vo.productName}</dd>
			    </dl>
			    
		      <dl>
		          <dt>상품수량</dt>
		              <dd>
		                  <div class="quantity">
		                      <input id="quantity_minus" type="button" value="-"  class="minus">
		                      <input type="text" id="quantityNum" name="quantity" value="1" title="Qty" class="qty" size="4">
		                      <input id="quantity_plus" type="button"  value="+" class="plus" >
		                  </div> <!-- class="quantity" -->
		              </dd>
		                            
		             
		      </dl>
			     
						     <dl class="item_discount_mileage dn">
						            <dt>구매혜택</dt>
						              <dd>
						              		<c:if test="${vo.sale gt 0}">
						                   <span class="item_discount">할인 : ${vo.sale}%</span>
						                     </c:if>
						                    <span class="item_mileage">적립 마일리지 : ${vo.point}점</span>
						              </dd>
						     </dl>
						      <dl>
						            <dt>배송비</dt>
						             <dd>3,000원</dd>
						     </dl>
						     <dl>
						            <dt>브랜드</dt>
						            <dd>brand</dd>
						     </dl>
						     
						        <div class="cart-product-quantity">
			
			                       <div class="line"></div>
			                       
			                       <div class="total_price">
			                       <strong>총 상품금액</strong>
			                       (수량) 
			                       
			                       <span class="sum">
			                       <strong><!-- 총가격 -->
			                       <span  id="sum_price"><fmt:formatNumber value="${vo.price*(vo.sale/1000)}" type="number"></fmt:formatNumber></span> 
			                       </strong> <!-- 수량 -->
			                       
			                       (<span id="quantityNum_amount">1</span>)
			                       </span>
			                       </div> <!-- 총상품금액 끝 -->
  <!--마이너스 플러스 스크립트---------------------------------------------------------------------------------------------------------------- -->     
	               		<script type="text/javascript">
	               		var perPrice='${vo.price}';
	               		var num =1;
	               		$(".minus").click(function(){
	               			if(num==1){
	               				alert("최소수량은 1개 입니다.")
	               			}else{
	               			num = $("#quantityNum").val();
	               			num=num*1;
	               			
	               			num--;
	               			alert("minus :"+num);
	               			$("#quantityNum").val(num);
	               			
	               			
	               			/* alert("#quantityNum_amount".text()); */
	               			$("#quantityNum_amount").text(num); 
	               			
	               				
	               			$("#sum_price").text(num*perPrice);
	               			
	               			}
	               		});/*minus*/
	               		
	               		
	               		
						/*plus*/
						
	               		$(".plus").click(function(){
	               			num = $("#quantityNum").val();
	               			num=num*1;
	               			alert(num);
	               			num++;
	               			alert("plus:"+num);
	               			//$("#quantityNum").val(num);

	               			$("#quantityNum_amount").text(num); 

	               			$("#sum_price").text(num*perPrice);
	               			
	               		});/*plus*/
	
	               		
	               		</script>
                       
 <!--마이너스 플러스 스클립트 끝 ------------------------------------------------------------------------------------------------------------ -->                                           

                       <span class="cart_btn">

                            <button class="btn btn-fill-out btn-addtocart cart_margin cart" id="${vo.productNum}" data-toggle="modal" data-target="#myModal" type="button"><i class="icon-basket-loaded"></i> Add to cart</button> 

                        </span> <!-- "cart_btn" -->
                        <div id="quantityNum_amount"hidden="hidden">1</div>
						<c:import url="../cart/addCart.jsp"></c:import>
 					

                   <!-- 카카오버튼 -->
                       <span class="kakao_purchase">
                        	<button class=" btn kakao-purchase" type="button"  data-toggle="modal" data-target="#myModal"><i class='fas fa-comment' id='kakao'></i>kakao pay</button>
                         
                        </span>
                    </div><!-- END class="cart-product-quantity" -->
 
<div hidden="hidden" id="direct_cnum">${cnum}</div>

  





<!------------------------카카오 자바스크립트-------------------------->



    <script type="text/javascript">
	$(".kakao-purchase").mouseover(function(){
		$(".kakao-purchase").css({
			'cursor':'pointer'
		});
	});
    
 	$(".kakao-purchase").each(function(){
		$(this).click(function(){
			
		
			var id ="${member.id}";
			var productNum = "${vo.productNum}";
			var cAmount = 1*$("#quantityNum_amount").text();
			alert("수량:"+cAmount);
			if(confirm("카카오페이로 주문 하시겠습니까?")){
			$.ajax({
					type:"post",
					url:"../cart/cartInsert",
					data:{
						cAmount : cAmount,
						productNum:productNum,
						id:id
					},success : function(data){
						$.ajax({
							type:"get",
							url:"../cart/cartSelect",
							success:function(){
								location.href="../member/orderWait";
							}
						});
					}
				});
				
			} else{
				$(this).attr("data-target","");
				alert("취소 됐습니다.");
			}
			
		});
	}); 
	
    </script>               
<!------------------------카카오 자바스크립트  끝-------------------------->                   
                     
                     
                     <div class="line"></div>
                    
                   
                    
                    <div class="product_share">
                        <span>Share:</span>
                        <ul class="social_icons">
                            <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                            <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                            <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                            <li><a href="#"><i class="ion-social-youtube-outline"></i></a></li>
                            <li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
                        </ul>
                    </div> <!--  END class="product_share" -->
                    
                      <div class="line"></div>
                     
                    <c:if test="${member.id eq 'admin' }">
                    <div class="container"> 
						<a href="./${p }Update?productNum=${vo.productNum}"  class="btn btn-danger admin_btn">Update</a>
						<a href="./${p }Delete?productNum=${vo.productNum}"  class="btn btn-primary admin_btn">Delete</a>
					</div>
                    </c:if>
                    
                </div><!-- class="pr_detail" -->
            </div> <!-- class="col-lg-6 col-md-6" -->
        </div><!-- END class="row" -->
        
<!-- 탭으로 나누는 버튼 -->    

        <div class="row">
        	<div class="col-12">
            	<div class="large_divider clearfix"></div>
            </div>
        </div>
        
        
        <div class="row">
        	<div class="col-12">
            	<div class="tab-style3">
            	<!-- 상품 탭 이름 -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="Description-tab" data-toggle="tab" href="#Description" role="tab" aria-controls="Description" aria-selected="true">상품 상세</a>
                      	</li>
                      	
                      	<li class="nav-item">
                        	<a class="nav-link" id="Additional-info-tab" data-toggle="tab" href="#Additional-info" role="tab" aria-controls="Additional-info" aria-selected="false">배송/반품/교환/환불</a>
                      	</li>
                      	
                      	<li class="nav-item">
                        	<a class="nav-link" id="Reviews-tab" data-toggle="tab" href="#Reviews" role="tab" aria-controls="Reviews" aria-selected="false">상품 후기</a>
                        	
                      	</li>
                      	
                      	<li class="nav-item">
                        	<a class="nav-link" id="Reviews-tab" data-toggle="tab" href="#Reviews" role="tab" aria-controls="Reviews" aria-selected="false">상품 문의</a>
                      	</li>
                      	
                    </ul>
                    
                	<div class="tab-content shop_info_tab">
                      	<div class="tab-pane fade show active" id="Description" role="tabpanel" aria-labelledby="Description-tab">
                        	
						  	<!-- 이미지가 여러개 이므로 반복문 -->		
							 <c:forEach items="${vo.productFileVOs}" var="file">
									 <div>
									 	<img alt="" src="../resources/dogUpload/${file.fileName}">			
									</div> 
							</c:forEach>
							
							<div class="line"></div>
							
							<div class="cont contents_div_1">
											<h3>배송안내</h3>
												-배송 방법 : 택배<br>
												-배송 지역 : 전국지역<br>
												-배송 비용 : 2,500원<br>
												-배송 기간 : 3일 ~ 7일<br>
												-배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
							  						&nbsp;&nbsp;-고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
							</div>
							
							<div class=" height_line"></div>
							
							
							<div class="cont contents_div_1">
											<h3>교환 및 반품정보</h3>
											<div class="xans-element- xans-layout xans-layout-info">
											<span>080-850-0085</span>
										
										
											<b>교환 및 반품이 가능한 경우</b><br>
											- 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의<br>
											&nbsp;&nbsp;경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
											- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br>
											&nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<br>
											<br>
											
											<b>교환 및 반품이 불가능한 경우</b><br>
											- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
											&nbsp;&nbsp;포장 등을 훼손한 경우는 제외<br>
											- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
											&nbsp;&nbsp;(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에<br>
											&nbsp;&nbsp;따른 반품/교환은 제조사 기준에 따릅니다.)<br>
											- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 <br>
											&nbsp;&nbsp;제공한 경우에 한 합니다.<br>
											- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
											- 복제가 가능한 상품등의 포장을 훼손한 경우<br>
											&nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br>
											<br>
											※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
											&nbsp;&nbsp;(색상 교환, 사이즈 교환 등 포함)<br>
											</div>
										</div>
							
							<div class="cont contents_div_2">
						    <h3>상품결제정보</h3>
						            고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
						             정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
						      <br>
							      무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
							      주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
							      않은 주문은 자동취소 됩니다. <br>
						 	</div>
							
							<div class="line"></div>
							
							<div class="comments">
                            	<h5 class="product_tab_title"></h5>
                                <ul class="list_none comment_list mt-4">
                                    <c:forEach items="${list}" var="review">                                 
                                    <li>
	                                     <c:forEach items="${review.boardFileVOs}" var="review2">
	                                        <div class="comment_img">										 
												<img alt="" src="../resources/riviewUpload/${review2.fileName}">			
											
	                                        </div>
	                                        </c:forEach>
                                        <div class="comment_block">
                                          
                                            <p class="customer_meta">
                                                <span class="review_author">${review.id}</span>
                                                <span class="comment-date">${review.regDate}</span>
                                            </p>
                                            <div class="description">
                                                <p>${review.contents}</p>
                                            </div>
                                        </div>
                                    </li>
  									</c:forEach>
  
  
                                </ul>
                        	</div>
							
                      	</div> <!-- 첫번째 탭 끝 -->
                      	
                      	<!-- fade -->
                      	<div class="tab-pane fade" id="Additional-info" role="tabpanel" aria-labelledby="Additional-info-tab">
                        	<div class="prdInfo-cont">
								<div class="cont contents_div_1">
											<h3>배송안내</h3>
												-배송 방법 : 택배<br>
												-배송 지역 : 전국지역<br>
												-배송 비용 : 2,500원<br>
												-배송 기간 : 3일 ~ 7일<br>
												-배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
							  						&nbsp;&nbsp;-고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
								</div>
								</div>
								
								 <div class=" height_line"></div>
								 
								 
								 <div class="prdInfo-cont">
										<div class="cont contents_div_1">
											<h3>교환 및 반품정보</h3>
											<div class="xans-element- xans-layout xans-layout-info">
											<span>080-850-0085</span>
										
										
											<b>교환 및 반품이 가능한 경우</b><br>
											- 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의<br>
											&nbsp;&nbsp;경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
											- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br>
											&nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<br>
											<br>
											
											<b>교환 및 반품이 불가능한 경우</b><br>
											- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
											&nbsp;&nbsp;포장 등을 훼손한 경우는 제외<br>
											- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
											&nbsp;&nbsp;(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에<br>
											&nbsp;&nbsp;따른 반품/교환은 제조사 기준에 따릅니다.)<br>
											- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 <br>
											&nbsp;&nbsp;제공한 경우에 한 합니다.<br>
											- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
											- 복제가 가능한 상품등의 포장을 훼손한 경우<br>
											&nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br>
											<br>
											※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
											&nbsp;&nbsp;(색상 교환, 사이즈 교환 등 포함)<br>
											</div>
										</div>
										
							</div>
 						
 						<div class="line"></div>
 						
 						<div class="cont contents_div_2">
						    <h3>상품결제정보</h3>
						            고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
						             정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
						      <br>
						      무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
						      주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
						      않은 주문은 자동취소 됩니다. <br>
						 </div>
       
                      	</div>
                      	
   				<!-- 상품후기 -->              
   
   						<%-- <span class="price">${}</span>    --%> 	
                      	<div class="tab-pane fade" id="Reviews" role="tabpanel" aria-labelledby="Reviews-tab">
                        	<div class="comments">
                            	<h5 class="product_tab_title"></h5>
                                <ul class="list_none comment_list mt-4">
                                    <c:forEach items="${list}" var="review">                                 
                                    <li>
	                                     <c:forEach items="${review.boardFileVOs}" var="review2">
	                                        <div class="comment_img">										 
												<img alt="" src="../resources/riviewUpload/${review2.fileName}">			
											
	                                        </div>
	                                        </c:forEach>
                                        <div class="comment_block">
                                            
                                            <p class="customer_meta">
                                                <span class="review_author">${review.id}</span>
                                                <span class="comment-date">${review.regDate}</span>
                                            </p>
                                            <div class="description">
                                                <p>${review.contents}</p>
                                            </div>
                                        </div>
                                    </li>
  									</c:forEach>
  
  
                                </ul>
                        	</div>
                        	
                      	</div>
                	</div>
                </div>
            </div>
        </div>
        

    <!-- ---------------------------------------------------------------------------------------------------- -->    
        
<!--         <div class="row">
        	<div class="col-12">
            	<div class="small_divider"></div>
            	<div class="divider"></div>
                <div class="medium_divider"></div>
            </div>
        </div> -->
        
   
    </div><!-- END class="container" -->
</div>  <!-- END class="section" -->

<!-- END SECTION SHOP -->


</div>
<!-- END MAIN CONTENT -->




<c:import url="../cart/addCart.jsp"></c:import>
<!-- START FOOTER -->
<c:import url="../template/footer.jsp"></c:import>
<!-- END FOOTER -->

<a href="#" class="scrollup" style="display: none;"><i class="ion-ios-arrow-up"></i></a> 

<!-- Latest jQuery --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script> 
<!-- jquery-ui --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
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
<!-- elevatezoom js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.elevatezoom.js"></script>
<!-- Google Map Js -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7TypZFTl4Z3gVtikNOdGSfNTpnmq-ahQ&amp;callback=initMap"></script>
<!-- scripts js --> 
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>






</body>
</html>