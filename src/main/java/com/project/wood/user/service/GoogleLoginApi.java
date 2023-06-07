package com.project.wood.user.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.google.gson.Gson;
import com.project.wood.user.Token;
import com.project.wood.user.repository.UserDTO;

public class GoogleLoginApi {
	private String googleUrl;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private String scope;
	
	
    private GoogleLoginApi(){
    	this.googleUrl = "https://accounts.google.com/o/oauth2/auth";
		this.clientId = "88525227840-rf14e1hho5gpbk9lhu862dsubd5mb1i0.apps.googleusercontent.com";
		this.redirectUrl = "http://localhost:8090/wood/logincallbackg.do";
		this.scope="https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";
    } // 외부에서 호출 안되게 막고 

    private static class GoogleLoginApiHolder {
	    private static final GoogleLoginApi INSTANCE = new GoogleLoginApi();
	}

	public static GoogleLoginApi instance() {
	    return GoogleLoginApiHolder.INSTANCE;
	}
	
	public void setClientSecret(String secret) {
		this.clientSecret = secret;
	}
	
	public String getGoogleLoginUrl() {
		return  this.googleUrl+"?client_id="+this.clientId+
		        "&redirect_uri="+ this.redirectUrl+
		        "&response_type=code&scope=" + this.scope
		        +"&approval_prompt=force&access_type=offline";
	}
	
	public Token getAccessToken(HttpServletRequest req) throws ServletException, IOException {
		
		String code = req.getParameter("code");
		String query = "code=" + code;
		query += "&client_id=" + this.clientId;
		query += "&client_secret=" +this.clientSecret;
		query += "&redirect_uri=" + this.redirectUrl;
		query += "&grant_type=authorization_code";
		String tokenJson = getHttpConnection("https://accounts.google.com/o/oauth2/token", query);
		System.out.println(tokenJson.toString());
		Gson gson = new Gson();
		return gson.fromJson(tokenJson, Token.class);
	}
	
	private String getHttpConnection(String uri) throws ServletException, IOException {
		URL url = new URL(uri);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		int responseCode = conn.getResponseCode();
		System.out.println(responseCode);

		String line;
		StringBuffer buffer = new StringBuffer();
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}

	private String getHttpConnection(String uri, String param) throws ServletException, IOException {
		URL url = new URL(uri);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		try (OutputStream stream = conn.getOutputStream()) {
			try (BufferedWriter wd = new BufferedWriter(new OutputStreamWriter(stream))) {
				wd.write(param);
			}
		}
		int responseCode = conn.getResponseCode();
		System.out.println(responseCode);

		String line;
		StringBuffer buffer = new StringBuffer();
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
	
	private UserDTO parse(String profileJsonString) {
		/*
		 * { "id": "102717622804956166665", "email": "ngotic2888@gmail.com",
		 * "verified_email": true, "name": "hello world", "given_name": "hello",
		 * "family_name": "world", "picture":
		 * "https://lh3.googleusercontent.com/a/AAcHTtcEPnS93sA1WTOiOYV3sL1lwUAaIThyHXlRssa4=s96-c",
		 * "locale": "ko" }
		 */
		// 가져와서 채울 정보 : id, email, name, profile
		JSONParser parser = new JSONParser();

		try {
			UserDTO user = new UserDTO();
			JSONObject jobj = (JSONObject) parser.parse(profileJsonString);
			user.setId("google:"+(String) jobj.get("id"));
			user.setEmail((String) jobj.get("email"));
			user.setName((String) jobj.get("name"));
			user.setProfile((String) jobj.get("picture"));

			return user;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public UserDTO getUserInfo(Token token) throws ServletException, IOException {
		String responseBody = getHttpConnection("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + token.getAccess_token());
		return parse(responseBody);
	}
	
	public void logout(String accessToken) {
		String reqUrl = "https://oauth2.googleapis.com/revoke";
		BufferedReader br = null;
		try {
			//URL url = new URL(reqUrl2);
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// method = "POST"
			// GET 방식인 경우 쿼리스트링을 사용해서 보냄
			// POST 방식이기 때문에 쿼리스트링 대신 bufferedWriter를 통해서 작성
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("token=" + accessToken);
			bw.write(sb.toString());
			bw.flush();
			
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
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
			System.out.println("logout : " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}