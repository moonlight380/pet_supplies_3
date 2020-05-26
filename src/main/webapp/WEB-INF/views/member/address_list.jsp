<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import> <!-- jsp -->

<link href="../resources/css/address.css" rel="styleSheet" /> <!--style 불러올때-->

</head>

<!-- 바디시작 -->
<body id="reset">
<body id="popup">
<form id="frmAddr" action="./address_list" method="post" target="_self" enctype="multipart/form-data">
  
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
            <table border="1" style="text-align: center;">
					<caption></caption>
					                <colgroup>
					<col style="width:27px">
					<col style="width:100px">
					<col style="width:90px">
					<col style="width:100px">
					<col style="width:100px">
					<col style="width:300px">
					<col style="width:87px">
					</colgroup>
<tbody class="head">
					<tr>
<td scope="col">
<span class=""><input id="allCheck" type="checkbox" ></span> 
</td>
    
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
						<span class=""><input class="rowCheck check" id="rowCheck del" type="checkbox" name="${vo.addressNum}"></span> 
						</td>
     
                        
						<td scope="col">${vo.addr_name}</td>
						
                        <td scope="col" id="rname${i.index}">${vo.rname}</td>
                        <!--일반전화 -->
                        <td scope="col" ><span id="rphone1_1${i.index}">${vo.rphone1_1}</span>                        
                        -<span id="rphone1_2${i.index}">${vo.rphone1_2}</span>                        
                        -<span id="rphone1_3${i.index}">${vo.rphone1_3}</span>
                        
                        </td>
                        <!--휴대폰 -->
                        <td scope="col"><span id="rphone${i.index}">${vo.rphone}</span>
                        -<span id="rphone1${i.index}">${vo.rphone1}</span>                       
                        -<span id="rphone2${i.index}">${vo.rphone2}</span>
                        </td>
                        
                        <td scope="col">
                        (<span id="raddress${i.index}">${vo.raddress}</span>)
                        <span id="raddr1${i.index}">${vo.raddr1}</span>
                        
                        <span id="raddr2${i.index}">${vo.raddr2}</span></td>
                        
                        <td scope="col"><a href="./address_update?addressNum=${vo.addressNum}"><input type="button" class="button addr_button updateBtn" title="${vo.addressNum}" value="수정"></a>                       
                        <input type="button" class="button .attr_set_spacebtn" value="전송" onclick="setParentText(${i.index})"></td>
                    </tr>
                    
               </c:forEach>

</tbody>
			</table>

        </div>
    </div>


<!-- 하단 버튼 -->
<div class="ec-base-button">
		<a href="#" class="deleteBtn"class="btn_pop btncolor_basic "><span>선택 주소록 삭제</span></a> 
		<a href="./address" class="btn_pop btncolor_subordinate .attr_set_spacebtn"><span>배송지 등록</span></a>
		<!-- <input type="button" class="button addr_button" value="삭제"> -->
		<br>
		<br>
		
</div> 

<script src="../resources/script/address_list.js" type="text/javascript"></script> <!-- 스크립트 불러올때 -->

</form>

</body>
</body>
</html>