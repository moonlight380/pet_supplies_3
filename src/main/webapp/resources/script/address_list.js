/**
 * 
 */
/*자식->부모로 값전달하기 자바스크립트 시작*/
        function setParentText(num){
             opener.document.getElementById("rname").value = document.getElementById("rname"+num).innerText //$("").text()        
             opener.document.getElementById("rzipcode1").value = document.getElementById("rzipcode1"+num).innerText
            
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

        
/*체크박스 자바스크립트시작*/

      //1.모두 체크

       	//모두 선택
      	$("#allCheck").click(function() {
      		var allCheck = $("#allCheck").prop("checked");
      		
      		if(allCheck){
      			$(".rowCheck").prop("checked", allCheck);
      		}else{
      			$(".rowCheck").prop("checked", false);
      		}
      		
      	});	
      	//개별로 체크가 완료되면  allcheck에도 체크
      	$(".check").click(function(){
      		if($("input[name='check']:checked")){
      			$("#allCheck").prop("checked",true);
      		}else{
      			$("#allCheck").prop("checked",false);
      		}
      	});
      	
      	
      	
/*      	$(".check").each(function(){
      		if(!$(this).prop("checked")){
      			$("#allCheck").prop("checked",false);
      		}
      		$(".check").prop("checked",$("#allCheck").prop("checked"));
      		
      		
      	});*/

      	//하나씩 선택해서 모두 체크하면 allCheck

      	$(".deleteBtn").click(function(){
      	 			var deleteAddress=[];
      				var result=true;
      				
      			 	$(".rowCheck").each(function(){
      					var v=$(this).prop("checked");
      					console.log($(this).attr("name"));
      						if(v){
      							deleteAddress.push($(this).attr("name"));
      						}			
      				});//for문 /
      				console.log(deleteAddress);
      				
      				$.ajax({
      						type:"get",
      						traditional: true,
      						url:"./address_delete",
      						data:{
      							deleteAddress:deleteAddress
      						},
      						success: function(data){
      							$.get("./address_reset",function(data){
      								console.log(data);
      								$("#reset").html(data.trim());
      								
      							});
      						}					
      				}); //END ajax  
      				
      				
      				
      	});

      	
      	
/*title 속성 가져오기*/
/*
      	$(".updateBtn").click(function(){
      		var input= $(this).attr("title");
      		location.href="./address_update?addressNum="+input;
      	});

*/
