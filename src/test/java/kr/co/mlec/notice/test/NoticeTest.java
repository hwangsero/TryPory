package kr.co.mlec.notice.test;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.notice.NoticeDAO;
import kr.co.mlec.notice.NoticeService;
import kr.co.mlec.notice.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/**/*.xml"})
public class NoticeTest {
	
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private NoticeService noticeService;
	
	@Ignore
	@Test
	public void 게시판등록테스트() throws Exception{
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setNo(1);
		noticeVO.setTitle("2");
		noticeVO.setWriter("3");
		noticeVO.setContent("4");
		
		noticeDAO.insertNotice(noticeVO);
	}
	
	@Test
	public void 게시판검색리스트테스트() throws Exception {
		String word = "1";
		String type = "제목";
		List<NoticeVO> noticeList = noticeService.selectSearchNotice(word, type, 1);
		for(NoticeVO notice : noticeList) {
			System.out.println(notice);
		}
	}
	
	@Ignore
	@Test
	public void 게시판전체리스트테스트() throws Exception {
		NoticeVO notice = new NoticeVO();
		notice.setNo(99);
		notice.setTitle("제목");
		List<NoticeVO> noticeList = noticeService.selectAllNotice(1);
	}
}
