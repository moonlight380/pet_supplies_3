<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  <!-- 제이쿼리 --> 
<!DOCTYPE html>
<html>
<!--위치는 WEBAPP 밑에 //보안으로 하려면 web-inf 우선은 테스트-->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#popClose_btn{
margin-left: 650px;
}
</style>



</head>
<body>
    <br>
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
 
       배송지명: <input type="text" id="addressName" name="addressName"/> <br/>
       성명: <input type="text" id="name" name="name"/> <br/>
       주소: <input type="text" id="adressInput" name="adressInput"/> <br/>
       일반전화: <input type="tel" id="homePhone" name="homePhone"/> <br/>
       휴대전화: <input type="tel"  id="phone" name="phone"/>
    <input type="button" value="전달하기" onclick="setParentText()">
    
    <br><br>
    <input type="button" value="창닫기" onclick="window.close()">
    
    <script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("addressName").value = document.getElementById("addressName").value
             opener.document.getElementById("name").value = document.getElementById("name").value
             opener.document.getElementById("adressInput").value = document.getElementById("adressInput").value
             opener.document.getElementById("homePhone").value = document.getElementById("homePhone").value
             opener.document.getElementById("phone").value = document.getElementById("phone").value
             
        }
   </script>
    
<!-- <h1>주소록</h1>
    <form name="extendHDD" method="Post">
        배송지명: <input type="text" id="addressName" name="addressName"/> <br/>
        성명: <input type="text" id="name" name="name"/> <br/>
        주소: <input type="text" name="productname"/> <br/>
        일반전화: <input type="tel" name="warranty"/> <br/>
         휴대전화: <input type="tel" name="warranty"/>
    </form>
     
    <a href="javascript:sendData();"><button>팝업창전송</button></a> 

 <script>
/*         function sendData(){
            var frm = document.extendHDD;
            var url = "./${p}List";
            var title = "pop"; //객체의 레퍼런스가 아닌 스트링을 사용한 이름을 지정해 주어야 함.
            var status = "width=1000,height=680,menubar=no,toolbar=no,location=no,status=no,fullscreen=no,scrollbars=no,resizable=yes,top=0,left=0";
 
            window.open(url, title, status);
 
            frm.method = "get";
            frm.encoding = "application/x-www-form-urlencoded";
            frm.target = title;
            frm.action = url;
            frm.submit(); 
        }  */
        
         window.opener.document.getElementById("addressName").value=$("#addressName").val();
/*         var name=$("#addressName").val();
        
        $("#address",opener.document).val(name); */
        
    </script> -->






<!-- <input id="popClose_btn" type='BUTTON' value="닫기x" onClick="winClose();">

<script type="text/javascript">

function winClose()
{
	//크롬창에서는 자식창을 닫을 때 window.close()가 작동하지 않아서 다른 방법으로 대체
	window.close();
	self.close();
	window.opener = window.location.href;
	self.close();
	window.open('about:blank','_self').close();
	

	//부모창리로드
	window.opener.location.reload(); 
	window.close();  
	
}
</script> -->

<!-- <script type="text/javascript">
window.opener.location.reload();
window.close();
</script> -->


</body>
</html>
