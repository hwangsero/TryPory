package kr.co.mlec.diary;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vo.DiaryVO;
import vo.MemberVO;

@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	@PostMapping("/diary")
	@ResponseBody
	public String addDiary(@RequestBody Map<String, Object> data, HttpSession session ) {
		System.out.println("다이어리 작성");
		System.out.println(data);
		
		String writer = ((MemberVO)session.getAttribute("userVO")).getEmail();
		System.out.println(data.get("post_data"));
		System.out.println(data.get("date_data"));
		
		return "test";
	}
	
	@RequestMapping("/diary")
	public ModelAndView DiaryList() {
		List<DiaryVO> diary = diaryService.selectAllDiary();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("diary/diaryList");
		mav.addObject("diary", diary);
		
		return mav;
	}
	
	@GetMapping("/diary/writeForm")
	public String DiaryWrite() {
		return "diary/write_diary_page";
	}
	@GetMapping("/diary/myMap")
	public String MyMap() {
		return "diary/my_map";
	}
	
	@RequestMapping("/diary/search/{tag}")
	public ModelAndView DiarySearchList(@PathVariable("tag") String tag, Model model) {
		List<DiaryVO> diary = diaryService.selectSearchDiary(tag);
		
		String msg = tag;
		model.addAttribute("msg", msg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("diary", diary);
		mav.setViewName("diary/diaryList");
		
		return mav;
		
	}
	
}
