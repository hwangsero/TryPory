package kr.co.mlec.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.vo.CommentVO;

@RestController
public class CommentController {
	
	@Autowired
	CommentService commentService;

	@PostMapping("/reply")
	public void insertComment(CommentVO commentVO) {
		commentVO.setWriter("writer");
		commentService.insertComment(commentVO);
	}
	
	@GetMapping("/reply/{diaryNo}")
	public List<CommentVO> selectAllComment(@PathVariable("diaryNo") int diaryNo, Model model) {
		
		List<CommentVO> comment = commentService.selectAllComment(diaryNo);
		return comment;
	}
	
	@DeleteMapping("/reply/{replyNo}")
	public void deleteComment(@PathVariable("replyNo") int replyNo) {
		commentService.deleteComment(replyNo);
	}
	
}
