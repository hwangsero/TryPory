package kr.co.mlec.mypage;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.login.MemberVO;
import kr.co.mlec.notice.NoticeVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/mypage")
	public String myPageForm(HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		System.out.println(userVO);
		return "mypage/mypage";
	}
	
	
	
/*	@PostMapping("/mypage")
	public String updateMember(HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		System.out.println(userVO);
		mypageService.updateMember(userVO);
		
		return "mypage/mypage_update";
		
	}
*/
	
	@PostMapping("/mypage")
	public String updateMember(MemberVO userVO, HttpSession session) {
		System.out.println("userVO : " + userVO);
//		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		mypageService.updateMember(userVO);
		MemberVO member = loginService.loginMember(userVO);
		session.setAttribute("userVO", member);
		System.out.println("update-userVO:" + userVO);
		
		
		return "mypage/mypage_update";
		
	}
	
	
	

}
	