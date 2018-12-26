package kr.co.mlec.login;

public interface LoginDAOInter {

	public void joinMember(MemberVO member);
	public MemberVO loginMember(MemberVO member);
}
