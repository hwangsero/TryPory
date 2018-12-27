package kr.co.mlec.diary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryService {

	@Autowired
	private DiaryDAO diaryDAO;

	public List<DiaryVO> selectAllDiary() {
		List<DiaryVO> diaryList = diaryDAO.selectAllDiary();
		return diaryList;
	}
	
	public List<DiaryVO> selectSearchDiary(String tag) {
		List<DiaryVO> diaryList = diaryDAO.selectSearchDiary(tag);
		return diaryList;
	}
}
