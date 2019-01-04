package kr.co.mlec.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public Map<String,String> login(MemberVO member, HttpSession session) {
		System.out.println("로그인");
		MemberVO userVO = loginService.loginMember(member);
		String loginMsg;
		Map<String, String> loginMap = new HashMap<String, String>();
		if (userVO == null) {
			loginMsg = "로그인에 실패했습니다";
			loginMap.put("loginMsg", loginMsg);
			loginMap.put("result", "false");
		} else {
			System.out.println(userVO);
			loginMsg = "로그인에 성공했습니다";
			loginMap.put("loginMsg", loginMsg);
			loginMap.put("result", "true");
			session.setAttribute("userVO", userVO);
		}
		return loginMap;
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

	@ResponseBody
	@RequestMapping("/join/check")
	public String duplCheck(@RequestBody MemberVO vo) {
		MemberVO member = loginService.duplCheck(vo.getEmail());
		String check = "";
		if (member == null)
			check = "true";
		else
			check = "false";
		return check;

	}
	
	@GetMapping("/login/kko/{name}")
	public String kkoLogin(@PathVariable("name") String name, HttpSession session) {
		System.out.println(name);
		
		MemberVO userVO = new MemberVO();
		userVO.setName(name);
		session.setAttribute("userVO", userVO);
		return "redirect:/";
	}

}
