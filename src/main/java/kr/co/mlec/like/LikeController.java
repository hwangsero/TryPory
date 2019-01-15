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
		likeService.upView_cnt(likeVO);
		likeService.diaryLikeUp(likeVO.getDiaryNo());
		return 1;
	}
	
	@ResponseBody
	@GetMapping("/likeDown")
	public int likeCntDown(LikeVO likeVO) {
		likeService.downView_cnt(likeVO);
		likeService.diaryLikeDown(likeVO.getDiaryNo());
		return 1;
	}
}
