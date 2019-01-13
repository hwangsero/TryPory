package kr.co.mlec.like;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mlec.diary.DiaryDAOInter;

@Controller
public class LikeDAO implements LikeDAOInter {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public void upView_cnt(int no) {
		sqlSession.update("kr.co.mlec.diary.add_like", no);
	}
}
