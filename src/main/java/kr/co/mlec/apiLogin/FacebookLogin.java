package kr.co.mlec.apiLogin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.MemberVO;

@Controller
public class FacebookLogin {
	@Autowired
    private FacebookConnectionFactory connectionFactory;
	@Resource(name="facebook")
    private OAuth2Parameters facebookOAuth2Parameters;
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/fbLogin")
    public String facebookSignInCallback(@RequestParam String code, Model model, HttpSession session) throws Exception {
 
        try {
             String redirectUri = facebookOAuth2Parameters.getRedirectUri();
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
//                logger.info("accessToken is expired. refresh token = {}", accessToken);
            };
            
        
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            try{            
                String [] fields = { "id", "email",  "name"};
                User userProfile = facebook.fetchObject("me", User.class, fields);
                
                String id = userProfile.getId(); // api 고유키값
                String name = userProfile.getName();
                String email = userProfile.getEmail();
                System.out.println("페이스북 로그인");
                System.out.println("유저이메일 : " + email);
                System.out.println("유저 id : " + id);
                System.out.println("유저 name : " + name);
                
                Map<String, Object> parameters = new HashMap<String, Object>();
                parameters.put("email", email);
                parameters.put("user_type", "F");

        		MemberVO selectMember = loginService.duplCheck(parameters);
                if(selectMember != null) { // 이메일로 가입되어있는 계정이 있는 경우
                	session.setAttribute("userVO", selectMember);
                	System.out.println("페이스북 로그인");
                } else {
                	MemberVO apiMember = new MemberVO(email, name, id, "F");
                	loginService.joinMember(apiMember);
                	System.out.println("페이스북 회원가입");
                	session.setAttribute("userVO", apiMember);
                }
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "redirect:/";
 
    }


}
