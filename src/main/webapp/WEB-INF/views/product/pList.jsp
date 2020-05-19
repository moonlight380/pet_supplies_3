<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.addr_button{
	color: #323232;
    background: #ffffff;
    border: 1px solid #cbcbcb;
    min-width: 20px;
    height: 26px;
    line-height: 24px;
    font-size: 12px;
    text-align: center;
    display: inline-block;
    padding: 0 8px;
    vertical-align: middle;
    font-weight: normal;
}
</style>
    <script type="text/javascript">
    
        function openAddressList()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            window.open("./address_list",
                    "childForm", "width=1000, height=700, resizable = no, scrollbars = no");    
        }
 
   </script>
</head>
<!-- --------------------------------------------------바디시작--------------------------------------------- -->
 <body>
 <!-- 배송지시작 -->
<div class="orderArea">
	<div class="title">
		<h3>배송 정보</h3>
				<p class="required"><img src="/p1/resources/images/ico_required.gif" alt="필수"> 필수입력사항</p>
	</div>
<div class="ec-base-table typeWrite">
	<table border="1" summary="">
		<caption>배송 정보 입력</caption>
		<colgroup>
			<col style="width:139px;">
			<col style="width:auto;">
		</colgroup>
		

<!-- 국내 배송지 정보 -->
<tbody class="">
<tr class="">
	<th scope="row">배송지 선택</th>
		<td>
			<div class="address">
				<input id="sameaddr0" name="sameaddr" type="radio"><label for="sameaddr0">주문자 정보와 동일</label>
				<input id="sameaddr1" name="sameaddr" type="radio"><label for="sameaddr1">새로운배송지</label>	
					<span class="recent ec-shop-RecentDelivery ">
					최근 배송지 : <input id="recent_delivery_info0" name="recent_delivery_info" type="radio">
						
					</span>

					<input type="button" id="btn_shipp_addr" class="btn addr_button" onclick="openAddressList()" value="주소록보기">
			</div>
		</td>
</tr>

<!-- 성명 -->
<tr>
<th scope="row">받으시는 분 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td><input id="rname" name="rname" class="inputTypeText"  size="15" type="text"></td>
</tr>

<!-- 주소 -->
<tr>
<th scope="row">주소 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td>
		<input id="rzipcode1" name="rzipcode1"  class="inputTypeText" placeholder="" size="6" maxlength="6" readonly="1" type="text">							
		<a href="#none" id="btn_search_rzipcode" class="btn_function btncolor_basic"><span class="btn addr_button">우편번호</span></a><br>
		<input id="raddr1" name="raddr1" class="inputTypeText" placeholder="" size="40" readonly="1" type="text"> <span class="grid">기본주소</span><br>
		<input id="raddr2" name="raddr2" class="inputTypeText" placeholder="" size="40" type="text"> <span class="grid">나머지주소</span><span class="grid ">(선택입력가능)</span>
	</td>
</tr>

<!-- 일반전화 -->
<tr class="">
<th scope="row">일반전화 <span class="displaynone"></span>
</th>
	<td>
		<select id="rphone1_1" name="rphone1_1" >
			<option value="02">02</option>
			<option value="031">031</option>
			<option value="032">032</option>
			<option value="033">033</option>
			<option value="041">041</option>
			<option value="042">042</option>
			<option value="043">043</option>
			<option value="044">044</option>
			<option value="051">051</option>
			<option value="052">052</option>
			<option value="053">053</option>
			<option value="054">054</option>
			<option value="055">055</option>
			<option value="061">061</option>
			<option value="062">062</option>
			<option value="063">063</option>
			<option value="064">064</option>
			<option value="0502">0502</option>
			<option value="0503">0503</option>
			<option value="0504">0504</option>
			<option value="0505">0505</option>
			<option value="0506">0506</option>
			<option value="0507">0507</option>
			<option value="070">070</option>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			<option value="0508">0508</option>
	</select>
	-<input id="rphone1_2" name="rphone1_2" maxlength="4" size="4" type="text">
	-<input id="rphone1_3" name="rphone1_3" maxlength="4" size="4" type="text">
	</td>
</tr>

<!-- 휴대전화 -->
<tr class="">
<th scope="row">휴대전화 <span class=""><img src="/p1/resources/images/ico_required.gif" alt="필수"></span>
</th>
	<td><select id="rphone2_1" name="rphone2_1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
		</select>
			-<input id="rphone2_2" name="rphone2_2" maxlength="4" size="4" type="text">
			-<input id="rphone2_3" name="rphone2_3" maxlength="4" size="4"  type="text">
	</td>
