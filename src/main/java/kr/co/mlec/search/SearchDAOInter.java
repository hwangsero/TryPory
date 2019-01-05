package kr.co.mlec.search;

import java.util.List;

import kr.co.mlec.vo.DiaryVO;

public interface SearchDAOInter {

	public List<DiaryVO> selectSearchTag(String tag);
	public List<DiaryVO> selectSearchContent(String content);
	public List<DiaryVO> selectSearchWriter(String writer);
}
