package com.project.wood.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.project.wood.user.repository.UserDAO;
import com.project.wood.user.repository.UserDTO;
import com.project.wood.util.ApiKeyHolder;

// 네이바 소셜로그인
@WebServlet("/logincallback.do")
public class SocialCallbackNaver extends HttpServlet {

	UserDAO dao = new UserDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Social.java
		String clientId = "mchWypGBN850Xh6xPCFE";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = ApiKeyHolder.getNaverLoginSecretKey(getServletContext().getRealPath("/"));// 애플리케이션 클라이언트
																										// 시크릿값";
		String code = req.getParameter("code");
		String state = req.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8090/wood/logincallback.do", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		System.out.println("apiURL=" + apiURL);
		
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
			PrintWriter out = resp.getWriter();
			if (responseCode == 200) {
				System.out.println(res.toString());
				out.println(res.toString());
				// 요거를 이제 파싱
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject) obj;
				access_token = (String) jsonObj.get("access_token");
				refresh_token = (String) jsonObj.get("refresh_token");

				////////////////////////////////////////////////////////////
				String token = access_token; // 네이버 로그인 접근 토큰;
				String header = "Bearer " + token; // Bearer 다음에 공백 추가

				String apiURL2 = "https://openapi.naver.com/v1/nid/me";

				Map<String, String> requestHeaders = new HashMap<>();
				requestHeaders.put("Authorization", header);
				String responseBody = get(apiURL2, requestHeaders);
				///////////////////////////////////////////////////////

				System.out.println("Naver userProfile" + responseBody);
				
				UserDTO userinfo = parse(responseBody);
				// > : 이미 정보가 있다면 ? 없다면 ?
				UserDTO user = dao.existMember(userinfo.getId());
				
				req.getSession().setAttribute("id", "네이버테스트");
				req.getSession().setAttribute("lv", "1");
				req.getSession().setAttribute("nickname", "네이버테스트");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/club.jsp");
				dispatcher.forward(req, resp);
				
				/*
				if(user != null) {
					req.getSession().setAttribute("id", user.getId());
					req.getSession().setAttribute("lv", user.getLv());
					req.getSession().setAttribute("nickname", user.getNickname());
					RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/club.jsp");// 메인으로 전송
					dispatcher.forward(req, resp);
				} else {
					req.setAttribute("userinfo", userinfo); // 소셜 회원가입 페이지로 받은 페이지 전송
					RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/socialregister.jsp");
					dispatcher.forward(req, resp);
				}*/

			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	private static UserDTO parse(String profileJsonString) {
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

}