</tr>
</tbody>


<!-- 국내 배송관련 정보 -->
<tbody class="delivery ">
<tr class="">
<th scope="row">배송메시지 <span class=""><img src="/p1/resources/images/ico_required.gif" alt="필수"></span>
</th>

	<td>
		<textarea id="omessage" name="omessage" maxlength="255" cols="70"></textarea>							
		<div class="devMessage ">
			<label><input id="omessage_autosave0" name="omessage_autosave[]"fw-label="배송 메세지 저장" fw-msg="" value="T" type="checkbox">
			<label for="omessage_autosave0"></label>Q&amp;A 자동저장</label>
				<ul class="gIndent5">
					<li>배송메시지란에는 배송시 참고할 사항이 있으면 적어주십시오.</li>
					<li>게시글은 비밀글로 저장되며 비밀번호는 주문번호 뒷자리로 자동 저장됩니다.</li>
				</ul>
		</div>
	</td>
</tr>

</tbody>

				
</table> <!-- END border="1" summary="" -->
</div> <!-- eEND class="ec-base-table typeWrite" -->
		</div> <!-- END class="orderArea" -->

<!-- 배송지 끝 -->

<!--    <br>
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
       배송지명: <input type="text" id="addressName" name="addressName"/> <br/>
       성명: <input type="text" id="name" name="name"/> <br/>
       주소: <input type="text" id="adressInput" name="adressInput"/> <br/>
       일반전화: <input type="tel" id="homePhone" name="homePhone"/> <br/>
        휴대전화: <input type="tel" id="phone" name="phone"/>
    <input type="button" value="자식창 열기" onclick="openAddress()"><br>




팝업창  띄우기
<script type="text/javascript">
	var openWin;
$("#address_management").click(function(){
	var popUrl = "./address";	//팝업창에 출력될 페이지 URL

	var popOption ="width=800,height=900,scrollbars=no,location=no,toolbars=no,status=no"  
	//크롬에서는 속성값이 먹지 않음
	openWin=window.open(popUrl ,"address_management",popOption);
		
});


	
</script> -->

<!--주소록팝업창띄우기끝 =============================================================================================== -->




<!-- LOADER -->
<div class="preloader">
    <div class="lds-ellipsis">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- END LOADER -->

<%-- <!-- Home Popup Section -->
<div class="modal fade subscribe_popup" id="onload-popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="ion-ios-close-empty"></i></span>
                </button>
                <div class="row no-gutters">
                    <div class="col-sm-5">
                    	<div class="background_bg h-100" data-img-src="${pageContext.request.contextPath}/resources/images/popup_img.jpg"></div>
                    </div>
                    <div class="col-sm-7">
                        <div class="popup_content">
                            <div class="popup-text">
                                <div class="heading_s4">
                                    <h4>Subscribe and Get 25% Discount!</h4>
                                </div>
                                <p>Subscribe to the newsletter to receive updates about new products.</p>
                            </div>
                            <form method="post">
                            	<div class="form-group">
                                	<input name="email" required type="email" class="form-control rounded-0" placeholder="Enter Your Email">
                                </div>
                                <div class="form-group">
                                	<button class="btn btn-fill-line btn-block text-uppercase rounded-0" title="Subscribe" type="submit">Subscribe</button>
                                </div>
                            </form>
                            <div class="chek-form">
                                <div class="custome-checkbox">
                                    <input class="form-check-input" type="checkbox" name="checkbox" id="exampleCheckbox3" value="">
                                    <label class="form-check-label" for="exampleCheckbox3"><span>Don't show this popup again!</span></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    	</div>
    </div>
</div>
<!-- End Screen Load Popup Section -->  --%>


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
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item">Pages</a></li>
                    <li class="breadcrumb-item active">Shop Load More</li>
                </ol>
            </div>
        </div>
    </div><!-- END CONTAINER-->
</div>
<!-- END SECTION BREADCRUMB -->

<!-- 검색 -->
	<form class="col-xs-6" action="./${p}List">
    <div class="input-group container">
 
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

<!-- END MAIN CONTENT -->


<!-- START MAIN CONTENT -->
<div class="main_content">
</div>
<!-- START SECTION SHOP -->
 
