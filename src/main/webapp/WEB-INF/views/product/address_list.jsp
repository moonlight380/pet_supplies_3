<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
h2{
	margin-left: 20px;	
}

</style>
<!--////////////////////////스타일 끝///////////////////////// -->



<!-- //////////////////////자바스크립트 시작/////////////////// -->
    <script type="text/javascript">
    
        function openAddress()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            window.open("./address",
                    "childForm", "width=700, height=700, resizable = no, scrollbars = no");    
        }
 
   </script>
   
<script type="text/javascript">
        function setParentText(){
             /* opener.document.getElementById("addr_name").value = document.getElementById("addr_name").value  */
             opener.document.getElementById("rname").value = document.getElementById("rname").value
            /*  opener.document.getElementById("rzipcode1").value = document.getElementById("rzipcode1").value
             opener.document.getElementById("raddr1").value = document.getElementById("raddr1").value
             opener.document.getElementById("raddr2").value = document.getElementById("raddr2").value
             opener.document.getElementById("rphone1_1").value = document.getElementById("rphone1_1").value
             opener.document.getElementById("rphone1_2").value = document.getElementById("rphone1_2").value
             opener.document.getElementById("rphone1_3").value = document.getElementById("rphone1_3").value
             opener.document.getElementById("rphone2_1").value = document.getElementById("rphone2_1").value
             opener.document.getElementById("rphone2_2").value = document.getElementById("rphone2_2").value  
             opener.document.getElementById("rphone2_3").value = document.getElementById("rphone2_3").value  */
        }
</script>

<!-- //////////////////////자바스크립트 시작/////////////////// -->
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
<td scope="col"><span class=""><input id="allCheck" onclick="setParentText()" value="" type="checkbox"></span></td>
                        <td scope="col">주소록 고정</td>
						<td scope="col">배송지명</td>
                        <td scope="col">수령인</td>
                        <td scope="col">일반전화</td>
                        <td scope="col">휴대전화</td>
                        <td scope="col">주소</td>
                        <td scope="col">배송지관리</td>
                    </tr>
                    
<tr><!-- 성명 테스트 -->
<td><input id="rname" name="rname" fw-filter="isFill" fw-label="수취자 성명" fw-msg="" class="inputTypeText" placeholder="" size="15" value="" type="text"></td>
</tr>

</tbody>
			</table>
<div class="scroll">
         <table border="1" summary="">
			<colgroup>
			<col style="width:27px">
			<col style="width:80px">
			<col style="width:100px">
			<col style="width:90px">
			<col style="width:100px">
			<col style="width:100px">
			<col style="width:auto">
			<col style="width:70px">
			</colgroup>
			<tbody class=" center">
			
			</tbody>
			<tbody class="displaynone"><tr>
			<td colspan="8" class="message">등록된 주소가 없습니다.</td>
			                        </tr>
			</tbody>
		</table>
</div>
        </div>
    </div>
<div class="ec-base-button">
<!-- 		<a href="#none" onclick="myshopAddr.deleteAddress(); return false;" class="btn_pop btncolor_basic "><span>선택 주소록 삭제</span></a> -->
		<br>
		<a href="./address" class="btn_pop btncolor_subordinate .attr_set_spacebtn"><span>배송지 등록</span></a>
		<br>
		<br>
		<input type="button" class="button .attr_set_spacebtn" value="전송" onclick="setParentText()">
		
</div>

</form>



<!-- External Script Start -->

<!-- rac -->

<!-- External Script End -->


<iframe src="/exec/front/eclog/main/?&amp;rloc=https%3A//gang2.co.kr/myshop/addr_popup/list.html&amp;rref=https%3A//gang2.co.kr/myshop/addr_popup/register.html&amp;udim=1920*1080&amp;rserv=eclog2-094.cafe24.com&amp;cid=CID05101aaccd477c6be539d17f474036f2&amp;role_path=MYSHOP_ADDR_LIST&amp;stype=e&amp;shop_no=1&amp;lang=ko_KR&amp;ver=2" id="log_realtime" style="display: none;"></iframe><script src="https://eclog2-094.cafe24.com/weblog_ubp.html?uid=gang2yang2&amp;udim=1920*1080&amp;uref=https://gang2.co.kr/myshop/addr_popup/register.html&amp;uname=gang2yang2&amp;url=https://gang2.co.kr/myshop/addr_popup/list.html&amp;r_ref=https://gang2.co.kr/myshop/addr_popup/register.html&amp;shop_no=1&amp;t=1589764749075"></script><script type="text/javascript" src="//eclog2-094.cafe24.com/weblog.js?uid=gang2yang2&amp;uname=gang2yang2&amp;r_ref=https://gang2.co.kr/myshop/addr_popup/register.html&amp;shop_no=1&amp;t=1589764749075" id="log_script"></script></body>
</body>
</html>