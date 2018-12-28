package kr.co.mlec.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice/{pageNo}")
	public ModelAndView noticeList(@PathVariable("pageNo") int pageNo,Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute(pageNo);
		List<NoticeVO> notice =  noticeService.selectAllNotice(pageNo);
		
		mav.addObject("notice", notice);
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
}
