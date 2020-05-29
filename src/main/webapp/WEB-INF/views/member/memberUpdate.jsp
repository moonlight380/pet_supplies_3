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
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container-fulid  mt-5">
		<div class="row">
		
		<c:import url="./memberSide.jsp"></c:import>
	
<div class="col" style="margin-top: 150px; margin-left: 250px;">
<form action="./memberUpdate" method="post" id="frm" style="font-style: inherit; font-size: small;">

				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col">
						<div class="row mb-4"
							style="border-bottom: solid 1px black; font-weight: bold; color: black;">
							<div style="margin-left: 21px; font-size: medium;">회원 정보 수정</div>
						</div>

<h4 style="float: right; margin-top: 20px; font-size: 14px;"><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수">필수입력사항</h4>

<table class="table table-bordered" style="margin-bottom: -1px;">

<colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>

<colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>
<tbody>
<tr>
<th scope="row">아이디 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id="id" name="id" readonly="readonly" value="${member.id}" type="text"><span id="idt" style="font-size: small;"> (영문소문자/숫자, 4~12자)</span></td>
 </tr>
 
<tr id="kakao" style="display: none;">
<c:if test="${kmember.kakaoId ne null}">
<th scope="row">비밀번호 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
 <td><input id="kakaopw" name="pw" class="input_Join" autocomplete="off" maxlength="16" type="password" readonly="readonly"><span id="pwt" style="font-size: small;"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span></td>
 </c:if>
</tr>

<tr id="mem">
<th scope="row">비밀번호 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
 <td><input id="pw" name="pw" class="input_Join" autocomplete="off" maxlength="16" type="password"><span id="pwt" style="font-size: small;"> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span></td>
</tr>

<tr id="kaka" style="display: none;">
<c:if test="${kmember.kakaoId ne null}">
<th scope="row">비밀번호 확인 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id ="kakaocheck_pw" name="check_pw" class="input_Join" autocomplete="off" maxlength="16" type="password" readonly="readonly"><span id="pwc"></span></td>
</c:if>
</tr>

<tr id="member">
<th scope="row">비밀번호 확인 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id="check_pw" name="check_pw" class="input_Join" autocomplete="off" maxlength="16" type="password"><span id="pwc"></span></td>
</tr>

<tr>
<th scope="row" id="nameTitle">이름 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
  <td>
    <input style="width: 100px;" type="text" name="name" id="name" value="${member.name}" class="input_Join" maxlength="20"><span id="nameContents"></span>
  </td>
</tr>

<tr>
<th scope="row">이메일 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
 <td><input style="width: 250px;" id="email" name="email" class="input_Join" value="${member.email}" type="email"><span id="emailCheck"></span>
 </td>
</tr>

<tr class="">
<th scope="row">주소 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" class="" alt="필수"></th>
 <td>
   <input style="width: 80px;" id="postcode1" name="address" value="${member.address}" class="input_Join" placeholder="우편번호" readonly="readonly" maxlength="14" type="text">
   <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
   <input style="width: 400px;" id="addr1" name="addr1" value="${member.addr1}" class="input_Join" placeholder="기본주소" readonly="readonly"type="text" ><br>
   <input style="width: 250px;" id="addr2" name="addr2" value="${member.addr2}" class="input_Join" placeholder="상세주소" type="text">
 </td>
</tr>
<tr class="">
<th scope="row">휴대전화 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" class="" alt="필수"></th>
 <td><select id="mobile1" id="phone" class="input_Join tel" name="phone">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input style="width: 50px;" name="phone1" id="mobile2"class="input_Join tel" maxlength="4" value="${member.phone1}" type="text">-<input style="width: 50px;"name="phone2" id="mobile3" class="input_Join tel"  maxlength="4" value="${member.phone2}" type="text">
<span id="mobile"></span>
</td>
</tr>


<tr class="">
<th scope="row">생년월일</th>
<td>
<input id="birth" name="birth_year" placeholder="ex)19991104" maxlength="8" value="" type="text"> 
<input hidden="hidden" name=age id=age>
<input id="calendar0" name="calendar" value="T" type="radio" checked="checked"><label for="is_solar_calendar0">양력</label>
<input id="calendar1" name="calendar" value="F" type="radio"><label for="is_solar_calendar1">음력</label>
<span id="msg"></span>
</td>
</tr>


<tr class="sex">
<th scope="row">성별</th>
<td><input id="sex0" name="sex" value="M" type="radio"><label for="is_sex0">남자</label>
<input id="sex1" name="sex" value="F" type="radio" checked="checked"><label for="is_sex1">여자</label></td>
</tr>

</tbody>
</table>
</div>

</div>

</form>

<div class="row center"  style="margin-left:110px; ; margin-top: 50px; float: left;">
	<button type="button" id="button" class="btn btn-default">수정</button>
	<button type="button" id="cancel" class="btn btn-primary" onclick="goback()">취소</button>
</div>
<div style="float: right; margin-top: 10px;">
<<<<<<< HEAD
	<button type="button" onclick="mdelete()" class="btn btn-danger btn-sm">회원탈퇴</button>
