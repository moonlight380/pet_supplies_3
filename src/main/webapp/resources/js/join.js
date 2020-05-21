

	var frm = $("#Joinfrm");

	/* ID 유효성검사 */
	/* id는 대소문자와 숫자로 형성된 4~12자 공백X */
	/* 중복검사 */
	var idCheck = true;
	$("#id").blur(function() {
		var id = $("#id").val();
		
		
		for (var i = 0; i < id.length; i++) {
            ch = id.charAt(i)
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            	$("#idt").html(" 아이디는 영문 대소문자와 숫자로만 입력해주세요");
            	$("#idt").css({'color':'red','font-weight':'bold', 'font-size':'small'});
            	idCheck = false;
            }else if(id.length<4 || id.length>12){
            	$("#idt").html(" 아이디는 4~12자 사이로 입력해주세요");
            	idCheck = false;
            }else if(id.indexOf(" ")>=0){
            	$("#idt").html(" 아이디에는 공백을 사용할 수 없습니다");
            	idCheck = false;
            }else{
            	$.ajax({
    				type: "post",	//method 형식 
    				url : "./memberIdCheck",//URL 주소
    				data: {
    					id:id
    				},	//parameter
    				success : function(data){
    					if(data == 1){
	    					$("#idt").html(" 사용가능한 아이디입니다");
	    					$("#idt").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    					idCheck = true;
    					}else{
    						$("#idt").html(" 중복된 아이디입니다");
    						$("#idt").css({'color':'red','font-weight':'bold', 'font-size':'small'});
        					idCheck = false;
    					}
    				},
    				error	: function() {
    				
    				}
    				
    			});
            }
        }
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
 			$("#pwt").html(" 사용가능한 비밀번호입니다");
 			$("#pwt").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
 			pwCheck = true;
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
 	
 	/* 비밀번호 확인답변 유효성 검사 */
 	
 	var pwanswerCheck = true;
 	$("#hint_answer").blur(function() {
 		
		var answer = $(this).val();
		
		if(answer.length <= 0){
			$("#answer").html(" 답변을 입력해 주세요");
			$("#answer").css({'color':'red','font-weight':'bold', 'font-size':'small'});
			pwanswerCheck = false;
		} 
	});
 	
 	/* 이름 유효성 검사 */
 	/* 숫자, 영문, 자음, 공백, 2글자미만 사용금지  */
 	var nameCheck = true;
 	$("#name").blur(function() {
	
	 	var name = $(this).val(); 


 		for (var i=0; i<name.length; i++)  { 
		    var chk = name.substring(i,i+1); 
		    if(chk.match(/[0-9]|[a-z]|[A-Z]/)) { 
		    	$("#nameContents").html(" 이름을 정확히 입력해주세요");
		    	$("#nameContents").css({'color':'red','font-weight':'bold', 'font-size':'small'});
		    	nameCheck = false;
		       
		    }else if(chk.match(/([^가-힣\x20])/i)){
		    	$("#nameContents").html(" 이름을 정확히 입력해주세요");	
		    	$("#nameContents").css({'color':'red','font-weight':'bold', 'font-size':'small'});
		    	nameCheck = false;
		       
		    }else if($("#name").val() == " "){
		    	$("#nameContents").html(" 이름을 정확히 입력해주세요");
		    	$("#nameContents").css({'color':'red','font-weight':'bold', 'font-size':'small'});
		    	nameCheck = false;
		       
		    }else if(name.length <= 1){
		    	$("#nameContents").html(" 이름을 정확히 입력해주세요");
		    	$("#nameContents").css({'color':'red','font-weight':'bold', 'font-size':'small'});
		    	nameCheck = false;
		
		    }else{
		    	$("#nameContents").html(" ");
		    	$("#nameContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
		    	nameCheck = true;
		    }
		} 
	
	});
 	
 	/* 이메일 유효성 검사 */
 	var emailCheck = true;
   	$("#email").blur(function() { 
 		
 		var email = $(this).val(); 
 		
  		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

  		if(reg_email.test(email)==false){
  			$("#emailCheck").html(" 이메일 형식이 올바르지 않습니다");
  			$("#emailCheck").css({'color':'red','font-weight':'bold', 'font-size':'small'});
  			emailCheck = false;
  		}else{
  			$.ajax({
				type: "post",	//method 형식 
				url : "./memberEmailCheck",//URL 주소
				data: {
					email:email
				},	//parameter
				success : function(mail){
					if(mail == 1){
						$("#emailCheck").html(" 사용가능한 이메일 입니다");
						$("#emailCheck").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
						emailCheck = true;
					}else{
						$("#emailCheck").html(" 중복된 이메일 입니다");
						$("#emailCheck").css({'color':'red','font-weight':'bold', 'font-size':'small'});
						emailCheck = false;
					}
				},
				error	: function() {
				
				}
				
			});
  		}
	});  
   	
   	/* 주소 유효성 검사 */
   	
    var AddrCheck = true;
   	$("#postcode1").blur(function() {
		var postcode = $(this).val();
		if(postcode == null){
			AddrCheck = false;
		}
	});
   	
   	$("#addr2").blur(function() {
		if($(this).val() == null){
			AddrCheck = true;
		}
	});

   	
   	/* 핸드폰 유효성검사 */
   	
   	var phoneCheck = true;
   	
   	$(".tel").blur(function() {
   	var phoneNum1 = $("#mobile1").val(); 
   	var phoneNum2 = $("#mobile2").val(); 
   	var phoneNum3 = $("#mobile3").val(); 
   	
   	var phoneNumber = phoneNum1 + "-" + phoneNum2 + "-" + phoneNum3; 
   	
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

 	 
 	/* 생년월일 유효성검사 */
 	var birthCheck = true;
 	$("#birth").blur(function() {
 		
	  var birth = $(this).val(); 
	 	
 	 var year = Number(birth.substr(0,4)); 
  	 var month = Number(birth.substr(4,2));
     var day = Number(birth.substr(6,2));
     var today = new Date();
     var yearNow = today.getFullYear();
     var adultYear = yearNow-20; 
      
 
     if (year <1900 || year > adultYear){
          alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
          birthCheck = false;
          
     }else if (month <1 || month > 12) { 
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
          }
     }else{
    	 birthCheck = true;
     }
		
	});
	

 	
 	
 	
 	
	/* --------------------------AgreeBtn------------------------------- */
 	
	/* Join */
	
	$("#btnJoin").click(function(e) {
		var c = true;
		var check = $(".input_Join");
		var agree = $(".Ess").prop("checked");
		
		for(i=0;i<check.length;i++){
			if(check[i].value.length==0){
				c=false;
				break;
			}
		}
			if(!(idCheck && pwCheck && pw2Check && pwanswerCheck && nameCheck && emailCheck && AddrCheck && birthCheck  && c)){
				alert("정보를 제대로 입력해주세요");
			}else if(!agree){
				alert("필수 약관에 동의해주세요");
				e.preventDefault();
			}
			else{
				frm.submit();
			}
	
	});
	
	function goback() {
		history.back();
	};


	//-----------------------------Agree All check--------------------------------------------------
		 $("#result").on("click","#checkAll",function(){
			$(".check01").prop("checked",$(this).prop("checked"));
			if($("#checkAll").prop("checked")){

				$(".checkbox").css({'color':'#ff9999'});
				$(".checkcon").css({'color':'black','font-weight':'bold'});
			} else {
				$(".nocheck").css({'color':'gray','font-weight':'normal'});
			}


		});
		 
		//-----------------------------Select Check------------------------------------------------
		
		$("#result").on("click",".check01",function(){
			var result=true;
			
			var title = $(this).attr("id");
			if($(this).prop("checked")){
				console.log(title);
				$("[title="+title+"_img"+"]").css({'color':'#ff9999'});
				$("[title="+title+"_con"+"]").css({'color':'black','font-weight':'bold'});
			} else{
				console.log(title);
				$("[title="+title+"_img"+"]").css({'color':'gray','font-weight':'normal'});
				$("[title="+title+"_con"+"]").css({'color':'gray','font-weight':'normal'});
			}
			

			
			$(".check01").each(function(){
				
				if(!$(this).prop("checked")){
					result=false;
				} 
			});
			
			
			$("#checkAll").prop("checked",result);
			
			if($("#checkAll").prop("checked")){
				$("#img").css({'color':'#ff9999'});
				$("#contents1").css({'color':'black','font-weight':'bold'}); 
			} else{
				
				$("#img").css({'color':'gray'});
				$("#contents1").css({'color':'gray','font-weight':'normal'});
			}
			
		
		});
		//--------------------------------Cursor----------------------------------------------
		
		$(".ac").mouseover(function() {
			$(".ac").css({'cursor':'pointer'});
		});
		
		 
			
	
	