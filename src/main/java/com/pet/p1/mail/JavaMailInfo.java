package com.pet.p1.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.p1.member.MemberDAO;
import com.pet.p1.member.MemberVO;

@Service
public class JavaMailInfo{
	@Autowired
	private MemberDAO memberDAO;
	
	public void Sendmail(String mailto,String code,String id) throws Exception {
		// 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다. 
		String host = "smtp.gmail.com";
		final String username = "tudsid147@gmail.com"; 
		final String password = "wwic0330@@"; 
		//int port=587; //포트번호
		
		//비밀번호 무작위 생성
		char[] charSet = new char[] {'1','2','3','4','5','6','7','8','9','0',
                'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                '!','@','#','$','%','^','&','*','(',')'};
		
		int idx = 0; StringBuffer sb = new StringBuffer();
		System.out.println("charSet.length :::: "+charSet.length);
		int len = 10;
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			System.out.println("idx :::: "+idx);
			sb.append(charSet[idx]); 
		}
		
		String pw = sb.toString();

	
		// 메일 내용
		String recipient = mailto; //받는 사람의 메일주소를 입력해주세요. 
		String subject = "펫코리아에서 보낸 메일입니다 "+code; //메일 제목 입력해주세요. 
		String body = id+"님의 임시 비밀번호는 "+pw+"입니다.";//메일 내용 입력해주세요. 
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
		// SMTP 서버 정보 설정 
		//props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", "587"); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.debug", "true"); 
		//props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.enable", "false");
		//props.put("mail.smtp.ssl.trust", host); 
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true"); // Make it true
		
		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); 
			} 
		}); 
		
		session.setDebug(true);
	   
		//for debug 
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("tudsid147@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); //제목셋팅 
	//	mimeMessage.setText(body); //내용셋팅 
		mimeMessage.setContent(body, "text/plain;charset=KSC5601");

		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		memberDAO.pwUpdate(memberVO);
	}

	
}
