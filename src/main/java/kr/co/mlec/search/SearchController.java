package kr.co.mlec.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.vo.DiaryVO;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping("/search")
	public String search() {
		return "search/search-tag";
	}
	
	@RequestMapping("/search/tag/{tag}")
	public ModelAndView searchTag(@PathVariable("tag") String tag, Model model) {
		List<DiaryVO> diary = searchService.selectSearchTag(tag);
		
		String msg = tag;
		model.addAttribute("msg", msg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("diary", diary);
//		mav.setViewName("");
		
		return mav;
	}
	
	@RequestMapping("/search/content/{content}")
	public void searchContent(@PathVariable("content") String content) {
		List<DiaryVO> diary = searchService.selectSearchContent(content);
		
	}
	
	@RequestMapping("/search/writer/{writer}")
	public void searchWriter(@PathVariable("writer") String writer) {
		List<DiaryVO> diary = searchService.selectSearchWriter(writer);
		
	}
	
}
