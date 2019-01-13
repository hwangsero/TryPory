package kr.co.mlec.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.diary.DiaryDAO;

@Service
public class LikeService implements LikeServiceInter{

	@Autowired
	private LikeDAO likeDAO;
	
	@Override
	public void upView_cnt(int no) {
		likeDAO.upView_cnt(no);
	}
}
