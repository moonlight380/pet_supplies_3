package com.pet.p1.echoHandler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 클라이언트 연결 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	}

	// 클라이언트가 웹 소켓 서버로 메세지를 전송했을 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		// 모든 유저에게 메세지 출력
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		sessionList.remove(session);
		logger.info("{}연결 끊김.", session.getId());
		System.out.println("채팅방 퇴장:" + session.getPrincipal().getName());
	}

}
