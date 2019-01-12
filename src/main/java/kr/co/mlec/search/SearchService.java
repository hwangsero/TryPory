package kr.co.mlec.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.SearchVO;

@Service
public class SearchService implements SearchServiceInter{
	
	@Autowired
	private SearchDAO searchDAO;

	public List<DiaryVO> selectSearchTagList(String tag) {
		List<DiaryVO> diaryList = searchDAO.selectSearchTagList(tag);
		return diaryList;
	}

	@Override
	public List<DiaryVO> selectSearchContentList(String content) {
		return searchDAO.selectSearchContentList(content);
	}

	@Override
	public List<DiaryVO> selectSearchWriter(String writer) {
		return searchDAO.selectSearchWriter(writer);
	}

	@Override
	public List<SearchVO> selectSearch(String type, String word) {
		Map<String, String> search = new HashMap<>();
		search.put("type", type);
		search.put("word", word);
		return searchDAO.selectSearch(search);
	}
}
