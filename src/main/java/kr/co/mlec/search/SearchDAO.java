package kr.co.mlec.search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.vo.DiaryVO;

@Repository
public class SearchDAO implements SearchDAOInter{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DiaryVO> selectSearchTag(String tag) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearchTag", tag);
	}

	@Override
	public List<DiaryVO> selectSearchContent(String content) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearchContent", content);
	}

	@Override
	public List<DiaryVO> selectSearchWriter(String writer) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearchWriter", writer);
	}
}
