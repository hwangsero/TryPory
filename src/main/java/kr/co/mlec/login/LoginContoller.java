package kr.co.mlec.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginContoller {

	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "login/loginForm";
	}
	@ResponseBody
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("userVO");
		
		return "로그아웃 되었습니다";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session) {
		System.out.println("로그인");
		MemberVO userVO = loginService.loginMember(member);
		String loginMsg;
		if(userVO == null) {
			loginMsg = "로그인에 실패했습니다";
		} else {
			System.out.println(userVO);
			loginMsg = "로그인에 성공했습니다";
			session.setAttribute("userVO", userVO);
		}
		return loginMsg;
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "join/joinForm";
	}
	
	@PostMapping("/join")
	public String join(MemberVO member, HttpSession session) {
		loginService.joinMember(member);
		System.out.println(member);
		session.setAttribute("userVO", member);
		
		return "redirect:/index.jsp";
		
	}
}
