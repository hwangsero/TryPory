package kr.co.mlec.search;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.SearchVO;

@Repository
public class SearchDAO implements SearchDAOInter{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DiaryVO> selectSearchTagList(String tag) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearchTagList", tag);
	}

	@Override
	public List<DiaryVO> selectSearchContentList(String content) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearchContent", content);
	}

	@Override
	public List<DiaryVO> selectSearchWriter(String writer) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearchWriter", writer);
	}

	@Override
	public List<SearchVO> selectSearch(Map<String,String> search) {
		return sqlSession.selectList("kr.co.mlec.search.selectSearch", search);
	}
}
