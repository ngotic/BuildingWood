package com.project.wood.user.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.project.wood.user.repository.UserDTO;

public class NaverLoginApi {
	private String clientId;
	private String naverUrl;
	private String clientSecret;
	private String redirectURI;
	private String state; 

	
	private NaverLoginApi() {
		this.naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		this.clientId = "Jveu3m0PHASjCeAHOid4";
		this.redirectURI = "http://localhost:8090/wood/logincallback.do";
		SecureRandom random = new SecureRandom();
		this.state = new BigInteger(130, random).toString();
	}
	
	public void setClientSecret(String secret) {
		this.clientSecret = secret;
	}
	
    private static class NaverLoginApiHolder {
	    private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}

	public static NaverLoginApi instance() {
	    return NaverLoginApiHolder.INSTANCE;
	}

	public String getNaverLoginUrl(){
	    
		try {
		    naverUrl += "&client_id=" + this.clientId;
		    naverUrl += "&redirect_uri=" + URLEncoder.encode(this.redirectURI, "UTF-8");;
		    naverUrl += "&state=" + state;
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return naverUrl;
	}
	
	// 일단은 한번 로그인하면 access_token을 저장은 해야 한다. 
	public String getAccessToken(HttpServletRequest req) throws Exception {
		String code = req.getParameter("code");
		String state = req.getParameter("state");
		String redirectURI = URLEncoder.encode(this.redirectURI, "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + this.clientId;
		apiURL += "&client_secret=" + this.clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		//System.out.println("apiURL=" + apiURL);
		
		try {

			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();

			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				// 요거를 이제 파싱
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject) obj;
				access_token = (String) jsonObj.get("access_token");
				refresh_token = (String) jsonObj.get("refresh_token");
				
				return access_token;
			}
		} catch(Exception e) {
				e.printStackTrace();
		}
		return null;
	}
	
	public UserDTO getUserInfo(String accessToken) {
		String header = "Bearer " + accessToken; // Bearer 다음에 공백 추가
		String apiURL2 = "https://openapi.naver.com/v1/nid/me";
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL2, requestHeaders);
		return parse(responseBody);

	}
	
	private UserDTO parse(String profileJsonString) {
		// 가져와서 채울 정보 : id, email, name, phone, gender
		JSONParser parser = new JSONParser();
		try {	
			JSONObject  jobj= (JSONObject) parser.parse(profileJsonString);
			JSONObject robj = (JSONObject) jobj.get("response");
			UserDTO user = new UserDTO();
			user.setId("naver:"+(String)robj.get("id"));
			user.setName((String)robj.get("name"));
			user.setEmail((String)robj.get("email"));
			user.setTel((String)robj.get("mobile"));
			user.setGender((String)robj.get("gender"));
			user.setProfile((String)robj.get("profile_image"));
			return user;
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}
	
	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}
	
	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line = null;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
	
	public void logout(String accessToken) {
		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete&";
		// 삭제 필수 값
		String service_provider = "NAVER";
		apiURL += "client_id=" + this.clientId;
	    apiURL += "&client_secret=" + this.clientSecret;
		apiURL += "&service_provider=" + service_provider; 
		apiURL += "&access_token=" + accessToken;
		BufferedReader br = null;
		try {
			URL url = new URL(apiURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			//System.out.println("responseCode : " + responseCode);
			
			if(responseCode == 200) { 
		        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    } 
			else {  
		        br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		    }
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
