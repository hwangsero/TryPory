package kr.co.mlec.notice;

import java.util.List;

public interface NoticeServiceInter {
	
	public List<NoticeVO> selectAllNotice(int pageNo);
	public void insertNotice(NoticeVO noticeVO);

}
