package kr.co.mlec.notice;

import java.util.List;

public interface NoticeDAOInter {
	
	public List<NoticeVO> selectAllNotice(int pageNo); 

}
