package kr.co.mlec.login;

import kr.co.mlec.vo.MemberVO;

public interface LoginServiceInter {

	public void joinMember(MemberVO member);
	public MemberVO loginMember(MemberVO member);
	public MemberVO duplCheck(String email);
}
