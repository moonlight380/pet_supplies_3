

document.getElementById('button').style.backgroundColor = '#FF324D';
document.getElementById('button').style.color = 'white';

$("#delete").click(function() {
	location.href="./memberDelete";
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
