package kr.co.mlec.diary;

import java.util.List;
import java.util.Map;

import kr.co.mlec.vo.DiaryVO;

public interface DiaryServiceInter {

	public DiaryVO selectDiary(int no);
	public List<DiaryVO> selectAllDiary();
	public int insertDiary(DiaryVO diary);
	public List<DiaryVO> selectFiveDiary(Map<String, Object> parameters);
	public List<DiaryVO> selectSearchFiveDiary(Map<String, Object> parameters);
	public void upView_cnt(int no);
	public List<String> selectBestTag();
	
	
}
