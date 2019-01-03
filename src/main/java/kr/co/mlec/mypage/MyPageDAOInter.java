package kr.co.mlec.mypage;

import java.util.List;
import java.util.Map;

import vo.NoticeVO;

public interface MyPageDAOInter {

	public List<NoticeVO> selectAllNotice(Map<String, Integer> pageMap); 
	public void insertNotice(NoticeVO noticeVO);
}
