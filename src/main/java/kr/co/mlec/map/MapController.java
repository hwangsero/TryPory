package kr.co.mlec.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.mlec.spot.SpotService;
import kr.co.mlec.vo.MemberVO;

@Controller
public class MapController {

	@Autowired
	private MapService mapService;

	@Autowired
	private SpotService spotService;

	@RequestMapping("/diary/map")
	public ModelAndView mapAllSpot() {
		ModelAndView mav = new ModelAndView();
		List<Map<String, Double>> mapList = new ArrayList<>();
		Map<String, Double> map = new HashMap<>();
		map.put("lat", 37.601204);
		map.put("lng", 127.132373);
		Map<String, Double> map2 = new HashMap<>();
		map2.put("lat", 37.601202);
		map2.put("lng", 127.132391);
		mapList.add(map);
		mapList.add(map2);
		mav.addObject("mapList", mapList);
		mav.setViewName("diary/map");

		return mav;
	}

	@GetMapping("/diary/myMap")
	public ModelAndView MyMap(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("diary/my_map");
		
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		Gson gson = new Gson();
		String jsonList = gson.toJson(spotService.selectUserSpot(member.getNo()));
		mav.addObject("spotList",  jsonList);
		return mav;
	}
}
