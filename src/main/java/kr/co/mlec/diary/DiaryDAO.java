package kr.co.mlec.diary;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mlec.vo.DiaryVO;


@Controller
public class DiaryDAO implements DiaryDAOInter {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public DiaryVO selectDiary(int no) {
		DiaryVO diary = sqlSession.selectOne("kr.co.mlec.diary.selectDiary", no);
		return diary;
	}
	
	@Override
	public List<DiaryVO> selectAllDiary() {
		List<DiaryVO> DiaryList = sqlSession.selectList("kr.co.mlec.diary.selectAllDiary");
		return DiaryList;
	}

	@Override
	public int insertDiary(DiaryVO diary) {
		return sqlSession.insert("kr.co.mlec.diary.insertDiary", diary);
	}

	@Override
	public List<DiaryVO> selectFiveDiary(Map<String, Object> parameters) {
		List<DiaryVO> DiaryList = sqlSession.selectList("kr.co.mlec.diary.selectFiveDiary", parameters);
		return DiaryList;
	}

	public List<DiaryVO> selectSearchFiveDiary(Map<String, Object> parameters) {
		List<DiaryVO> DiaryList = sqlSession.selectList("kr.co.mlec.diary.selectSearchFiveDiary", parameters);
		return DiaryList;
	}

	public void upView_cnt(int no) {
		sqlSession.update("kr.co.mlec.diary.up_viewCnt", no);
	}

	@Override
	public List<String> selectBestTag() {
		return sqlSession.selectList("kr.co.mlec.diary.selectBestTag");
	}

	@Override
	public List<DiaryVO> selectBestDiary() {
		return sqlSession.selectList("kr.co.mlec.diary.selectBestDiary");
	}

	public List<DiaryVO> selectMyDiary(Map<String, Object> parameters) {
		return sqlSession.selectList("kr.co.mlec.diary.selectMyDiary", parameters);
	}

	public List<DiaryVO> selectScrapDiary(Map<String, Object> parameters) {
		return sqlSession.selectList("kr.co.mlec.diary.selectScrapDiary", parameters);
	}

}
