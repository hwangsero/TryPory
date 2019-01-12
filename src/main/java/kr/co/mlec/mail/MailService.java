package kr.co.mlec.mail;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.MemberVO;

@Service
public class MailService {
	@Autowired
	private LoginService loginService;
	@Inject
	private JavaMailSender mailSender;

	public void sendEmail(MemberVO member) throws Exception {
		String key = new TempKey().getKey(50, false); // 인증키 생성

		loginService.createAuthKey(member.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("Tripory [서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("<a href='http://localhost:8888/Travel-Diary/emailConfirm?email=").append(member.getEmail())
				.append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("goochangdev@gmail.com", "Tripory");
		sendMail.setTo(member.getEmail());
		sendMail.send();
	}
	
	public void findSendEmail(MemberVO member) throws Exception {


		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("Tripory [비밀번호 찾기 인증]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("<a href='http://localhost:8888/Travel-Diary/jsp/findPassword/changePassword.jsp?email=").append(member.getEmail())
				.append("'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("goochangdev@gmail.com", "Tripory");
		sendMail.setTo(member.getEmail());
		sendMail.send();
	}

}
