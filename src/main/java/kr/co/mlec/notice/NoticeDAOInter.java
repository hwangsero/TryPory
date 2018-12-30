package kr.co.mlec.notice;

import java.util.List;
import java.util.Map;

public interface NoticeDAOInter {
	
	public List<NoticeVO> selectAllNotice(Map<String, Integer> pageMap); 
	public void insertNotice(NoticeVO noticeVO);
	public int selectCountNotice();
	public List<NoticeVO> selectSearchNotice(Map searchMap);
	public void deleteNotice(int noticeNo);
	public void updateNotice(NoticeVO notice);
	public NoticeVO selectByNoNotice(int noticeNo);
}
