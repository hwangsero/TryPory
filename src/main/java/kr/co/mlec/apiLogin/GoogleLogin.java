package kr.co.mlec.apiLogin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoogleLogin {
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Resource(name="google")
	private OAuth2Parameters googleOAuth2Parameters;

	@GetMapping("/googleLogin")
	public String doSessionAssignActionPage(HttpServletRequest request, Model model) throws Exception {

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
		System.out.println("User Uid : " + profile.getId());
		System.out.println("User Name : " + profile.getDisplayName());
		System.out.println("User Email : " + profile.getAccountEmail());
		System.out.println("User Profile : " + profile.getImageUrl());
		
		model.addAttribute("email", profile.getAccountEmail());
		model.addAttribute("name", profile.getDisplayName());
		model.addAttribute("id", profile.getId());
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
		return "redirect:/join";

	}

}
