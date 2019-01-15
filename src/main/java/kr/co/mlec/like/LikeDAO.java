package kr.co.mlec.like;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mlec.diary.DiaryDAOInter;
import kr.co.mlec.vo.LikeVO;

@Controller
public class LikeDAO implements LikeDAOInter {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void upView_cnt(LikeVO likeVO) {
		sqlSession.update("kr.co.mlec.like.add_like", likeVO);
	}

	@Override
	public void downView_cnt(LikeVO likeVO) {
		sqlSession.delete("kr.co.mlec.like.remove_like", likeVO);
	}
}
