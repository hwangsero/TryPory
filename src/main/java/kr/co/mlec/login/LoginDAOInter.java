package kr.co.mlec.login;

import vo.MemberVO;

public interface LoginDAOInter {

	public void joinMember(MemberVO member);
	public MemberVO loginMember(MemberVO member);
}
