package kr.co.mlec.login;

import java.util.Map;

import kr.co.mlec.vo.MemberVO;

public interface LoginDAOInter {

	public int joinMember(MemberVO member);
	public MemberVO loginMember(MemberVO member);
	public void createAuthKey(String user_email, String user_authCode);
	public MemberVO keyConfirm(String email, String key);
	public void authUpdate(String email);
	public MemberVO duplCheck(Map<String, Object> parameters);
}
