package kr.co.mlec.diary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.mlec.spot.SpotService;
import kr.co.mlec.tag.TagService;
import kr.co.mlec.util.JsonUtil;
import kr.co.mlec.util.ListUtil;
import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.MemberVO;
import kr.co.mlec.vo.SpotVO;
import kr.co.mlec.vo.TagVO;

@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	@Autowired
	private TagService tagService;
	@Autowired
	private SpotService spotService;

	@GetMapping("/diary/{no}")
	public ModelAndView SearchDiary(@PathVariable int no) throws Exception {
		DiaryVO diary = diaryService.selectDiary(no);
//		List<SpotVO> spot_list = spotService.selectDiarySpot(no);
		ModelAndView mav = new ModelAndView("diary/detail_diary_page");
		String content = diary.getContent();
		String map_content = diary.getMap_content();

		mav.addObject("diary", diary);
		mav.addObject("content", content);
		mav.addObject("map_content", map_content);

		return mav;
	}

	@PostMapping("/diary")
	@ResponseBody
	public int addDiary(@RequestBody Map<String, Object> data, HttpSession session) throws Exception {
		DiaryVO diary = new DiaryVO();
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		String writer;
		if (member != null) {
			writer = member.getEmail();
		} else {
			writer = "Test";
		}
		Map<String, Object> post_data = (Map<String, Object>) data.get("post_data");
		List<String> tag_list = (List<String>) post_data.get("tag");

		List<List<Object>> date_data = (List<List<Object>>) data.get("date_data");
		List<String> content = new ArrayList<String>();

		List<List<Object>> map_data = (List<List<Object>>) data.get("map_data");
		List<String> content_map = new ArrayList<String>();

		for (int i = 0; i < date_data.size(); i++) { // 일차
			System.out.println(date_data.get(i));
			Map<String, Object> date_content = (Map<String, Object>) date_data.get(i);
			String date_content_str = JsonUtil.getJsonStringFromMap(date_content).toJSONString();

			content.add(date_content_str);
		}

		Gson gson = new Gson();

		diary.setTag(ListUtil.toString(tag_list));

		diary.setWriter(writer);
		diary.setContent(content.toString());
		diary.setMap_content(gson.toJson(map_data));
		diary.setTitle((String) post_data.get("title"));
		diary.setCover_image((String) post_data.get("cover_image"));
		diary.setIs_share((String) post_data.get("lock"));
		diary.setStart_date((String) post_data.get("start_date"));
		diary.setEnd_date((String) post_data.get("end_date"));

		System.out.println(diary);

		diaryService.insertDiary(diary);

		int insert_diary_no = diary.getNo();

		for (int i = 0; i < tag_list.size(); i++) { // 태그 등록
			TagVO tag = new TagVO();
			tag.setTag_name(tag_list.get(i));
			tag.setDiary_no(insert_diary_no);
			tagService.insertTag(tag);
		}

		for (int m = 0; m < map_data.size(); m++) { // 일차
			List<Object> map_contents = (List<Object>) map_data.get(m);
			for (int n = 0; n < map_contents.size(); n++) {
				Map<String, Object> map_content = (Map<String, Object>) map_contents.get(n);
				SpotVO spot = new SpotVO();
				spot.setDiary_no(insert_diary_no);
				spot.setAddr((String) map_content.get("name"));
				spot.setSpot_name((String) map_content.get("name"));
				spot.setCountry("JP");
				// spot.setCountry((String)map_content.get("country"));
				spot.setLat((Double) map_content.get("lat"));
				spot.setLng((Double) map_content.get("lng"));
				spot.setDate_cnt(m);

				System.out.println(spot);
				spotService.insertSpot(spot);
			}

		}

		return insert_diary_no;
//		return 1;
	}

	@GetMapping("/diary")
	public ModelAndView DiaryList() {
		// 최신글 5개
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("start", 1);
		parameters.put("end", 5);
		
		List<DiaryVO> diaryList = diaryService.selectFiveDiary(parameters);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("diary/diaryList");
		mav.addObject("diaryList", diaryList);
		System.out.println(diaryList);

		Gson gson = new Gson();
		mav.addObject("diaryListJ", gson.toJson(diaryList) );
		return mav;
	}

	@ResponseBody
	@GetMapping("/diary/list")
	public List<DiaryVO> DiaryListPlus(HttpServletRequest request) {
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		// 최신글 5개
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("start", start);
		parameters.put("end", end);
		List<DiaryVO> diary = diaryService.selectFiveDiary(parameters);
		System.out.println(diary);

		return diary;
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
