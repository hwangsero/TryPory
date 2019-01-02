package kr.co.mlec.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.login.MemberVO;
import kr.co.mlec.notice.NoticeVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	@GetMapping("/mypage")
	public String noticeWriteForm(HttpSession session) {
		return "mypage/mypage";
	}

}
	