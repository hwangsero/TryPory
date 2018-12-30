package kr.co.mlec.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.login.MemberVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	private int prevNo = 0;
	private int nextNo = 3;
	private int startNo = 1;
	private int endNo = 2;
	private int pageCnt;
	
	@RequestMapping("/notice/{pageNo}")
	public ModelAndView noticeList(@PathVariable("pageNo") int pageNo,Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute(pageNo);
		
		int noticeCnt = noticeService.selectCountNotice();
		
		if(noticeCnt % 10 == 0)
			pageCnt = noticeCnt / 10;
		else
			pageCnt = noticeCnt / 10 + 1;
		
		
		
		List<NoticeVO> noticeVO =  noticeService.selectAllNotice(pageNo);
		
		
		System.out.println("--------------------------");
		Map<String, Object> noticeMap = new HashMap<>();
		noticeMap.put("pageCnt", pageCnt);
		noticeMap.put("noticeCnt", noticeCnt);
		noticeMap.put("noticeVO", noticeVO);
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
	
	@GetMapping("/notice/detail/{noticeNo}")
	public ModelAndView noticeDitail(@PathVariable("noticeNo") int noticeNo) {
		
		NoticeVO notice = noticeService.selectByNoNotice(noticeNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("notice",notice);
		mav.setViewName("notice/notice-detail");
		
		return mav;
		
	}
	@ResponseBody
	@DeleteMapping("/notice/{noticeNo}")
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
	
	@PutMapping("/notice/update")
	public String noticeUpdate(NoticeVO notice) {
		noticeService.updateNotice(notice);
		
		return "redirect:/notice/detail/" + notice.getNo();
	}
	
}
	
/*	@RequestMapping("/notice/search")
	public ModelAndView noticeSearch(HttpServletRequest request) {
		
		String Word = request.getParameter("searchWord");
		String Type = request.getParameter("searchType");
		
		List<NoticeVO> noticeList = noticeService.selectSearchNotice(Word, Type);	
		
	}*/
	


