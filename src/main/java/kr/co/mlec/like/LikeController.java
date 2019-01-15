package kr.co.mlec.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mlec.vo.LikeVO;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@ResponseBody
	@RequestMapping("/likeUp")
	public int likeCntUp(LikeVO likeVO) {
		System.out.println("컨트롤러 입장");
		System.out.println(likeVO);
		likeService.upView_cnt(likeVO);
		System.out.println("컨트롤러 퇴장");
		return 1;
	}
	
	@ResponseBody
	@GetMapping("/likeDown")
	public int likeCntDown(LikeVO likeVO) {
		System.out.println(likeVO);
		System.out.println("다운 컨트롤러");
		likeService.downView_cnt(likeVO);
		return 1;
	}
}
