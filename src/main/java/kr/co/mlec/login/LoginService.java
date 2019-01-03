package kr.co.mlec.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vo.MemberVO;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;
	
	public void joinMember(MemberVO member) {
		loginDAO.joinMember(member);
	}
	
	public MemberVO loginMember(MemberVO member) {
		return loginDAO.loginMember(member);
	}
}
