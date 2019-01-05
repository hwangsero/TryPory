package kr.co.mlec.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.vo.DiaryVO;

@Service
public class SearchService implements SearchServiceInter{
	
	@Autowired
	private SearchDAO searchDAO;

	public List<DiaryVO> selectSearchTag(String tag) {
		List<DiaryVO> diaryList = searchDAO.selectSearchTag(tag);
		return diaryList;
	}

	@Override
	public List<DiaryVO> selectSearchContent(String content) {
		return searchDAO.selectSearchContent(content);
	}

	@Override
	public List<DiaryVO> selectSearchWriter(String writer) {
		return searchDAO.selectSearchWriter(writer);
	}
}
