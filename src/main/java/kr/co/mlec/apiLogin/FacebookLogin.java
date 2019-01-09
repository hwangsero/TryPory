package kr.co.mlec.apiLogin;

import javax.annotation.Resource;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FacebookLogin {
	@Autowired
    private FacebookConnectionFactory connectionFactory;
	@Resource(name="facebook")
    private OAuth2Parameters facebookOAuth2Parameters;
	
	@GetMapping("/fbLogin")
    public String facebookSignInCallback(@RequestParam String code, Model model) throws Exception {
 
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
                System.out.println("페이스북 로그인");
                System.out.println("유저이메일 : " + userProfile.getEmail());
                System.out.println("유저 id : " + userProfile.getId());
                System.out.println("유저 name : " + userProfile.getName());
                
                model.addAttribute("email", userProfile.getEmail());
        		model.addAttribute("name", userProfile.getName());
        		model.addAttribute("id", userProfile.getId());
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "redirect:/join";
 
    }


}
