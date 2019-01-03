package kr.co.mlec.mypage;

import java.util.List;

import vo.NoticeVO;

public interface MyPageServiceInter {
	public List<NoticeVO> selectAllNotice(int pageNo);
	public void insertNotice(NoticeVO noticeVO);
}
