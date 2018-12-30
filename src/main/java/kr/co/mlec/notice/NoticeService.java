package kr.co.mlec.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeServiceInter {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public List<NoticeVO> selectAllNotice(int pageNo) {
		Map<String, Integer> pageMap = new HashMap<>();
		int start = (pageNo - 1) * 10 + 1;
		int end = pageNo * 10;
		pageMap.put("start", start);
		pageMap.put("end", end);
		return noticeDAO.selectAllNotice(pageMap);
	}
	
	public void insertNotice(NoticeVO noticeVO) {
		noticeDAO.insertNotice(noticeVO);
	}

	@Override
	public int selectCountNotice() {
		return noticeDAO.selectCountNotice();
	}

	@Override
	public List<NoticeVO> selectSearchNotice(String word, String type) {
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("word", word);
		searchMap.put("type", type);
		
		return noticeDAO.selectSearchNotice(searchMap);
	}


	@Override
	public void deleteNotice(int noticeNo) {
		noticeDAO.deleteNotice(noticeNo);
		
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) {
		noticeDAO.updateNotice(noticeVO);
		
	}

	@Override
	public NoticeVO selectByNoNotice(int noticeNo) {
		return noticeDAO.selectByNoNotice(noticeNo);
	}

}
