package kr.co.mlec.like;

import kr.co.mlec.vo.LikeVO;

public interface LikeDAOInter {

	void upView_cnt(LikeVO likeVO);
	void downView_cnt(LikeVO likeVO);
	void diaryLikeUp(int diaryNo);
	void diaryLikeDown(int diaryNo);

}
