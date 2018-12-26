package kr.co.mlec.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAO implements NoticeDAOInter{
	
	SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeVO> selectAllNotice(int pageNo) {
		return sqlSession.selectList("kr.co.melc.notice.selectAllNoice",pageNo);
	}

}
