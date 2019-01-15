package kr.co.mlec.spot;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mlec.vo.SpotVO;

@Controller
public class SpotDAO implements SpotDAOInter{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSpot(SpotVO spot) {
		return sqlSession.insert("kr.co.mlec.spot.insertSpot", spot);
	}

	@Override
	public List<SpotVO> selectDiarySpot(int diary_no) {
		return sqlSession.selectList("kr.co.mlec.spot.selectDiarySpot", diary_no);
	}

	@Override
	public List<SpotVO> selectUserSpot(int user_no) {
		return sqlSession.selectList("kr.co.mlec.spot.selectUserSpot", user_no);
	}

}
