package kr.co.mlec.scrap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mlec.vo.ScrapVO;

@Controller
public class ScrapController {

	@Autowired
	ScrapService scrapService;
	
	@ResponseBody
	@GetMapping("/scrapUp")
	public int ScrapCntUp(ScrapVO scrapVO) {
		
		scrapService.scrapCntUp(scrapVO);
		return 1;
	}
	
	@ResponseBody
	@GetMapping("/scrapDown")
	public int ScrapCntDown(ScrapVO scrapVO) {
		
		scrapService.scrapCntDown(scrapVO);
		return 1;
	}
}
