package kr.co.mlec.login;

import vo.MemberVO;

public interface LoginServiceInter {

	public void joinMember(MemberVO member);
	public MemberVO loginMember(MemberVO member);
	public MemberVO duplCheck(String email);
}
