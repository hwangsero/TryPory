package kr.co.mlec.diary;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.io.JsonStringEncoder;

import kr.co.mlec.util.JsonUtil;
import vo.DiaryVO;
import vo.MemberVO;

@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	@GetMapping("/diary/{no}")
	public ModelAndView SearchDiary(@PathVariable int no) throws Exception {
		DiaryVO diary = diaryService.selectDiary(no);
		ModelAndView mav = new ModelAndView("diary/detail_diary_page");
		String content = diary.getContent();
//		JsonParser parser = new JsonParser();
//		JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES;

//		Object obj = parser.
//		JSONObject json = (JSONObject)parser.parse(content);
		
//		System.out.println(obj);



		mav.addObject("diary", diary);
		mav.addObject("content", content);
		
		return mav;
	}
	
	@PostMapping("/diary")
	@ResponseBody
	public int addDiary(@RequestBody Map<String, Object> data, HttpSession session ) throws ParseException {
//		String writer = ((MemberVO)session.getAttribute("userVO")).getEmail();
		String writer = "Test";
		Map<String, Object> post_data = (Map<String, Object>) data.get("post_data");
		List<List<Object>> date_data = (List<List<Object>>)data.get("date_data");
		List<String> content = new ArrayList<String>();

		for (int i = 0; i < date_data.size(); i++) { // 일차
			System.out.println(date_data.get(i));
			Map<String, Object> date_content = (Map<String, Object>) date_data.get(i);
			String date_content_str = JsonUtil.getJsonStringFromMap(date_content).toJSONString();
//			System.out.println(JsonUtil.getJsonStringFromMap(date_content).toJSONString() );

			//			List<Object> list = (List<Object>) date_data.get(i);
//			List<String> content_data = new ArrayList<String>();
//			for (int j = 0; j < list.size(); j++) {
////				System.out.println(JsonUtil.getJsonStringFromMap((Map<String, Object>)list.get(j)));
//				
//				Map<String, Object> map = (Map<String, Object>) list.get(j);
//				content_data.add(JsonUtil.getJsonStringFromMap(map).toJSONString() );
//			}
			content.add(date_content_str);
		}
		System.out.println(content.toString());
		
		DiaryVO diary = new DiaryVO();
		
		diary.setTitle((String)post_data.get("title"));
		diary.setWriter(writer);
		diary.setContent(content.toString());
		diary.setStart_date((String)post_data.get("start_date"));
		diary.setEnd_date((String)post_data.get("end_date"));

//		return 1;
		return diaryService.insertDiary(diary);
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
