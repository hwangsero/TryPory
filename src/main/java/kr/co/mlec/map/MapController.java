package kr.co.mlec.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {

	@Autowired
	private MapService mapService;
	
	@RequestMapping("/diary/map")
	public ModelAndView mapAllSpot() {
		ModelAndView mav = new ModelAndView();
		List<Map<String,Double>> mapList = new ArrayList<>();
		Map<String, Double> map = new HashMap<>();
		map.put("lat", 37.601204);
		map.put("lng", 127.132373);
		Map<String, Double> map2 = new HashMap<>();
		map2.put("lat", 37.601202);
		map2.put("lng", 127.132391);
		mapList.add(map);
		mapList.add(map2);
		mav.addObject("mapList",mapList);
		mav.setViewName("diary/map");
		
		return mav;
	}
}
