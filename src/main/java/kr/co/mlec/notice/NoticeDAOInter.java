package kr.co.mlec.notice;

import java.util.List;
import java.util.Map;

public interface NoticeDAOInter {
	
	public List<NoticeVO> selectAllNotice(Map<String, Integer> pageMap); 
	public void insertNotice(NoticeVO noticeVO);
}
