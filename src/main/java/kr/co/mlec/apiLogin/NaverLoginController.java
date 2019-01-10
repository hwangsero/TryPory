package kr.co.mlec.apiLogin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.MemberVO;

@Controller
public class NaverLoginController {
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private NaverLogin naverLogin;

	@GetMapping("/naverLogin")
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws Exception {
        OAuth2AccessToken oauthToken = naverLogin.getAccessToken(session, code, state);
		String apiResult = naverLogin.getUserProfile(oauthToken);
	
		JSONParser parser = new JSONParser();
		JSONObject jsonobj = (JSONObject) parser.parse(apiResult);
		
		JSONObject response = (JSONObject) jsonobj.get("response");
		String email = (String) response.get("email");
		String id = (String) response.get("id");
		String name = (String) response.get("name");
//
		Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("email", email);
        parameters.put("user_type", "N");
		MemberVO selectMember = loginService.duplCheck(parameters);
		System.out.println("selectMember " + selectMember);
        if(selectMember != null) { // 이메일로 가입되어있는 계정이 있는 경우
        	session.setAttribute("userVO", selectMember);
        	System.out.println("네이버 로그인");
        } else {
        	MemberVO apiMember = new MemberVO(email, name, id, "N");
        	loginService.joinMember(apiMember);
        	System.out.println("네이버 회원가입");
        	session.setAttribute("userVO", apiMember);
        }
		        
        return "redirect:/";
    }

}
