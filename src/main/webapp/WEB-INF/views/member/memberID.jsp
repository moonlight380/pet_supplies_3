<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

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

<div class="container">

<div class="path" style="display: block; float: right; position: relative; height: auto;">
	<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home > </a></li>
		<li style="display: inline;"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인 > </a></li>
		<li style="display: inline;" title="현재 위치"><strong>아이디 찾기</strong></li>
	</ol>
</div>


<div style="margin-top: 100px; text-align: center; border: 1px solid red; display: block; border-bottom: 3px solid black;">
<h1 style=" margin-top: 50px; font-weight: bold; font-size: 36px;">아이디 찾기</h1>
</div>

<div class="IDserch" style="border: 1px solid #d7d5d5; height: 400px;">

<form action="./memberID" method="get" style="border: 1px solid black; width: 400px; height:100%; margin: 0 auto;">
 
<fieldset>
<div style="margin-top: 30px; text-align: center; font-size: 24px; font-weight: bold;">
<p>아이디 찾기</p>
</div>

<div style="margin-left: 30%; font-size: small;">
<input id="check_email" name="check_find" type="radio" value="1" onclick="setDisplay()" checked="checked"><label for="check_email">이메일</label>
<input id="check_phone" name="check_find" type="radio" value="2" onclick="setDisplay()"><label for="check_phone">휴대폰 번호</label>
</div>

<div style="height: 57px;">
 <p id="name" class="name" ><strong style="font-size: small;">이름</strong>
  <input id="check_name" name="name" class="ec check_name pc" placeholder="" value="" type="text" style="margin-left: 80px;">
  <span id = "nameContents" style="margin-left: 110px; font-size: xx-small;"></span></p>
 </div>
<div id="find_email" style="margin-top: 1px;">
 <p id="email_view" class="email" ><strong style="font-size: small;">이메일 입력</strong> 
 <input id="email" name="email"class="ec" placeholder="" value="" type="email" style="margin-left: 37px;"></p>
 <div class="ec-base-button gColumn">
    <input id="email_btn" type="button" value="확인" class="btn btn-lg btn-block" style="background-color: #FF324D; width: 300px; height:50px; margin: 0 auto; font-size: small; text-align: center; color: white;"> 
</div>
 </div>

<div id="find_phone" style="display: none; font-size: small;">
 <p id="phone_view" class="phone" style=""><strong>휴대폰 입력</strong> 
 <select id="mobile1" name="phone" id="mobile1" class="input_Join tel pc" style="margin-left: 39px;">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input style="width: 50px;" id="mobile2" name="phone" class="input_Join tel pc" maxlength="4" value="" type="text">-<input style="width: 50px;" id="mobile3" class="input_Join tel pc" name="phone" maxlength="4" value="" type="text">
<div class="ec-base-button gColumn">
 	<input id="phone_btn" type="button" value="확인" class="btn btn-lg btn-block" style="background-color: #FF324D; width: 300px; height:50px; margin: 0 auto; font-size: small; text-align: center; color: white;"> 

   
</div>
</div>

</fieldset>
</form>

</div>
</div>


<script type="text/javascript">

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
			
						if(data.email == null){
							location.href="./findFail";
						}else{
						 	location.href="./findSuccess?id="+data.id+"&name="+data.name; 
						}
							
					},
					error	: function() {
						alert("error");
					}
					
				});    
			}
 	 });
 	 
 	 
   //-- 폰번호로 찾기
  
	$("#phone_btn").click(function() {
		var c = true;
		var check = $(".pc");
		var phone = $("#mobile1").val()+$("#mobile2").val()+$("#mobile3").val();
		
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
							phone:phone
						},	//parameter
						success : function(data){
						
							if(data.phone == null){
								location.href="./findFail";
							}else{
								location.href="./findSuccess?id="+data.id+"&name="+data.name; 
							}
								
						},
						error	: function() {
							alert("error");
						}
						
					});    
				
				
			}
		
	});


</script>


</body>
</html>