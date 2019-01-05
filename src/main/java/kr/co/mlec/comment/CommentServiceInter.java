package kr.co.mlec.comment;

import java.util.List;

import kr.co.mlec.vo.CommentVO;

public interface CommentServiceInter {
	public void insertComment(CommentVO commentVO);
	public List<CommentVO> selectAllComment(int diaryNo);
	public void deleteComment(int replyNo);

}
