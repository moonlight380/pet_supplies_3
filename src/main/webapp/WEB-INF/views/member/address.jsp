<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  <!-- 제이쿼리 --> 

<!DOCTYPE html>
<html>
<!--위치는 WEBAPP 밑에 //보안으로 하려면 web-inf 우선은 테스트-->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<link href="../resources/css/address.css" rel="styleSheet" /> <!--style 불러올때-->

</head>


<!------------------------------ 바디시작 ------------------------------->
<body>
 <!-- 배송지시작 -->
<form action="./address" method="post" id="frm" >
<div class="orderArea">
	 <div class="header">
        <h1>배송 주소록 관리</h1>
	</div>
	<div class="div_line"></div>
	
	<div class="content">
        <div class="ec-base-help">
            <h2> 배송주소록 유의사항</h2>
            <div class="inner">
                <ul>
					<li>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
                    <li>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
                    <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
                </ul>
			</div>
        </div>
	</div>

<input id="id" name="id" value="${member.id}" type="hidden">

	
	
<div class="ec-base-table typeWrite">
	<table border="1" summary="">

<!-- 국내 배송지 정보 -->
<tbody class="">


<!-- 배송지명 -->
<tr>
<th scope="row">배송지명 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td><input id="addr_name" name="addr_name"class="inputTypeText" placeholder="" size="15" value="" type="text"></td>
</tr>

<!-- 성명 -->
<tr>
<th scope="row">성명 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td><input id="rname" name="rname" class="inputTypeText" placeholder="" size="15" value="" type="text"></td>
</tr>

<!-- 주소 -->
<tr>
<th scope="row">주소 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td>
		<input id="raddress" name="raddress" class="inputTypeText" size="6" maxlength="6" type="text" readonly="readonly">							
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
		<input id="raddr1" name="raddr1" class="inputTypeText" size="40" type="text" readonly="readonly"> <span class="grid">기본주소</span><br>
		<input id="raddr2" name="raddr2" class="inputTypeText" size="40"type="text"> <span class="grid">나머지주소</span><span class="grid ">(선택입력가능)</span>
		
	</td>
</tr>


<!-- 일반전화 -->
<tr class="">
<th scope="row">일반전화 <span class="displaynone"></span>
</th>
	<td>
		<select  class="addr_interval"id="rphone1_1" name="rphone1_1">
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
	<td><select  class="addr_interval tel" id="rphone" name="rphone">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
		</select>
			-<input id="rphone1" name="rphone1" class="tel" maxlength="4" size="4" type="text">
			-<input id="rphone2" name="rphone2" class="tel" maxlength="4" size="4" type="text">	
	<span id="mobile"></span>
	<input id="phoneAll" type="text"  hidden="" name="phone"></td>
</tr>
</tbody>
			
</table> <!-- END border="1" summary="" -->
</div> <!-- eEND class="ec-base-table typeWrite" -->
</div> <!-- END class="orderArea" -->


<!-- 배송지 끝 -->
<br>
<br>

<input type="button" class="button tel" id="validationBtn" value="전송">
</form>
<a href="./address_list"><input type="button" class="button"value="취소"></a>  
<input type="button" class="button" value="창닫기" onclick="window.close()"> 


    
<!------------------------------- 스크립트 자식창->부모창으로 전달해줄 내용----------------------------- -->   
<script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("addr_name").value = document.getElementById("addr_name").value
             opener.document.getElementById("rname").value = document.getElementById("rname").value
             opener.document.getElementById("raddress").value = document.getElementById("raddress").value
             opener.document.getElementById("raddr1").value = document.getElementById("raddr1").value
             opener.document.getElementById("raddr2").value = document.getElementById("raddr2").value
             opener.document.getElementById("rphone1_1").value = document.getElementById("rphone1_1").value
             opener.document.getElementById("rphone1_2").value = document.getElementById("rphone1_2").value
             opener.document.getElementById("rphone1_3").value = document.getElementById("rphone1_3").value
             opener.document.getElementById("rphone").value = document.getElementById("rphone").value
             opener.document.getElementById("rphone1").value = document.getElementById("rphone1").value  
             opener.document.getElementById("rphone2").value = document.getElementById("rphone2").value
        }
</script>





<!-- ----------------------------- 우편번호 API----------------------------- -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="../resources/script/address.js" type="text/javascript"></script> <!-- 스크립트 불러올때 -->
</body>
</html>
