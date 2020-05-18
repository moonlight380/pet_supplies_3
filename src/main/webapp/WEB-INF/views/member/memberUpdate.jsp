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
										<input class="form-control col-sm-8 text-center"
											type="text" style="margin-left: 90px;"
											id="phone" name="phone" value="${member.phone }" >
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
										<input class="form-control col-sm-8 text-center"
											type="text" style="margin-left: 90px;"
											id="address" name="address" value="${member.address }" >
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


</script>

</html>