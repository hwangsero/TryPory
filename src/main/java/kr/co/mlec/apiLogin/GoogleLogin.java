package kr.co.mlec.apiLogin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.MemberVO;

@Controller
public class GoogleLogin {
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Resource(name="google")
	private OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	private LoginService loginService;

	@GetMapping("/googleLogin")
	public String doSessionAssignActionPage(HttpServletRequest request, HttpSession session) throws Exception {

		String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();

		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);

		}

		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		System.out.println(connection);

		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		System.out.println("구글 로그인");
		String id = profile.getId(); // api 고유키값
        String name = profile.getDisplayName();
        String email = profile.getAccountEmail();
		System.out.println("User Uid : " + id);
		System.out.println("User Name : " + name);
		System.out.println("User Email : " + email);
//		System.out.println("User Profile : " + profile.getImageUrl());
		
		Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("email", email);
        parameters.put("user_type", "G");
		MemberVO selectMember = loginService.duplCheck(parameters);
        if(selectMember != null) { // 이메일로 가입되어있는 계정이 있는 경우
        	session.setAttribute("userVO", selectMember);
        	System.out.println("구글 로그인");
        } else {
        	MemberVO apiMember = new MemberVO(email, name, id, "G");
        	loginService.joinMember(apiMember);
        	System.out.println("구글 회원가입");
        	session.setAttribute("userVO", apiMember);
        }
		// Access Token 취소
		try {
			System.out.println("Closing Token....");
			String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
			URL url = new URL(revokeUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "redirect:/";

	}

}