=======
	<button type="button" onclick="removeCheck()" class="btn btn-danger btn-sm">회원탈퇴</button>
>>>>>>> parent of dff6e9f... Merge branch 'master' of https://github.com/moonlight380/pet_supplies_3
</div>

	
</div>

<div class="col-sm-2 "></div>

</div>
</div>


</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">



document.getElementById('button').style.backgroundColor = '#FF324D';
document.getElementById('button').style.color = 'white';


function removeCheck() {

	 if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인

		 location.href="./memberDelete";

	 }else{   //취소

	     return false;

	 }

 });




function goback() {
	history.back();
};

//-- kakao 로그인과 아닐때 구분
$("#id").ready(function() {
var memberId = $("#id").val();
var kakaoId = "${kmember.kakaoId}";

if(memberId == kakaoId){
	$("#kakao").show();
	$("#kaka").show();
	$("#mem").hide();
	$("#member").hide();
	
}
});

$("#kakaopw").click(function() {
	alert("카카오 로그인은 비밀번호 변경이 불가능합니다");
});


/* PW 유효성검사 */
/* PW는 숫자+영문자+특수문자 조합으로 8자리 이상 */

	var pwCheck = true;
	$("#pw").change(function() {
		var pw = $("#pw").val();
		
		 if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/.test(pw)){            
			$("#pwt").html('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다');
			$("#pwt").css({'color':'red','font-weight':'bold', 'font-size':'small'});
	        pw.focus();
	        pwCheck = false;
	    }else{
	    	 $.ajax({
					type: "post",	//method 형식 
					url : "./selectPW", //URL 주소
					data: {
						pw:pw
					},	//parameter
					success : function(data){
						if(data == 0){
							alert("같은 비밀번호를 사용하실 수 없습니다");
							$("#pw").val('');
						}else{
							$("#pwt").html(" 사용가능한 비밀번호입니다");
							$("#pwt").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
							pwCheck = true;
						}
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
					
				});   
	    	
		}
	
});

/* PW 확인 */
	var pw2Check = true;
	$("#check_pw").blur(function() {
		
		var pw = $("#pw").val();
		var check_pw = $("#check_pw").val();
		
		if(pw != check_pw){
			$("#pwc").html(" 비밀번호가 일치하지 않습니다");
			$("#pwc").css({'color':'red','font-weight':'bold', 'font-size':'small'});
			pw2Check = false;
		}else{
			$("#pwc").html(" 비밀번호가 일치합니다");
			$("#pwc").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
			pw2Check = true;
		}
		
});
	

//-- 성별 체크
$(".sex").ready(function() {
	var sex = "${member.sex}";
	console.log("${member.sex}");
	var f = "F";
	var m = "M";
	if(sex == f){
		 $("#sex1").attr('checked', true); 
	}else if(sex == m){
		 $("#sex0").attr('checked', true); 
	}
});


var birthCheck = true;
	$("#birth").blur(function() {
 var birth = $(this).val(); 
 	
	var year = Number(birth.substr(0,4)); 
	var month = Number(birth.substr(4,2));
 	var day = Number(birth.substr(6,2));
 	var today = new Date();
 	var yearNow = today.getFullYear();
 	var adultYear = yearNow-20;
 
 if (year < 1900 || year > adultYear){
      alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
      birthCheck = false;
      
 }else if (month < 1 || month > 12) { 
      alert("달은 1월부터 12월까지 입력 가능합니다.");
      birthCheck = false;
      
 }else if (day < 1 || day > 31) {
      alert("일은 1일부터 31일까지 입력가능합니다.");
      birthCheck = false;
 }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
      alert(month+"월은 31일이 존재하지 않습니다.");
      birthCheck = false;
 }else if (month == 2) {
      var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
      if (day>29 || (day==29 && !isleap)) {
           alert(year + "년 2월은  " + day + "일이 없습니다.");
           birthCheck = false;
      }else{
    	 var age = today.getFullYear() - year+1;
     	 $("#age").val(age);
     	 birthCheck = true;
      }
 }else{
	 var age = today.getFullYear() - year+1;
	 $("#age").val(age);
	 birthCheck = true;
 }
	
});


$("#button").click(function() {
	var pw = $("#pw").val();
	var name = $("#name").val();
	var phone = $("#phone").val();
	var address = $("#address").val();
	var email = $("#email").val();
	var ch = new Array(pw,name,phone,address,email,age);
	var check=0;
	
	for(var i=0;i<ch.length;i++){
		if(ch[i]==""){
			check++;
			
		}
	}

	
	if(check>0){
		alert("정보를 모두 입력해주세요");
	}else{
		if(confirm("회원정보를 수정하시겠습니까 ?") == true){
			$("#frm").submit();
	    }
	    else{
	        return ;
	    }

	}
	
	
});



//-- 배송지 수정 우편번호 api
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
      
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			$("#postcode1").val(data.zonecode);

			$("#addr1").val(data.address);
			
			$("#addr2").focus();

			
        }
    }).open();

}





</script>






</html>