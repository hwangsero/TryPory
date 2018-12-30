package kr.co.mlec.mypage;

import java.util.List;

import kr.co.mlec.notice.NoticeVO;

public interface MyPageServiceInter {
	public List<NoticeVO> selectAllNotice(int pageNo);
	public void insertNotice(NoticeVO noticeVO);
}
