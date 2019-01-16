package kr.co.mlec.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mlec.vo.CommentVO;
import kr.co.mlec.vo.MemberVO;

@RestController
public class CommentController {
	
	@Autowired
	CommentService commentService;

	/**
	 * 댓글 등록
	 * @param commentVO
	 */
	
	@PostMapping("/reply")
	public void insertComment(CommentVO commentVO, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("userVO");
		commentVO.setWriter(user.getName());
		commentVO.setEmail(user.getEmail());
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
		System.out.println("삭제 컨트롤러");
		commentService.deleteComment(replyNo);
	}
	
	@ResponseBody
	@RequestMapping("/reply/myReply/{pageNo}")
	public Map<String, Object> selectMyComment(@RequestBody CommentVO comment, @PathVariable("pageNo") int pageNo, Model model) {
		String email = comment.getEmail();
		int commentCnt = commentService.selectCountComment(email);
		CommentPagination pagination = new CommentPagination(commentCnt, pageNo);
		int start = pagination.getStartPage();
		int end = pagination.getEndPage();
		System.out.println(commentCnt);
		List<CommentVO> commentList = commentService.selectMyComment(email, pageNo);
		
		Map<String, Object> commentMap = new HashMap<>();
		commentMap.put("commentCnt", commentCnt);
		commentMap.put("commentList", commentList);
		commentMap.put("start", start);
		commentMap.put("end", end);
		commentMap.put("pagination", pagination);
		commentMap.put("pageNo", pageNo);
		
		model.addAttribute("commentCnt", commentCnt);
		model.addAttribute("commentList", commentList);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("pagination", pagination);
		model.addAttribute("pageNo", pageNo);
		return commentMap;
	}
	

	
}
