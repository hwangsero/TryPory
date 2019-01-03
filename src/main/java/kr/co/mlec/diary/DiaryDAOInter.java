package kr.co.mlec.diary;

import java.util.List;

import vo.DiaryVO;

public interface DiaryDAOInter {

	List<DiaryVO> selectAllDiary();
}
