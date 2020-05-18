
	<div
		style="position: fixed; bottom: 120px; left: 50%; margin-left: 400px; z-index: 10001;">

		<div id="chatBotBtDiv" style="">
			<a id="chatBotBt" href=""
				onclick="window.open('${pageContext.request.contextPath}/echo/chatmodal','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
				style="display: block; width: 229px; height: 115px; text-align: right;">
				<img
				src="${pageContext.request.contextPath}/resources/images/chatbotwaiting.gif"
				alt="상담챗봇 창 열림" id="chatBotBtFloating"
				style="bottom: 20px; display: block; width: 229px; height: 199px">
			</a>
		</div>

		<iframe name="cbIframe" id="cbIframe" src="" scrolling="no"
			frameborder="0"
			style="display: none; height: 650px; width: 400px; position: fixed; bottom: 20px; right: 120px; z-index: 9998; background: #fff;"
			title="상담챗봇 창"></iframe>