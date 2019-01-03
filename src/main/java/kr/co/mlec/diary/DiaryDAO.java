package kr.co.mlec.diary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import vo.DiaryVO;

@Controller
public class DiaryDAO implements DiaryDAOInter {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<DiaryVO> selectAllDiary() {
		List<DiaryVO> DiaryList = sqlSession.selectList("kr.co.mlec.diary.selectAllDiary");
		return DiaryList;
	}
	
	public List<DiaryVO> selectSearchDiary(String tag) {
		List<DiaryVO> DiaryList = sqlSession.selectList("kr.co.mlec.diary.selectSearchDiary", tag);
		return DiaryList;
	}

}
