package kr.co.mlec.search;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.SearchVO;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping("/search")
	public ModelAndView search(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if( request.getParameter("value") != null ) { // 태그 클릭해서 들어오는 경우
			mav.addObject("search_value", request.getParameter("value"));
		}
		
		mav.setViewName("search/search-tag");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/search/{type}/{word}")
	public List<SearchVO> searchTag(@PathVariable("type") String type, @PathVariable("word") String word) {
		List<SearchVO> searchList = searchService.selectSearch(type, word);
		System.out.println(type);
		System.out.println(word);
		
		for(SearchVO data : searchList) {
			System.out.println(data);
		}
		return searchList;
	}
	
	@RequestMapping("/search/tag/list/{tag}")
	public ModelAndView searchTagList(@PathVariable("tag") String tag, Model model) {
		List<DiaryVO> diary = searchService.selectSearchTagList(tag);
		
		String msg = tag;
		model.addAttribute("msg", msg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("diary", diary);
		
		return mav;
	}
	
	@RequestMapping("/search/content/list/{content}")
	public void searchContent(@PathVariable("content") String content) {
		List<DiaryVO> diary = searchService.selectSearchContentList(content);
		
	}
	
	@RequestMapping("/search/writer/list/{writer}")
	public void searchWriter(@PathVariable("writer") String writer) {
		List<DiaryVO> diary = searchService.selectSearchWriter(writer);
		
	}
	
}
