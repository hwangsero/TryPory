package kr.co.mlec.mypage;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.notice.NoticeVO;

@Repository
public class MyPageDAO implements MyPageDAOInter{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeVO> selectAllNotice(Map<String, Integer> pageMap) {
		return sqlSession.selectList("kr.co.mlec.notice.selectAllNotice",pageMap);
	}

	@Override
	public void insertNotice(NoticeVO noticeVO) {
		sqlSession.insert("kr.co.mlec.notice.insertNotice", noticeVO);
	}
}
