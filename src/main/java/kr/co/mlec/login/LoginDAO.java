package kr.co.mlec.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class LoginDAO implements LoginDAOInter{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void joinMember(MemberVO member) {
		System.out.println(member);
		sqlSession.insert("kr.co.mlec.login.joinMember", member);
	}
	
	@Override
	public MemberVO loginMember(MemberVO member) {
		return sqlSession.selectOne("kr.co.mlec.login.loginMember", member);
	}

	@Override
	public MemberVO duplCheck(String email) {
		return sqlSession.selectOne("kr.co.mlec.login.duplCheck", email);
	}


}
