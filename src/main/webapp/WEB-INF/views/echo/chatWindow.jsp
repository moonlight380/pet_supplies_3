<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style type="text/css">
#roomWrap {
	width: 200px;
}

#roomList {
	border: 1px solid #0084FF;
	border-radius: 5px;
}

#roomHeader {
	background-color: #0084FF;
	color: #fff;
	height: 40px;
	font-size: 18px;
	line-height: 40px;
	text-align: center;
	border-radius: 5px;
}

.roomEl {
	text-align: center;
	border-bottom: 1px solid #f0f0f0;
	padding: 10px 0px;
	cursor: pointer;
}

.roomEl:hover {
	background: #f0f0f0;
}

.roomEl.active {
	background: #f0f0f0;
}

#chatWrap {
	width: 600px;
	border: 1px solid #ddd;
}

#chatHeader {
	height: 60px;
	text-align: center;
	line-height: 60px;
	font-size: 25px;
	font-weight: 900;
	border-bottom: 1px solid #ddd;
}

#messageArea {
	height: 700px;
	overflow-y: auto;
	padding: 10px;
}

.myMsg {
	text-align: right;
}

.anotherMsg {
	text-align: left;
	margin-bottom: 5px;
}

.msg {
	display: inline-block;
	border-radius: 15px;
	padding: 7px 15px;
	margin-bottom: 10px;
	margin-top: 5px;
}

.anotherMsg>.msg {
	background-color: #f1f0f0;
}

.myMsg>.msg {
	background-color: #0084FF;
	color: #fff;
}

.anotherName {
	font-size: 12px;
	display: block;
}

#chatForm {
	display: block;
	width: 100%;
	height: 50px;
	border-top: 2px solid #f0f0f0;
}

#message {
	width: 85%;
	height: calc(100% - 1px);
	border: none;
	padding-bottom: 0;
}

#message:focus {
	outline: none;
}

#chatForm>input[type=submit] {
	outline: none;
	border: none;
	background: none;
	color: #0084FF;
	font-size: 17px;
}

#memberWrap {
	width: 200px;
}

#memberList {
	border: 1px solid #aaaaaa;
	border-radius: 5px;
}

#memberHeader {
	height: 40px;
	font-size: 18px;
	line-height: 40px;
	padding-left: 15px;
	border-bottom: 1px solid #f0f0f0;
	font-weight: 600;
}

.memberEl {
	border-bottom: 1px solid #f0f0f0;
	padding: 10px 20px;
	font-size: 14px;
}

#contentCover {
	width: 90%;
	margin: 0 auto;
	padding-top: 20px;
	display: flex;
	justify-content: space-around;
}
</style>
</head>
<body>

	<div id="contentWrap">
		<div id="contentCover">
			<div id="chatWrap">
				<div id="chatHeader">오픈 문의방</div>
				<div>
					<div id="messageArea" class="anotherMsg">
						<span>접속중인 아이디 :</span>&nbsp<span id="id">${member.id}</span> <br>
						<br>
					</div>
				</div>
				<div id="chatForm">
					<input onkeyup="enterkey();" type="text" autocomplete="off" size="30" id="message"
						 placeholder="메시지를 입력하세요"> <input
						type="button" id="sendBtn" value="보내기">
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('');
		});

		function enterkey() {
			if (window.event.keyCode == 13) {
				sendMessage();
				$('#message').val('');
			}
		}

		let sock = new SockJS("http://localhost:8080/p1/echo");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		// 메시지 전송
		function sendMessage() {
			sock.send($("#id").text() + "  :  " + $("#message").val());
		}
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = msg.data;
			$("#messageArea").append(data + "<br/>");
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#messageArea").append("연결 끊김");

		}
	</script>

</body>
</html>