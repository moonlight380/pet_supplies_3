

//-- radio 선택에 따른 div태그 보이기 숨기기
	function setDisplay(){
	    if($('input:radio[id=check_email]').is(':checked')){
	        $('#find_phone').hide();
	        $('#find_email').show();
	    }else if($('input:radio[id=check_phone]').is(':checked')){
	        $('#find_email').hide();
	        $('#find_phone').show();
	    }
	}

	
		//-- 이름 유효성 검사
		var nameCheck = true;
 	  $("#check_name").blur(function() {
 	
	
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
 	
 	  
 	  
 	 //-- Email 찾기 
 	 
 	 $("#email_btn").click(function(e) {
		var c = true;
		var check = $(".ec");
		var email = $("#email").val();
		
		for(i=0;i<check.length;i++){
			if(check[i].value.length==0){
				c=false;
				break;
			}
		}
			if(!(nameCheck && c)){
				alert("정보를 제대로 입력해주세요");
			}else{
				
				  $.ajax({
					type: "post",	//method 형식 
					url : "./findEmail",//URL 주소
					data: {
						email:email
					},	//parameter
					success : function(data){
						alert(data);
						if(data.email == null){
							location.href="./idFindFail";
						}else{
						 	location.href="./idFindSuccess?id="+data.id+"&name="+data.name; 
						}
							
					},
					error	: function() {
						alert("권한이 없습니다");
					}
					
				});    
			}
 	 });
 	 
 	 
   //-- 폰번호로 찾기
  
	$("#phone_btn").click(function() {
		var c = true;
		var check = $(".pc");
		var phone = $("#mobile2").val();
		
		console.log(phone);
		
		for(i=0;i<check.length;i++){
			if(check[i].value.length==0){
				c=false;
				break;
			}
		}
			if(!(nameCheck && c)){
				alert("정보를 제대로 입력해주세요");
			}else{
				  $.ajax({
						type: "post",	//method 형식 
						url : "./findPhone", //URL 주소
						data: {
							phone1:phone
						},	//parameter
						success : function(data){
							if(data.id == null){
								location.href="./idFindFail";
							}else{
								location.href="./idFindSuccess?id="+data.id+"&name="+data.name; 
							}
								
						},
						error	: function() {
							alert("권한이 없습니다");
						}
						
					});    
				
				
			}
		
	});

