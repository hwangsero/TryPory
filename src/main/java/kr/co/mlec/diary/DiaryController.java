package kr.co.mlec.diary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.tag.TagService;
import kr.co.mlec.util.JsonUtil;
import kr.co.mlec.util.ListUtil;
import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.MemberVO;
import kr.co.mlec.vo.TagVO;

@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	@Autowired
	private TagService tagService;
	
	@GetMapping("/diary/{no}")
	public ModelAndView SearchDiary(@PathVariable int no) throws Exception {
		DiaryVO diary = diaryService.selectDiary(no);
		ModelAndView mav = new ModelAndView("diary/detail_diary_page");
		String content = diary.getContent();

		mav.addObject("diary", diary);
		mav.addObject("content", content);
		
		return mav;
	}
	
	@PostMapping("/diary")
	@ResponseBody
	public int addDiary(@RequestBody Map<String, Object> data, HttpSession session ) throws Exception {
		DiaryVO diary = new DiaryVO();
		MemberVO member = (MemberVO)session.getAttribute("userVO");
		String writer;
		if( member != null) {
			writer = member.getEmail();
		} else {
			writer = "Test";
		}
		Map<String, Object> post_data = (Map<String, Object>) data.get("post_data");
		List<List<Object>> date_data = (List<List<Object>>)data.get("date_data");
		List<String> content = new ArrayList<String>();
		List<String> tag_list = (List<String>) post_data.get("tag");
		///////////////////////////////////////변수////////////////////////////////////

		for (int i = 0; i < date_data.size(); i++) { // 일차
			System.out.println(date_data.get(i));
			Map<String, Object> date_content = (Map<String, Object>) date_data.get(i);
			String date_content_str = JsonUtil.getJsonStringFromMap(date_content).toJSONString();

			content.add(date_content_str);
		}
//		System.out.println(content.toString());
		
		diary.setTag(ListUtil.toString(tag_list));
		
		diary.setWriter(writer);
		diary.setContent(content.toString());
		diary.setTitle((String)post_data.get("title"));
		diary.setCover_image((String)post_data.get("cover_image"));
		diary.setIs_share((String)post_data.get("lock"));
		diary.setStart_date((String)post_data.get("start_date"));
		diary.setEnd_date((String)post_data.get("end_date"));

		System.out.println(diary);

		diaryService.insertDiary(diary);
		
		int insert_diary_no = diary.getNo();
		for (int i = 0; i < tag_list.size(); i++) {
			TagVO tag = new TagVO();
			tag.setTag_name(tag_list.get(i));
			tag.setDiary_no(insert_diary_no);
			tagService.insertTag(tag);
		}
		
		return insert_diary_no;
//		return 1;
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
	

	
	
}
