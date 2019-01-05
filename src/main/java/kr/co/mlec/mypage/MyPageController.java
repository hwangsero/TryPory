package kr.co.mlec.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.MemberVO;

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
	