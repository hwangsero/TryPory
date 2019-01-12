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
		System.out.println(parameters);
		List<DiaryVO> DiaryList = sqlSession.selectList("kr.co.mlec.diary.selectFiveDiary", parameters);
		return DiaryList;
	}

}
