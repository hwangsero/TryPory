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

}
