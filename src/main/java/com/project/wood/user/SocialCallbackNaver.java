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
import com.project.wood.user.service.GoogleLoginApi;
import com.project.wood.user.service.NaverLoginApi;
import com.project.wood.util.ApiKeyHolder;

// 네이바 소셜로그인
@WebServlet("/logincallback.do")
public class SocialCallbackNaver extends HttpServlet {
	
	UserDAO dao = new UserDAO();
	
	private NaverLoginApi naverApi;
	private GoogleLoginApi googleApi;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String clientSecret = ApiKeyHolder.getNaverLoginSecretKey(getServletContext().getRealPath("/"));
		naverApi = NaverLoginApi.instance();
		naverApi.setClientSecret(clientSecret);
		
		String clientSecretGoogle = ApiKeyHolder.getGoogleLoginSecretKey(getServletContext().getRealPath("/"));
		googleApi = GoogleLoginApi.instance();
		googleApi.setClientSecret(clientSecretGoogle);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String access_token;
		try {
			access_token = naverApi.getAccessToken(req);
			req.getSession().setAttribute("access_token", access_token);// 일단 저장
			UserDTO userinfo = naverApi.getUserInfo(access_token);
			UserDTO user = dao.existMember(userinfo.getId());

			if (user != null) {
				
				
				if (user.getBan().equals("y")) { // 차단으로 인한 로그인 실패
					// 로그인 실패
					req.getSession().setAttribute("msg", "LOGIN_BAN_ERR");
					resp.sendRedirect("/wood/index.do?naverUrl="+naverApi.getNaverLoginUrl()+"&googleUrl="+googleApi.getGoogleLoginUrl());
					return ;
				}
				
				req.getSession().setAttribute("id", user.getId());
				req.getSession().setAttribute("lv", user.getLv());
				req.getSession().setAttribute("nickname", user.getNickname());
				resp.sendRedirect("/wood/club/club.do"); // redirect로 이동 [임시 url] 
			} else {
				resp.sendRedirect("/wood/user/socialregister.do?id=" + userinfo.getId() + "&email="
						+ userinfo.getEmail() + "&name=" + URLEncoder.encode(userinfo.getName()) + "&profile="
						+ userinfo.getProfile());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}