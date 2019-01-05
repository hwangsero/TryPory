package kr.co.mlec.diary;

import java.util.List;

import kr.co.mlec.vo.DiaryVO;


public interface DiaryDAOInter {

	List<DiaryVO> selectAllDiary();
}
