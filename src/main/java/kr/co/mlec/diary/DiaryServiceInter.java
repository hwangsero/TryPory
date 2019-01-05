package kr.co.mlec.diary;

import java.util.List;

import kr.co.mlec.vo.DiaryVO;

public interface DiaryServiceInter {

	public DiaryVO selectDiary(int no);
	public List<DiaryVO> selectAllDiary();
	public int insertDiary(DiaryVO diary);
	
	
}
