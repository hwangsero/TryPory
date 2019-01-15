package kr.co.mlec.scrap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.vo.ScrapVO;

@Repository
public class ScrapDAO implements ScrapDAOInter{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void scrapCntUp(ScrapVO scrapVO) {
		sqlSession.insert("kr.co.mlec.scrap.add_scrap", scrapVO);
	}

	@Override
	public void scrapCntDown(ScrapVO scrapVO) {
		sqlSession.delete("kr.co.mlec.scrap.remove_like", scrapVO);
	}

}
