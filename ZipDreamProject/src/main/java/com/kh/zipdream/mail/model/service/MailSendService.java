package com.kh.zipdream.mail.model.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
	@Autowired // context-mail에서 빈 등록했기 때문에 주입받을 수 있다. Spring에서 제공하는 MailSender.
	private JavaMailSenderImpl mailSender;

	private String getKey(int size) {
		Random random = new Random();
	    StringBuilder keyBuilder = new StringBuilder();
	    for (int i = 0; i < size; i++) {
	        int digit = random.nextInt(10);
	        keyBuilder.append(digit);
	    }
	    return keyBuilder.toString();
	}

	public String sendAuthMail(String mail) throws MessagingException {
		String authKey = getKey(6);
		MimeMessage mailMessage = mailSender.createMimeMessage();
		String mailContent = "인증번호:   " + authKey; // 보낼 메시지
		mailMessage.setFrom(new InternetAddress("minifkaus@naver.com"));
		mailMessage.setSubject("zipdream 회원가입 인증코드입니다.", "utf-8");
		mailMessage.setText(mailContent, "utf-8", "html");
		mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));
		mailSender.send(mailMessage);

		return authKey;
	}
}
