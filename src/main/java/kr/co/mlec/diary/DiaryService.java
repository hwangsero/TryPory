package kr.co.mlec.diary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.vo.DiaryVO;


@Service
public class DiaryService implements DiaryServiceInter{

	@Autowired
	private DiaryDAO diaryDAO;
	@Override
	public DiaryVO selectDiary(int no) {
		DiaryVO diary = diaryDAO.selectDiary(no);
		return diary;
	}
	@Override
	public List<DiaryVO> selectAllDiary() {
		List<DiaryVO> diaryList = diaryDAO.selectAllDiary();
		return diaryList;
	}
	@Override
	public List<DiaryVO> selectFiveDiary(Map<String, Object> parameters) {
		List<DiaryVO> diaryList = diaryDAO.selectFiveDiary(parameters);
		return diaryList;
	}
	@Override
	public int insertDiary(DiaryVO diary) {
		return diaryDAO.insertDiary(diary);
	}
}
