package kr.co.mlec.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.vo.MemberVO;

@Service
public class LoginService implements LoginServiceInter {

	@Autowired
	private LoginDAO loginDAO;

	public int joinMember(MemberVO member) {
		return loginDAO.joinMember(member);
	}

	/**
	 * 회원조회
	 */
	public MemberVO loginMember(MemberVO member) {
		return loginDAO.loginMember(member);
	}

	@Override
	public MemberVO duplCheck(Map<String, Object> parameters) {
		return loginDAO.duplCheck(parameters);
	}

	@Override
	public void createAuthKey(String user_email, String user_authCode) throws Exception {
		loginDAO.createAuthKey(user_email, user_authCode);
	}

	@Override
	public MemberVO keyConfirm(String email, String key) {
		return loginDAO.keyConfirm(email, key);
	}

	@Override
	public void AuthUpdate(String email) {
		loginDAO.authUpdate(email);
	}
	
}
