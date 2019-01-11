package kr.co.mlec.search;

import java.util.List;

import kr.co.mlec.vo.DiaryVO;

public interface SearchServiceInter {

	public List<String> selectSearch(String type, String word);
	public List<DiaryVO> selectSearchTagList(String tag);
	public List<DiaryVO> selectSearchContentList(String content);
	public List<DiaryVO> selectSearchWriter(String writer);
}
