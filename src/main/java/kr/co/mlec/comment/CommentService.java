package kr.co.mlec.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.vo.CommentVO;

@Service
public class CommentService implements CommentServiceInter{
	
	@Autowired
	CommentDAO commentDAO;

	@Override
	public void insertComment(CommentVO commentVO) {
		commentDAO.insertComment(commentVO);
	}

	@Override
	public List<CommentVO> selectAllComment(int diaryNo) {
		return commentDAO.selectAllComment(diaryNo);
	}

	@Override
	public void deleteComment(int replyNo) {
		commentDAO.deleteComment(replyNo);
		
	}

	@Override
	public List<CommentVO> selectMyComment(String email, int pageNo) {
		Map<String, Object> commentPageMap = new HashMap<>();
		int start = (pageNo - 1) * 10 + 1;
		int end = pageNo * 10;
		commentPageMap.put("start", start);
		System.out.println("start : " + start);
		commentPageMap.put("end", end);
		System.out.println("end : " + end );
		commentPageMap.put("email", email);
		return commentDAO.selectMyComment(commentPageMap);
	}

	@Override
	public int selectCountComment(String email) {
		return commentDAO.selectCountComment(email);
	}

}
