package kr.co.mlec.notice;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	
	private NoticeDAO noticeDAO;
	
	public List<NoticeVO> selectAllNotice(int pageNo) {
		return noticeDAO.selectAllNotice(pageNo);
	}

}
