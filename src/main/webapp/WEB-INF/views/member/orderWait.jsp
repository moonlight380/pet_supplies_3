<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderWait</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
 <h1 hidden="hidden" id="direct_cnum">${cnum }</h1>

</body>


<script type="text/javascript">
		$(document).ready(function(){
			
				var ids=[];
				var cnum=$("#direct_cnum").text();
				ids.push(cnum);
				console.log(ids);
				$.ajax({
					type:"post",
					traditional : true,
					url:"./memberPaymentList",
					data:{
						ids:ids
					},
					success:function(data){
						location.href="../member/memberPayment";
					}
				});
			
		});

		

/* 오류 팝업창으로		error : function(request, status, error) {
			alert("code = " + request.status + " message = "
					+ request.responseText + " error = " + error);
		}		
		 */


</script>
</html>