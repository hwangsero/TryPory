package kr.co.mlec.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.login.MemberVO;
import kr.co.mlec.notice.NoticeVO;

@Repository
public class MyPageDAO implements MyPageDAOInter{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void updateMember(MemberVO userVO) {
		// TODO Auto-generated method stub
		sqlSession.update("kr.co.mlec.mypage.updateMember", userVO);
		
	}
	
}
