/**
 * 
 */

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
			$("#rzipcode1").val(data.zonecode);

			$("#raddr1").val(data.address);
			
			$("#raddr2").focus();

			console.log(data);
        }
    }).open();

    }



/* -----------------------------핸드폰 유효성검사 -----------------------------*/
	
 	var phoneCheck = true;
	
	$(".tel").blur(function() {
	var rphone2_1 = $("#rphone2_1").val(); 
	var rphone2_2 = $("#rphone2_2").val(); 
	var rphone2_3 = $("#rphone2_3").val(); 
	
	var phoneNumber = rphone2_1 + "-" + rphone2_2 + "-" + rphone2_3; 
	
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
 
	
/*-----------------------------빈칸 유효성 검사-----------------------------*/

 $("#validationBtn").click(function(){
 if ($("#addr_name").val() == "") {
 	alert("배송지명을 정확히 입력해주세요");
 	return;
 }else if($("#rname").val() == "") {
	 	alert("성명을 정확히 입력해주세요");
	return;
}else if(($("#rzipcode1").val() == "")||($("#raddr1").val() == "") || ($("#raddr2").val() == "")) {
	 	alert("주소를 정확히 입력해주세요");
	return;
}else{
	frm.submit();
}

 }); 


