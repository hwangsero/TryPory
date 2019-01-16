package kr.co.mlec.mypage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.vo.MemberVO;


@Repository
public class MyPageDAO implements MyPageDAOInter{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void updateMember(MemberVO userVO) {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.mlec.mypage.updateMember", userVO);
		
	}

	public int updateProfileImg(MemberVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("kr.co.mlec.mypage.updateProfileImg", userVO);
	}

	public int deleteProfileImg(MemberVO userVO) {
		return sqlSession.update("kr.co.mlec.mypage.deleteProfileImg", userVO);
	}
	
}