<div class="section">
	<div class="container">
    	<div class="row">
			<div class="col-12">
            	<div class="row align-items-center mb-4 pb-1">
                    <div class="col-12">
                        <div class="product_header">
                            <div class="product_header_left">
                                <div class="custom_select">
                                    <select class="form-control form-control-sm">
                                        <option value="order">Default sorting</option>
                                        <option value="popularity">Sort by popularity</option>
                                        <option value="date">Sort by newness</option>
                                        <option value="price">Sort by price: low to high</option>
                                        <option value="price-desc">Sort by price: high to low</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="product_header_right">
                            	<div class="products_view">
                            	 <a href="./${p}Write"><i class='far fa-edit' style='font-size:44px;color:#FF324D'></i></a>		
<!--admin 계정만 write 버튼이 보일 수 있도록// css 깨짐 ------------------------------------------------------------------------------------------------------------------------ -->
							
<%-- 					 	<c:catch>
								<c:if test="${member.id eq 'admin' }">
								<div>
									<a href="./${p}Write"><i class='far fa-edit' style='font-size:44px;color:#FF324D'></i></a>	
									</div>
								</c:if>
						</c:catch>
						</div> 
							  --%>
					                                   
<!-- ------------------------------------------------------------------------------------------------------------------------------ -->                                  

                                    <a href="javascript:Void(0);" class="shorting_icon grid active"><i class="ti-view-grid"></i></a>
                                    <a href="javascript:Void(0);" class="shorting_icon list"><i class="ti-layout-list-thumb"></i></a>
                                </div>
                                <div class="custom_select">
                                    <select class="form-control form-control-sm">
                                        <option value="">Showing</option>
                                        <option value="9">9</option>
                                        <option value="12">12</option>
                                        <option value="18">18</option>
                                    </select>
                                </div>
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
                                        <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i> Add To Cart</a></li>
                                        <li><a href="//bestwebcreator.com/shopwise/demo/shop-compare.html" class="popup-ajax"><i class="icon-shuffle"></i></a></li>
                                        <li><a href="//bestwebcreator.com/shopwise/demo/shop-quick-view.html" class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
                                        <li><a href="#"><i class="icon-heart"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product_info">
                                <h6 class="product_title"><a href="./${p}Select?productNum=${vo.productNum}">${vo.productName} </a></h6>
                                <div class="product_contents">
                                
                                <span class="contents"><a href="./${p}Select?productNum=${vo.productNum}">${vo.contents}</a></span>                             
                                </div>
                                
                                
                                <div class="product_price">
		                              <a href="./${p}Select?productNum=${vo.productNum}">   
			                              <span class="price">${vo.price}</span>
	                                    	<del>$55.25</del>
                                    </a>
                                    <div class="on_sale">
                                        <span>35% Off</span>
                                    </div>
                                    
                                </div>
                                <div class="rating_wrap">
                                    <div class="rating">
                                        <div class="product_rate" style="width:80%"></div>
                                    </div>
                                    <span class="rating_num">(21)</span>
                                </div>
                                <div class="pr_desc">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim. Nullam id varius nunc id varius nunc.</p>
                                </div>
                           
                                <div class="list_product_action_box">
                                    <ul class="list_none pr_action_btn">
                                        <li class="add-to-cart"><a href="#"><i class="icon-basket-loaded"></i> Add To Cart</a></li>
                                        <li><a href="//bestwebcreator.com/shopwise/demo/shop-compare.html" class="popup-ajax"><i class="icon-shuffle"></i></a></li>
                                        <li><a href="//bestwebcreator.com/shopwise/demo/shop-quick-view.html" class="popup-ajax"><i class="icon-magnifier-add"></i></a></li>
                                        <li><a href="#"><i class="icon-heart"></i></a></li>
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




<!-- END SECTION SHOP -->

<!-- START SECTION SUBSCRIBE NEWSLETTER -->
<div class="section bg_default small_pt small_pb">
	<div class="container">	
    	<div class="row align-items-center">	
            <div class="col-md-6">
                <div class="heading_s1 mb-md-0 heading_light">
                    <h3>Subscribe Our Newsletter</h3>
                </div>
            </div>
            <div class="col-md-6">
                <div class="newsletter_form">
                    <form>
                        <input type="text" required="" class="form-control rounded-0" placeholder="Enter Email Address">
                        <button type="submit" class="btn btn-dark rounded-0" name="submit" value="Submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </div> 
</div>
<!-- START SECTION SUBSCRIBE NEWSLETTER -->








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