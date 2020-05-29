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

<style type="text/css">
#popClose_btn{
margin-left: 650px;
}
.ec-base-layer .content {
    padding: 20px;
    font-size: 12px;
}

body, code {
    font: 0.75em "Malgun Gothic","Gulim","Tahoma","Verdana","Arial","sans-serif",Verdana,Dotum,AppleGothic,sans-serif;
    font-style: normal;
    font-variant-ligatures: normal;
    font-variant-caps: normal;
    font-variant-numeric: normal;
    font-variant-east-asian: normal;
    font-weight: normal;
    font-stretch: normal;
    font-size: 0.75em;
    line-height: normal;
    font-family: "Malgun Gothic", Gulim, Tahoma, Verdana, Arial, sans-serif, Verdana, Dotum, AppleGothic, sans-serif;
    background: #fff;
    -webkit-font-smoothing: antialiased;
}

.button{
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
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
td {
    display: table-cell;
    vertical-align: inherit;
}
table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    
}
div.ec-base-help ul li {
	list-style: none;
    padding: 0 0 0 11px;
    background: url(/p1/resources/images/ico_dash.gif) no-repeat 0 7px;
}
.div_line{
	border: 1px solid #efefef;
}
h2{
	margin-left: 20px;	
}
.ec-base-layer .content {
    padding: 20px;
    font-size: 12px;
}

div.ec-base-help {
    margin: 20px 0 55px;
    border-width: 1px;
    border-style: solid;
    line-height: 18px;
    border-color: #efefef;
}

#popup .ec-base-layer .header {
    padding: 12px 35px 12px 19px;
}

input ,.addr_interval{
	margin-top: 3px;
	margin-bottom: 3px;
	margin-left: 10px;
}
</style>

<!--////////////////////////////// 스타일 끝/////////////////////// -->


</head>


<!--///////////////////////// 바디시작 ///////////////////////////////-->
<body>
 <!-- 배송지시작 -->
<form action="./address_update" method="post" id="frm" >
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
<!-- id -->
<input id="id" name="id" value="${member.id}" type="hidden">

<input name="addressNum" type="hidden" value="${vo.addressNum}">
	
	
<div class="ec-base-table typeWrite">
	<table border="1" summary="">

<!-- 국내 배송지 정보 -->
<tbody class="">


<!-- 배송지명 -->
<tr>
<th scope="row">배송지명 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td><input id="addr_name" name="addr_name"class="inputTypeText" size="15" type="text" value="${vo.addr_name}"></td>
</tr>

<!-- 성명 -->
<tr>
<th scope="row">성명 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td><input id="rname" name="rname" class="inputTypeText"  size="15" type="text" value="${vo.rname}"></td>
</tr>

<!-- 주소 -->
<tr>
<th scope="row">주소 <img src="/p1/resources/images/ico_required.gif" alt="필수"></th>
	<td>
		<input id="raddress" name="raddress" class="inputTypeText" size="6" maxlength="6" type="text" value="${vo.raddress}">							
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
		<input id="raddr1" name="raddr1" class="inputTypeText"  size="40" type="text" value="${vo.raddr1}"> <span class="grid">기본주소</span><br>
		<input id="raddr2" name="raddr2" class="inputTypeText" size="40" type="text" value="${vo.raddr2}"> <span class="grid">나머지주소</span><span class="grid ">(선택입력가능)</span>
		
<!-- 		   <input style="width: 80px;" id="postcode1" name="address" class="input_Join" placeholder="" readonly="readonly" maxlength="14" value="우편번호" type="text">
			   <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
			   <input style="width: 400px;" id="addr1" name="addr1" class="input_Join" placeholder="" readonly="readonly" value="기본주소" type="text" ><br>
			   <input style="width: 250px;" id="addr2" name="addr2" class="input_Join" placeholder="" value="상세주소" type="text">
			   <input style="width: 150px;" id="addr3" name="addr2" class="input_Join" placeholder="" value="참고사항" type="text"> -->
		
		
	</td>
</tr>

<!-- 일반전화 -->
<tr class="">
<th scope="row">일반전화 <span class="displaynone"></span>
</th>
	<td>
		<select class="addr_interval"id="rphone1_1" name="rphone1_1" value="${vo.rphone1_1}">
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
	-<input id="rphone1_2" name="rphone1_2" maxlength="4" size="4" type="text" value="${vo.rphone1_2}">
	-<input id="rphone1_3" name="rphone1_3" maxlength="4" size="4" type="text" value="${vo.rphone1_3}">
	</td>
</tr>

<!-- 휴대전화 -->
<tr class="">
<th scope="row">휴대전화 <span class=""><img src="/p1/resources/images/ico_required.gif" alt="필수"></span>
</th>
	<td><select  class="addr_interval tel" id="rphone" name="rphone" value="${vo.rphone}">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
		</select>
			-<input id="rphone1" name="rphone1" maxlength="4" size="4" type="text" value="${vo.rphone1}">
			-<input id="rphone2" name="rphone2" maxlength="4" size="4" type="text" value="${vo.rphone2}">	
	<span id="mobile"></span>
	<input id="phoneAll" type="hidden" name="phone"></td>
</tr>
</tbody>
			
</table> <!-- END border="1" summary="" -->
</div> <!-- eEND class="ec-base-table typeWrite" -->
</div> <!-- END class="orderArea" -->


<!-- 배송지 끝 -->
<br>
<br>

<input type="button" class="button tel validationBtn" value="전송">
</form>

<a href="./address_list"><input type="button" class="button"value="취소"></a>  
<input type="button" class="button" value="창닫기" onclick="window.close()"> 



<!--  우편번호 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            
            
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                $("#addr2").val(extraAddr);
            
            } else {
            	 $("#addr2").val(''); 
          /*       document.getElementById("sample6_extraAddress").value = ''; */
             } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
 			$("#raddress").val(data.zonecode);

			$("#raddr1").val(data.address);
			
			$("#raddr2").focus();

			console.log(data);
        }
    }).open();

    } 

/* 핸드폰 유효성검사 */
	
 	var phoneCheck = true;
	
	$(".tel").blur(function() {
	var rphone = $("#rphone").val(); 
	var rphone1 = $("#rphone1").val(); 
	var rphone2 = $("#rphone2").val(); 
	
	var phoneNumber = rphone + "-" + rphone1 + "-" + rphone2; 
	
	var regExp = /(01[0|1|6|9|7|8])[-](\d{3}|\d{4})[-](\d{4}$)/g; 
	var result = regExp.exec(phoneNumber); 
	
	if(!result){
		$("#mobile").html("입력값이 올바르지 않습니다.");
		$("#mobile").css({'color':'red','font-weight':'bold', 'font-size':'small'});
		phoneCheck = false;
	}else{
		$("#mobile").html(" ");
		var phoneAll = $("#mobile1").val()+$("#mobile2").val()+$("#mobile3").val();
		$("#phoneAll").val(phoneAll);
		phoneCheck = true;
	}
});
 
	
/*빈칸 유효성 검사*/

 $(".validationBtn").click(function(){
 if ($("#addr_name").val() == "") {
 	alert("배송지명을 정확히 입력해주세요");
 	return;
 }else if($("#rname").val() == "") {
	 	alert("성명을 정확히 입력해주세요");
	return;
}else if(($("#raddress").val() == "")||($("#raddr1").val() == "") || ($("#raddr2").val() == "")) {
	 	alert("주소를 정확히 입력해주세요");
	return;
}else{
	frm.submit();
}

 }); 

 </script>


</body>
</html>
