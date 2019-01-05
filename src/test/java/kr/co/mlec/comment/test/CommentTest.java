package kr.co.mlec.comment.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.comment.CommentService;
import kr.co.mlec.vo.CommentVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/**/*.xml"})
public class CommentTest {
	
	@Autowired
	CommentService commentService;
	
	@Ignore
	@Test
	public void 댓글등록테스트() {
		CommentVO commentVO = new CommentVO();
		commentVO.setNo(1);
		commentVO.setDiaryNo(1);
		commentVO.setContent("content");
		commentVO.setWriter("writer");
		commentService.insertComment(commentVO);
	}

	@Ignore
	@Test
	public void 댓글조회테스트() {
	List<CommentVO> comment = commentService.selectAllComment(1);
	for(CommentVO data : comment) {
		System.out.println(data);
	}
}
	
	@Test
	public void 댓글삭제테스트() {
		commentService.deleteComment(3);
	}
	
	
	
	
	
	
}
