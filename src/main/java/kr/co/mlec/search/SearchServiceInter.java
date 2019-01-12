package kr.co.mlec.search;

import java.util.List;
import java.util.Map;

import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.SearchVO;

public interface SearchServiceInter {

	public List<SearchVO> selectSearch(String type, String word);
	public List<DiaryVO> selectSearchTagList(String tag);
	public List<DiaryVO> selectSearchContentList(String content);
	public List<DiaryVO> selectSearchWriter(String writer);
}
