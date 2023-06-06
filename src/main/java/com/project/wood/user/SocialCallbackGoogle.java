package com.project.wood.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.project.wood.user.repository.UserDAO;
import com.project.wood.user.repository.UserDTO;
import com.project.wood.util.ApiKeyHolder;

@WebServlet("/logincallbackg.do")
public class SocialCallbackGoogle extends HttpServlet {
	
	// client_id:
	// 88525227840-rf14e1hho5gpbk9lhu862dsubd5mb1i0.apps.googleusercontent.com
	// client_secret : 
	UserDAO dao = new UserDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		// System.out.println("code : "+code);

		String query = "code=" + code;
		query += "&client_id=" + "88525227840-rf14e1hho5gpbk9lhu862dsubd5mb1i0.apps.googleusercontent.com";
		query += "&client_secret=" + ApiKeyHolder.getGoogleLoginSecretKey(getServletContext().getRealPath("/"));
		query += "&redirect_uri=" + "http://localhost:8090/wood/logincallbackg.do";
		query += "&grant_type=authorization_code";
		String tokenJson = getHttpConnection("https://accounts.google.com/o/oauth2/token", query);
		System.out.println(tokenJson.toString());
		Gson gson = new Gson();
		Token token = gson.fromJson(tokenJson, Token.class);

		String responseBody = getHttpConnection(
				"https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + token.getAccess_token());

		System.out.println("Google userProfile : " + responseBody);
		UserDTO userinfo = parse(responseBody);
		
		// > : 이미 정보가 있다면 ? 없다면 ?
		
		req.getSession().setAttribute("id", "구글테스트");
		req.getSession().setAttribute("lv", "1");
		req.getSession().setAttribute("nickname", "구글테스트");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/club.jsp");
		dispatcher.forward(req, resp);
		
		/*
		UserDTO user = dao.existMember(userinfo.getId());
		if(user != null) {
			req.getSession().setAttribute("id", user.getId());
			req.getSession().setAttribute("lv", user.getLv());
			req.getSession().setAttribute("nickname", user.getNickname());
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/club.jsp");
			dispatcher.forward(req, resp);
		} else {
			req.setAttribute("userinfo", userinfo); // 소셜 회원가입 페이지로 받은 페이지 전송
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/socialregister.jsp");
			dispatcher.forward(req, resp);
		}
		*/
		

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

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Post this is ");
		doGet(req, resp);
	}

}

//client_id:  88525227840-rf14e1hho5gpbk9lhu862dsubd5mb1i0.apps.googleusercontent.com
//client_secret : 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
