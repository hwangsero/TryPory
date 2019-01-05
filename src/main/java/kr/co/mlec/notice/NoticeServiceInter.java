package kr.co.mlec.notice;

import java.util.List;

import kr.co.mlec.vo.NoticeVO;


public interface NoticeServiceInter {
	
	public List<NoticeVO> selectAllNotice(int pageNo);
	public void insertNotice(NoticeVO noticeVO);
	public int selectCountNotice();
	public List<NoticeVO> selectSearchNotice(String word, String type, int pageNo);
	public void deleteNotice(int noticeNo);
	public void updateNotice(NoticeVO noticeVO);
	public NoticeVO selectByNoNotice(int noticeNo);
	public int selectSearchCountNotice(String word, String type);
	public void updateViewCnt(int noticeNo);
}
