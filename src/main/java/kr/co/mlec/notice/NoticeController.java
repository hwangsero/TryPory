package kr.co.mlec.notice;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	private NoticeService noticeService;
	
	@RequestMapping("/notice/{pageNo}")
	public ModelAndView noticeList(@PathVariable("pageNo") int pageNo) {
		
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> notice =  noticeService.selectAllNotice(pageNo);
		
		mav.addObject("notice", notice);
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
}
