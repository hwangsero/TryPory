package kr.co.mlec.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.diary.DiaryDAO;
import kr.co.mlec.vo.LikeVO;

@Service
public class LikeService implements LikeServiceInter{

	@Autowired
	private LikeDAO likeDAO;
	
	@Override
	public void upView_cnt(LikeVO likeVO) {
		likeDAO.upView_cnt(likeVO);
	}

	@Override
	public void downView_cnt(LikeVO likeVO) {
		likeDAO.downView_cnt(likeVO);
	}
}
