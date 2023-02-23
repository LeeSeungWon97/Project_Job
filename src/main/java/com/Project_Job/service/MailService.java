package com.Project_Job.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.Project_Job.dao.MemberDao;

@Service
public class MailService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private MemberDao mdao;

	private int authNumber;

	// 인증메일 발송 메소드
	public String sendCode(String email) {
		makeRandomNumber();
		String setFrom = "icia0803@gmail.com";
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + authNumber + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	// 아이디 발송 메소드
	public void sendId(String email, String findMid) {
		String setFrom = "icia0803@gmail.com";
		String toMail = email;
		String title = "아이디 찾기 결과입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "회원님의 아이디는 " + findMid + "입니다." + "<br>";
//		mailSend(setFrom, toMail, title, content);
	}

	// 난수발생 메소드(6자리)
	public void makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}

	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 전송 메소드
	public void sendPw(String loginType, String id, String FindMpw) {
		String setFrom = "icia0803@gmail.com";
		String toMail = "";
		if(loginType.equals("개인")) {
			toMail = mdao.selectMemberEmail(id);
		} else {
			toMail = mdao.selectCMemberEmail(id);
		}
		System.out.println(toMail);
		String title = "비밀번호 찾기 결과입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "회원님의 비밀번호는 " + FindMpw + "입니다." + "<br>";
//		mailSend(setFrom, toMail, title, content);
	}
}
