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

	/**
	 * 댓글 등록
	 * @param commentVO
	 */
	@PostMapping("/reply")
	public void insertComment(CommentVO commentVO) {
		commentVO.setWriter("writer");
		commentService.insertComment(commentVO);
	}
	
	/**
	 * 게시글의 댓글 조회
	 * @param diaryNo
	 * @param model
	 * @return
	 */
	@GetMapping("/reply/{diaryNo}")
	public List<CommentVO> selectAllComment(@PathVariable("diaryNo") int diaryNo, Model model) {
		
		List<CommentVO> comment = commentService.selectAllComment(diaryNo);
		return comment;
	}
	
	/**
	 * 댓글 삭제
	 * @param replyNo
	 */
	@DeleteMapping("/reply/{replyNo}")
	public void deleteComment(@PathVariable("replyNo") int replyNo) {
		commentService.deleteComment(replyNo);
	}
	
}
