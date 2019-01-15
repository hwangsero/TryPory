package kr.co.mlec.main;

import java.net.URI;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.mlec.diary.DiaryService;
import kr.co.mlec.vo.DiaryVO;

@Controller
public class MainController {
	
	@Autowired
	private DiaryService diaryService;
	
	@GetMapping("/main")
	public ModelAndView index() throws ParseException {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> mainMap = new HashMap<>();
		mainMap.put("start", 1);
		mainMap.put("end", 3);
		
		List<DiaryVO> allList = new ArrayList<>();
		List<String> bestTag = new ArrayList<>();
		allList = diaryService.selectFiveDiary(mainMap);
		bestTag = diaryService.selectBestTag();
		
		mav.addObject("allList", allList);
		mav.addObject("bestTag",bestTag);
		mav.setViewName("main/main");
		
		//---------------------인기태그 이미지 가져오기 -----------------------//
		List<String> imageurls = new ArrayList<>();
		for(String tag : bestTag) {
			System.out.println(tag);
			RestTemplate restTemplate = new RestTemplate();

			HttpHeaders headers = new HttpHeaders();
			Charset utf8 = Charset.forName("UTF-8");
			MediaType mediaType = new MediaType("application", "json", utf8);
			headers.setContentType(mediaType);

			headers.set("X-Naver-Client-Id", "bMU3QPxj_f1yHg4oh2qe");
			headers.set("X-Naver-Client-Secret", "3Zr16MRhlw");

			HttpEntity entity = new HttpEntity("parameters", headers);
			String url = "https://openapi.naver.com/v1/search/image?query=" + tag + "&display=1&start=1&sort=sim";
			UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(url);
			URI uri = builder.build().encode().toUri();

			ResponseEntity response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(response.getBody().toString());

			JSONArray jsonArray = (JSONArray)jsonObject.get("items");
			JSONObject result = (JSONObject) jsonArray.get(0);
			System.out.println(result.get("thumbnail"));
			
			if(result != null)
			imageurls.add(result.get("thumbnail").toString());
			else
			imageurls.add("${pageContext.request.contextPath}/assets/img/heart-off.png");
		
			//---------------------인기다이어리 가져오기 -----------------------//
			
		}
		mav.addObject("imageurls", imageurls);
		
		List<DiaryVO> bestDiary = diaryService.selectBestDiary();
		mav.addObject("bestDiary",bestDiary);
		
		for(DiaryVO d : bestDiary) {
			System.out.println(d.getCover_image());
		}
		
			
		return mav;
	}

	public MainController(DiaryService diaryService) {
		super();
		this.diaryService = diaryService;
	}
	
	

}
