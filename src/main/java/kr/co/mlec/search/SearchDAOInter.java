package kr.co.mlec.search;

import java.util.List;
import java.util.Map;

import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.SearchVO;

public interface SearchDAOInter {

	public List<SearchVO> selectSearch(Map<String,String> search);
	public List<DiaryVO> selectSearchTagList(String tag);
	public List<DiaryVO> selectSearchContentList(String content);
	public List<DiaryVO> selectSearchWriter(String writer);
	
}
