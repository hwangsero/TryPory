package kr.co.mlec.apiLogin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class KakaoLogin {

	@GetMapping("/kakaoLogin")
	public String joinForm(HttpServletRequest request, Model model) {
		String code = request.getParameter("code");
		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());

		System.out.println(profile);

		JsonNode properties = profile.path("properties");
        JsonNode kakao_account = profile.path("kakao_account");

        String id = profile.path("id").asText();
        String name = properties.path("nickname").asText();
        String email = kakao_account.path("email").asText();
        
        model.addAttribute("name", name);
        model.addAttribute("email", email);
        model.addAttribute("id", id);

		return "join/joinForm";
	}

	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "eff8d04801f7c728c9a2e97ab5283d84")); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8888/Travel-Diary/kakaoLogin")); // 리다이렉트
																													// URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}

		return returnNode;

	}

	public static JsonNode getKakaoUserInfo(String autorize_code) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

		String CLIENT_ID = "60fd3013b37b7ebcd4265233755c2b5c"; // REST API KEY

		String REDIRECT_URI = "http://localhost:8888/Travel-Diary/kakaoLogin"; // 리다이렉트 URI

		String code = autorize_code; // 로그인 과정중 얻은 토큰 값

		final HttpClient client = HttpClientBuilder.create().build();

		final HttpPost post = new HttpPost(RequestUrl);
		// add header

		post.addHeader("Authorization", "Bearer " + autorize_code.trim());

		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			System.out.println(response.getStatusLine().getReasonPhrase());
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;

	}
}
