
/**
 * 
 */

var count=1;

$("#file").on("click", ".remove", function() {
	alert("파일을 삭제하겠습니까?");
	$(this).parent().remove();
	count--;
});

$("#add").click(function() {
	if(count<20){
		$("#file").append('<div class="form-group"> <label for="file"> File :</label> <input type="file" class="form-control files" name="files"> <i class="fas fa-paw remove" style="font-size:24px"></i></div>');
		count++;                     
	}else {
		alert("파일은 최대 20개 가능");
	}
});


	

$("#contents").summernote({
	height: 300,
	//이미지를 업로드할 때 사용할  callback 함수는 onImageUpload 란 함수이다.
	callbacks:{
		onImageUpload:function(files, editor){
			//console.log("d");
			var formData = new FormData();//<form></form>
			formData.append('files', files[0]); //<input type="file" name="">
			
			$.ajax({
				type:"POST",
				url:"../productFile/fileInsert",
				data:formData,
				enctype:"multipart/form-data",
				cache:false,
				contentType:false,
				processData:false,
					success:function(imageName){
						console.log(imageName);
						imageName=imageName.trim();//공백제거는 습관적으로
						$("#contents").summernote('editor.insertImage', imageName);//에디터는 썸머 자기자신 */
						
					}
				
			});//ajax
		},//onImageUpload  , 로 구분
		
		onMediaDelete:function(files){
			var fileName= $(files[0]).attr("src");
			fileName=fileName.substring(fileName.lastIndexOf("/")); //가장 마지막 슬러시가 오는 곳 ,+1은 그다음 부터
			//파일 이름을 찾기 위해서
			console.log(fileName);
			//console.log(files); //files은 배열
			//경로명과 파일명은 속성에 있어서 속성을 꺼내 오는 것.
			////
			//아래의 url로 보낼 준비가 완성
			 $.ajax({
				type:"POST",
				url:"../productFile/summerDelete",
					data:{
						fileName:fileName					
					},
					success:function(data){
						console.log(data);
					}
			}); //ajax
		}//OnMediaDelete
		
	}	//callback
});// $("#contents").summernote

//----------------------------------------------------------------------------//

	var priceCheck= true;
 	$("#price").blur(function() {
	
	 	var price = $(this).val(); 
	 	console.log("#price".isEmpty);
	 	if((price/1<1)||price==" "||price.length <= 1){
	 		$("#priceContents").html("가격은 1이상의 숫자만 가능합니다.");
	    	$("#priceContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	priceCheck= false;
	 	}else if(isNaN(price)){
	 		$("#priceContents").html("가격은 숫자만 가능합니다.");
	    	$("#priceContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	priceCheck= false;
	 	}else{
	 		$("#priceContents").html(" ");
	    	$("#priceContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	priceCheck= true;
	 	}
	
	});
	
//----------------------------------------------------------------------------//	
	var pointCheck= true;
 	$("#point").blur(function() {
 		pointCheck= true;
	 	var point = $(this).val(); 
	 	
	 	if((point/1<1)||point==""){
	 		$("#pointContents").html("포인트는 1이상의 숫자만 가능합니다.");
	    	$("#pointContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	pointCheck= false;
	 	}else if(isNaN(point)){
	 		$("#pointContents").html("포인트는 숫자만 가능합니다.");
	    	$("#pointContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	pointCheck= false;
	 	}else{
	 		$("#pointContents").html(" ");
	    	$("#pointContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	priceCheck= true;
	 	}
	
	});
//----------------------------------------------------------------------------//	
	var saleCheck= true;
 	$("#sale").blur(function() {
 		saleCheck= true;
	 	var sale= $(this).val(); 
	 	console.log(sale);
	 	
	 	if((sale/1<0)||sale==""){
	 		$("#saleContents").html("세일%은 0이상의 숫자만 넣어주세요.");
	    	$("#saleContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	saleCheck= false;
	 	}else if(isNaN(sale)){
	 		$("#saleContents").html("세일%은 숫자만 넣어주세요.");
	    	$("#saleContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	saleCheck= false;
	 	 
	 	}else{
	 		$("#saleContents").html(" ");
	    	$("#saleContents").css({'color':'blue','font-weight':'bold', 'font-size':'small'});
	    	saleCheck= true;
	 	}
	
	});
 	
//----------------------------------------------------------------------------// 

 	
 	$("#btn111").click(function() {
 		//productName, contents 데이터 유무 검증
 		console.log("point");
 		console.log(pointCheck);
 		var productName = $("#productName").val();
 		var contents = $("#contents").summernote('code');
 		
 		var p3 = true;
 		
 		$(".files").each(function() {
 			if($(this).val()==""){
 				p3 = false;
 			}
 		});
 		
 		var p1 = productName !="";
 		var p2 = $("#contents").summernote('isEmpty');
 		if("#price".isEmpty){
 			
 		}
 		if(p1 && p3&& priceCheck&&pointCheck&&saleCheck){
 			//form 전송(submit event 강제 발생)
// 			<!-- contents Server null이 될때-->
 			$("#con").val(contents);
 			$("#frm").submit();
 			
 		}else {
 			//submit event 종료
 			alert("정보를 올바르게 입력해 주세요");
 		}

 	});



