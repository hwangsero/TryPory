package kr.co.mlec.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO implements NoticeDAOInter{
	
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

	@Override
	public int selectCountNotice() {
		return sqlSession.selectOne("kr.co.mlec.notice.selectCountNotice");
	}

	@Override
	public List<NoticeVO> selectSearchNotice(Map searchMap) {
		return sqlSession.selectList("kr.co.mlec.notice.selectSearchNotice", searchMap);
	}


	@Override
	public void deleteNotice(int noticeNo) {
		sqlSession.delete("kr.co.mlec.notice.deleteNotice",noticeNo);
		
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		sqlSession.update("kr.co.mlec.notice.updateNotice",noticeVO);
		
	}

	@Override
	public NoticeVO selectByNoNotice(int noticeNo) {
		return sqlSession.selectOne("kr.co.mlec.notice.selectByNoNotice", noticeNo);
	}


}
