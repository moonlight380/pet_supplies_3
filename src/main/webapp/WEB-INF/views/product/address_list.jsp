<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>

<style type="text/css">
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
.attr_set_spacebtn{
	margin-left: 45%;

}
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
.gray{
	color: gray;
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
.ec-base-table.typeList .scroll {
    position: relative;
    overflow-x: hidden;
    overflow-y: scroll;
    max-height: 185px;
    min-height: 100px;
    border: 1px solid #dedede;
    border-top-width: 0;
    margin-top: -1px;
}
.line_base, div.ec-base-help {
    border-color: #e1e1e1;
}

.ec-base-table.typeList table {
    border-top: 1px solid #333333;
}
.ec-base-layer .ec-base-table table {
    line-height: 1.4;
}
.ec-base-table table {
    position: relative;
    margin: 10px 0 0;
    border-bottom: 1px solid #dedede;
    border-top: 1px solid #dedede;
    border-top: 0;
    line-height: 1.5;
}

table {
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
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
.displaynone {
    display: none !important;
}
div {
    display: block;
}

.ec-base-layer .ec-base-button {
    border-top: 1px solid #e1e1e1;
}
.ec-base-layer .ec-base-button {
    padding: 9px;
    text-align: center;
}

div.ec-base-help {
    margin: 20px 0 55px;
    border-width: 1px;
    border-style: solid;
    line-height: 18px;
}
.line_base, div.ec-base-help {
    border-color: #e1e1e1;
}

.ec-base-layer .content {
    padding: 20px;
    font-size: 12px;
}
div.ec-base-help .inner {
    padding: 0 9px 12px;
}

#popup .ec-base-layer .header {
    padding: 12px 35px 12px 19px;
}
.btncolor_subordinate {
    color: #FFFFFF;
    background: #ed1b34;
    border: 1px solid #ed1b34;
}
.btn_pop {
    min-width: 50px;
    height: 32px;
    line-height: 30px;
    font-size: 13px;
    text-align: center;
    display: inline-block;
    padding: 0 20px;
    vertical-align: middle;
    font-weight: bold;
    border-width: 1px;
    border-style: solid;
}
.btncolor_subordinate:hover {
    border-color: #c8162c;
    background: #c8162c;
    color: #FFFFFF;
}
.line_low, div.ec-base-help > h2, div.ec-base-help > h3, .xans-order-result .ec-base-table td .map img {
    border-color: #efefef;
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
h2, h1{
	margin-left: 20px;	
	font-size: 20px;
}

</style>
<!--////////////////////////스타일 끝///////////////////////// -->



</head>

<!-- 바디시작 -->
<body>
<body id="popup">
<form id="frmAddr" name="" action="./address_list" method="post" target="_self" enctype="multipart/form-data">
  
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

        <div class="ec-base-table typeList">
            <table border="1" summary="">
					<caption></caption>
					                <colgroup>
					<col style="width:27px">
					<col style="width:80px">
					<col style="width:100px">
					<col style="width:90px">
					<col style="width:100px">
					<col style="width:100px">
					<col style="width:auto">
					<col style="width:87px">
					</colgroup>
<tbody class="head">
					<tr>
<td scope="col">
<!-- <span class=""><input id="allCheck" value="" type="checkbox"></span> -->
</td>
                        <td scope="col">주소록 고정</td>
						<td scope="col">배송지명</td>
                        <td scope="col">수령인</td>
                        <td scope="col">일반전화</td>
                        <td scope="col">휴대전화</td>
                        <td scope="col">주소</td>
                        <td scope="col">배송지관리</td>
                    </tr>
                    
              <c:forEach items="${list}" var="vo" varStatus="i">   
					<tr>
						<td scope="col">
						</td>
                        <td scope="col"><input type="button" class="button addr_button gray" value="고정"></td>
                        
						<td scope="col">${vo.addr_name}</td>
						
                        <td scope="col" id="rname${i.index}">${vo.rname}</td>
                        
                        <td scope="col" ><span id="rphone1_1${i.index}">${vo.rphone1_1}</span>                        
                        -<span id="rphone1_2${i.index}">${vo.rphone1_2}</span>                        
                        -<span id="rphone1_3${i.index}">${vo.rphone1_3}</span>
                        
                        </td>
                        <td scope="col" id="rphone2_1${i.index}"><span>${vo.rphone2_1}</span>
                        
                        -<span id="rphone2_2${i.index}">${vo.rphone2_2}</span>
                        
                        -<span id="rphone2_3${i.index}">${vo.rphone2_3}</span></td>
                        
                        <td scope="col">
                        (<span id="rzipcode1${i.index}">${vo.rzipcode1}</span>)
                        <span id="raddr1${i.index}">${vo.raddr1}</span>
                        
                        <span id="raddr2${i.index}">${vo.raddr2}</span></td>
                        
                        <td scope="col"><a href="./address_update?addressNum=${vo.addressNum}"><input type="button" class="button addr_button updateBtn" title="${vo.addressNum}" value="수정"></a>
                        <input type="button" class="button addr_button" value="삭제">
                        <input type="button" class="button .attr_set_spacebtn" value="전송" onclick="setParentText(${i.index})"></td>
                    </tr>
                    
               </c:forEach>

</tbody>
			</table>

        </div>
    </div>
<!-- //////////////////////자식->부모로 값전달하기 자바스크립트 시작/////////////////// -->
     
<script type="text/javascript">
        function setParentText(num){
             opener.document.getElementById("rname").value = document.getElementById("rname"+num).innerText //$("").text()        
             opener.document.getElementById("rzipcode1").value = document.getElementById("rzipcode1"+num).innerText
             alert(document.getElementById("raddr1"+num).innerText);
              opener.document.getElementById("raddr1").value = document.getElementById("raddr1"+num).innerText
             opener.document.getElementById("raddr2").value = document.getElementById("raddr2"+num).innerText
             
             opener.document.getElementById("rphone1_1").innerText = document.getElementById("rphone1_1"+num).innerText
             opener.document.getElementById("rphone1_2").value = document.getElementById("rphone1_2"+num).innerText
             opener.document.getElementById("rphone1_3").value = document.getElementById("rphone1_3"+num).innerText
             
             opener.document.getElementById("rphone2_1").innerText = document.getElementById("rphone2_1"+num).innerText
             opener.document.getElementById("rphone2_2").value = document.getElementById("rphone2_2"+num).innerText 
             opener.document.getElementById("rphone2_3").value = document.getElementById("rphone2_3"+num).innerText
        
             close();
        }
        
</script>

<!-- //////////////////////자식->부모로 값전달하기 자바스크립트 끝/////////////////// -->
<div class="ec-base-button">
<!-- 		<a href="#none" onclick="myshopAddr.deleteAddress(); return false;" class="btn_pop btncolor_basic "><span>선택 주소록 삭제</span></a> -->
		<br>
		<a href="./address" class="btn_pop btncolor_subordinate .attr_set_spacebtn"><span>배송지 등록</span></a>
		<br>
		<br>
		
		
</div>

</form>



<!-- External Script Start -->

<!-- rac -->

<!-- External Script End -->

<!-- <script type="text/javascript">
$(".updateBtn").click(function(){
	var input= $(this).attr("title");
	location.href="./address_update?addressNum="+input;
});


</script> -->
</body>
</html>