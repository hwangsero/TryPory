package kr.co.mlec.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.vo.CommentVO;

@Repository
public class CommentDAO implements CommentDAOInter{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insertComment(CommentVO commentVO) {
		System.out.println(commentVO);
		sqlSession.insert("kr.co.mlec.comment.insertComment", commentVO);
	}

	@Override
	public List<CommentVO> selectAllComment(int diaryNo) {
		List<CommentVO> comment =  sqlSession.selectList("kr.co.mlec.comment.selectAllComment", diaryNo);
		for(CommentVO data : comment) {
			System.out.println("dao 데이터 : " + data);
		}
		return comment;
	}

	@Override
	public void deleteComment(int replyNo) {
		sqlSession.delete("kr.co.mlec.comment.deleteComment", replyNo);
		
	}


}
