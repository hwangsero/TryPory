package kr.co.mlec.comment;

import java.util.List;

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

}
