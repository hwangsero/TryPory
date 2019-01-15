package kr.co.mlec.apiTest;

import java.net.URI;
import java.nio.charset.Charset;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonArray;

public class ImageSearch {

	public static void main(String[] args) throws ParseException {
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		Charset utf8 = Charset.forName("UTF-8");
		MediaType mediaType = new MediaType("application", "json", utf8);
		headers.setContentType(mediaType);

		headers.set("X-Naver-Client-Id", "bMU3QPxj_f1yHg4oh2qe");
		headers.set("X-Naver-Client-Secret", "3Zr16MRhlw");

		HttpEntity entity = new HttpEntity("parameters", headers);
		String url = "https://openapi.naver.com/v1/search/image?query=오사카&display=1&start=1&sort=sim";
		UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(url);
		URI uri = builder.build().encode().toUri();

		ResponseEntity response = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(response.getBody().toString());

		JSONArray jsonArray = (JSONArray)jsonObject.get("items");
		JSONObject result = (JSONObject) jsonArray.get(0);
		System.out.println(result.get("thumbnail"));
	}
}
