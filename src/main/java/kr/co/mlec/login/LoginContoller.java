package kr.co.mlec.login;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.mlec.apiLogin.NaverLogin;
import kr.co.mlec.mail.MailService;
import kr.co.mlec.vo.MemberVO;


@Controller
public class LoginContoller {

	@Autowired
	private LoginService loginService;
	@Autowired
	private MailService mailService;
	@Autowired
	private NaverLogin naverLogin;
	@Autowired
    private FacebookConnectionFactory facebookConnectionFactory;
	
	@Resource(name="facebook")
    private OAuth2Parameters facebookOAuth2Parameters;
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Resource(name="google")
    private OAuth2Parameters googleOAuth2Parameters;

	@GetMapping("/login")
	public String loginForm(Model model, HttpSession session) {
		OAuth2Operations facebook = facebookConnectionFactory.getOAuthOperations();
        String facebook_url = facebook.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, facebookOAuth2Parameters);
        model.addAttribute("facebook_url", facebook_url);
   
        OAuth2Operations google = googleConnectionFactory.getOAuthOperations();
        String google_url = google.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        model.addAttribute("google_url", google_url);
        
        String naver_url = naverLogin.getAuthorizationUrl(session);
        model.addAttribute("naver_url", naver_url);

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

	@Transactional
	@PostMapping("/join")
	public String join(MemberVO member, HttpSession session) throws Exception {
		member.setEmail(member.getEmail() + '@' + member.getEmail_domain());
		member.setUser_type("U");
		member.setIs_auth("0");
		int cnt = loginService.joinMember(member);
		
		System.out.println(member);

		if( cnt == 1 ) { // 회원가입 성공
			session.setAttribute("userVO", member); // 회원가입시 바로 로그인
			mailService.sendEmail(member);
			return "redirect:/emailConfirm";
		} else {
			return "join/joinForm";
		}
	}

	@ResponseBody
	@RequestMapping("/join/check")
	public String duplCheck(@RequestBody MemberVO vo) {
		Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("email", vo.getEmail());
        parameters.put("user_type", "U");
		MemberVO member = loginService.duplCheck(parameters);
		String check = "";
		if (member == null)
			check = "true";
		else
			check = "false";
		return check;

	}
	
	@GetMapping("/findPassword")
	public String findPW() {
		return "findPassword/findPassword";
	}
	
	@ResponseBody
	@PostMapping("/emailCheck")
	public boolean emailCheck(MemberVO member) {
		System.out.println(member);
		boolean emailCheck = loginService.emailCheck(member);

		return emailCheck;
	}
	
	@PostMapping("/changePassword")
	public String changePW(MemberVO member) {
		
		loginService.changePassword(member);
		return "redirect:/";
	}
	
	

}
