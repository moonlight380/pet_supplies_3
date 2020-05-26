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
			<div class="col-sm-2 ">
				<b style="margin-left: 40px; font-weight: bold; color: #FF324D; font-size: 16.5px;">회원 정보 수정</b>
				<hr size="5" color="#FF324D">

			</div>
				<div class="col ">
				<form action="./memberUpdate" method="post" class="form-horizontal" id="frm">
					<div class="row mt-5 text-center form-group form-group-sm">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>아이디</th>
									<th>
										<input class="form-control col-sm-8 text-center"
											type="text" style="margin-left: 90px;"
											name="id" value="${member.id }" readonly="readonly">	 
											
									</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>이름</td>
									<td>
										<input class="form-control col-sm-8 text-center"
											type="text" style="margin-left: 90px;"
											id="name" name="name" value="${member.name }" >
									</td>

								</tr>
								<tr>
									<td>나이</td>
									<td>
										<input class="form-control col-sm-8 text-center"
											type="text" style="margin-left: 90px;"
											id="age" name="age" value="${member.age }" >
									</td>

								</tr>
								<tr>
									<td>전화번호</td>
									<td>
										<input class="form-control col-sm-2 text-center"
											type="text" style="margin-left: 90px; float: left;"
											id="phone" name="phone" value="${member.phone }" >
										<input class="form-control col-sm-3 text-center"
											type="text" style="float: left;"
											id="phone1" name="phone1" value="${member.phone1 }" >
										<input class="form-control col-sm-3 text-center"
											type="text"
											id="phone2" name="phone2" value="${member.phone2 }" >
							
									</td>
											
								</tr>
								<tr>
									<td>E-Mail</td>
									<td>
										<input class="form-control col-sm-8 text-center"
											type="text" style="margin-left: 90px;"
											id="email" name="email" value="${member.email }" >
									</td>

								</tr>
								<tr>
									<td>주소</td>
									<td>   
										<input id="postcode1" name="address"  class="form-control col-sm-3 text-center" style="margin-left: 90px; float: left;" size="6" maxlength="6" readonly="1" value="${member.address}" type="text">
										<input class="form-control col-sm-2 text-center" type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
										<input id="addr1" name="addr1" class="form-control col-sm-8 text-center" style="margin-left: 90px;"  size="40" readonly="1" value="${member.addr1}" type="text"><br>
										<input id="addr2" name="addr2"  class="form-control col-sm-8 text-center" style="margin-left: 90px;" size="40" value="${member.addr2}" type="text">
									</td>

								</tr>
		
							</tbody>
						</table>


					</div>
					<div class="row center">
						<button type="button" id="button" class="btn btn-default">수정</button>
					</div>
				</form>

				
				</div>
			<div class="col-sm-2 "></div>
		
		
		</div>
	</div>


</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
document.getElementById('button').style.backgroundColor = '#FF324D';
document.getElementById('button').style.color = 'white';

$("#button").click(function() {
	var name = $("#name").val();
	var age = $("#age").val();
	var phone = $("#phone").val();
	var address = $("#address").val();
	var email = $("#email").val();
	var ch = new Array(name,age,phone,address,email);
	var check=0;
	for(var i=0;i<ch.length;i++){
		if(ch[i]==""){
			check++;
			
		}
	}
	if(check>0){
		alert("모두 입력해주세요");
	} else{
		$("#frm").submit();
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
          /*       document.getElementById("sample6_extraAddress").value = ''; */
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			$("#postcode1").val(data.zonecode);

			$("#addr1").val(data.address);
			
			$("#addr2").focus();

			console.log(data);
        }
    }).open();

    }





</script>







</html>