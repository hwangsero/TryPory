package kr.co.mlec.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vo.MemberVO;
import vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice/{pageNo}")
	public ModelAndView noticeList(@PathVariable("pageNo") int pageNo) {
		ModelAndView mav = new ModelAndView();
		
		int noticeCnt = noticeService.selectCountNotice();
		Pagination pagination = new Pagination(noticeCnt, pageNo);
		int start = pagination.getStartPage();
		int end = pagination.getEndPage();

		List<NoticeVO> noticeVO =  noticeService.selectAllNotice(pageNo);
		
		System.out.println(start);
		System.out.println(end);
		System.out.println(pagination);
		System.out.println("--------------------------");
		Map<String, Object> noticeMap = new HashMap<>();
		noticeMap.put("noticeCnt", noticeCnt);
		noticeMap.put("noticeVO",noticeVO);
		noticeMap.put("start", start);
		noticeMap.put("end", end);
		noticeMap.put("pagination", pagination);
		noticeMap.put("pageNo", pageNo);
		mav.addAllObjects(noticeMap);
		
		mav.setViewName("notice/noticeList");
		
		
		return mav;
	}
	
	@GetMapping("/notice/write")
	public ModelAndView noticeWriteForm(HttpSession session) {
		//세션에서 작성자 아이디가져오기
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		NoticeVO noticeVO = new NoticeVO();
//		noticeVO.setWriter(userVO.getName());
		noticeVO.setWriter("작성자");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeVO", noticeVO);
		mav.setViewName("notice/notice-write");
		return mav;
	}
	
	@PostMapping("/notice/write")
	public String noticeWriter(NoticeVO noticeVO) {
		
		noticeService.insertNotice(noticeVO);
		
		return "redirect:/notice/1";
	}
	
	@GetMapping("/notice/detail/{noticeNo}/{count}")
	public ModelAndView noticeDitail(@PathVariable("noticeNo") int noticeNo, @PathVariable("count") int count) {
		if(count==1)
		noticeService.updateViewCnt(noticeNo);
		
		NoticeVO notice = noticeService.selectByNoNotice(noticeNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",notice);
		mav.setViewName("notice/notice-detail");
		
		return mav;
		
	}
	
	@ResponseBody
	@DeleteMapping("/notice/{noticeNo}/")
	public String noticeDelete(@PathVariable("noticeNo") int noticeNo) {
		noticeService.deleteNotice(noticeNo);
		String msg = "게시물이 삭제되었습니다.";
		return msg;
	}
	
	@GetMapping("/notice/update/{noticeNo}")
	public ModelAndView noticeUpdateForm(@PathVariable("noticeNo") int noticeNo) {
		NoticeVO notice = noticeService.selectByNoNotice(noticeNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",notice);
		mav.setViewName("notice/notice-update");
		
		return mav;
	}
	
	@ResponseBody
	@PutMapping("/notice/update")
	public String noticeUpdate(@RequestBody NoticeVO notice) {
		 
		NoticeVO noticeVO = noticeService.selectByNoNotice(notice.getNo());
		noticeVO.setTitle(notice.getTitle());
		noticeVO.setContent(notice.getContent());

//		
		System.out.println(noticeVO);
		noticeService.updateNotice(noticeVO);
		
		
		return "게시물이 수정되었습니다.";  
	}
	

	
	@RequestMapping("/notice/search/{pageNo}/{type}/{word}")
	public ModelAndView noticeSearch(@PathVariable("pageNo") int pageNo, @PathVariable("type") String type, @PathVariable("word") String word) {
		ModelAndView mav = new ModelAndView();
		
		int noticeCnt = noticeService.selectSearchCountNotice(word, type);
		Pagination pagination = new Pagination(noticeCnt, pageNo);
		int start = pagination.getStartPage();
		int end = pagination.getEndPage();

		List<NoticeVO> noticeVO = noticeService.selectSearchNotice(word, type, pageNo);	
		
		System.out.println(start);
		System.out.println(end);
		System.out.println(pagination);
		System.out.println("--------------------------");
		Map<String, Object> noticeMap = new HashMap<>();
		noticeMap.put("noticeCnt", noticeCnt);
		noticeMap.put("noticeVO",noticeVO);
		noticeMap.put("start", start);
		noticeMap.put("end", end);
		noticeMap.put("pagination", pagination);
		noticeMap.put("pageNo", pageNo);
		noticeMap.put("type", type);
		noticeMap.put("word", word);
		mav.addAllObjects(noticeMap);
		System.out.println(noticeCnt);
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
}
	


