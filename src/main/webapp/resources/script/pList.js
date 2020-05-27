/*체크박스 자바스크립트시작*/

      //1.모두 체크

       	//모두 선택
      	$("#product_all").click(function() {
      		var product_all = $("#product_all").prop("checked");
      		
      		if(right1){
      			$(".product_row_check").prop("checked", product_all);
      		}else{
      			$(".product_row_check").prop("checked", false);
      		}
      		
      	});	
      	//개별로 체크가 완료되면  product_all에도 체크    	
		$(".product_row_check").click(function(){
					var result=true;
				 	$(".product_row_check").each(function(){
						var v=$(this).prop("checked");
							//하나라도 체크가 아니라면
							if(!(v)){
								result=false;
							}
				 	});//for문 /
				 	$("#product_all").prop("checked",result);
		});


      	$(".product_del_btn").click(function(){
      	 			var deleteProduct=[];
      				var result=true;
      				
      			 	$(".product_row_check").each(function(){
      					var v=$(this).prop("checked");
      					console.log($(this).attr("name"));
      						if(v){
      							deleteProduct.push($(this).attr("name"));
      						}			
      				});//for문 /
      			 	console.log(deleteProduct);
      				
      				$.ajax({
      						type:"get",
      						traditional: true,
      						url:"./product_list_delete",
      						data:{
      							deleteProduct:deleteProduct
      						},
      						success: function(data)
      						{	alert("삭제성공")
      							//$("#"+deleteProduct).remove();
      							location.reload();
      						},error : function(request, status, error) {
      							alert("code = " + request.status + " message = "
      									+ request.responseText + " error = " + error);
      						}					
      				}); //END ajax  
      				
      				
      				
      	});