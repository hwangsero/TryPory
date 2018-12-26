package kr.co.mlec.login;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginContoller {

	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "login/loginForm";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberVO member, Model model) {
		
		ModelAndView mav = new ModelAndView();
		MemberVO userVO = loginService.loginMember(member);
		
		if(userVO == null) {
			String loginMsg = "로그인에 실패했습니다";
			model.addAttribute(loginMsg);
		} else {
			mav.addObject("userVO", userVO);
			System.out.println(userVO);
		}
		mav.setViewName("redirect:/index.jsp");
		
		return mav;
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "join/joinForm";
	}
	
	@PostMapping("/join")
	public String join(MemberVO member) {
		loginService.joinMember(member);
		return "redirect:/index.jsp";
		
	}
}
