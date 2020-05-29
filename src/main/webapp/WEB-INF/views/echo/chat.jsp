<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.pubnub.com/pubnub-3.4.4.js"></script>
	<script>
		var pubnub = PUBNUB.init({
			publish_key : 'pub-c-5420be45-0fb1-47f9-8ea6-13b4c0c4a37e',
			subscribe_key : 'sub-c-99fff064-4631-11e8-afae-2a65d00afee8',
			ssl : true
		});

		pubnub.subscribe({
			channel : 'chat',
			message : displayPub
		});

		/* 		pubnub.history({
		 channel : 'chat',
		 reverse : true,
		 count : 100
		 }, function(status, response) {
		 $.each(status[0], function(i, item) {
		 displayPub(item);
		 });
		 }); */

		function displayPub(message) {
			var html = "<div>" + message.username + ": " + message.text
					+ "</div>";
			$("#chatPub").append(html).scrollTop(999999);
		}

		function sendPub() {
			if ($("#name").val() == '') {
				alert("enter your name");
				return;
			}
			if ($("#messagePub").val() == '')
				return;
			pubnub.publish({
				channel : 'chat',
				message : {
					username : $("#name").val(),
					text : $("#messagePub").val()
				}
			});
			$("#messagePub").val('').focus();
		}

		$(document).ready(function() {
			$("#sendPub").click(function() {
				sendPub();
			});
			$("#messagePub").keyup(function(event) {
				if (event.keyCode == 13)
					sendPub();
			});
		});
	</script>


	<input type="text" id="name" value="${member.id}" readonly="readonly"
		required />
	<input type="text" id="messagePub" placeholder="문의내용을 입력해주세요" required />
	<input type="submit" id="sendPub" value="enter" />

	<div id="chatPub" style="overflow: auto; height: 200px;"></div>

</body>
</html>