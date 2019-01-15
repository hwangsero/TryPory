package kr.co.mlec.scrap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.vo.ScrapVO;

@Repository
public class ScrapService implements ScrapServiceInter{

	@Autowired
	private ScrapDAO scrapDAO;
	
	@Override
	public void scrapCntUp(ScrapVO scrapVO) {
		scrapDAO.scrapCntUp(scrapVO);
	}

	@Override
	public void scrapCntDown(ScrapVO scrapVO) {
		scrapDAO.scrapCntDown(scrapVO);
	}

}
