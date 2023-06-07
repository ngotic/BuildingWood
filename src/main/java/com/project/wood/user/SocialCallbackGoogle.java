package com.project.wood.user;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLEncoder;

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
import com.project.wood.user.service.GoogleLoginApi;
import com.project.wood.user.service.NaverLoginApi;
import com.project.wood.util.ApiKeyHolder;

@WebServlet("/logincallbackg.do")
public class SocialCallbackGoogle extends HttpServlet {
	
	// client_id:
	// 88525227840-rf14e1hho5gpbk9lhu862dsubd5mb1i0.apps.googleusercontent.com
	// client_secret : 
	
	UserDAO dao = new UserDAO();
	
	private GoogleLoginApi googleapi;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String clientSecret = ApiKeyHolder.getGoogleLoginSecretKey(getServletContext().getRealPath("/"));
		googleapi = GoogleLoginApi.instance();
		googleapi.setClientSecret(clientSecret);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Token token = googleapi.getAccessToken(req);
		req.getSession().setAttribute("access_token", token.getAccess_token());// 일단 저장
		UserDTO userinfo = googleapi.getUserInfo(token);		
		UserDTO user = dao.existMember(userinfo.getId());
		
		if( user != null) { // 이때도 문제긴하다.
			req.getSession().setAttribute("id", user.getId());
			req.getSession().setAttribute("lv", user.getLv());
			req.getSession().setAttribute("nickname", user.getNickname());
			resp.sendRedirect("/wood/club/club.do"); // redirect로 이동 이상한 쿼리 스트링 달고오면 redirect로 이동 [임시 url] 
		} else {
			resp.sendRedirect("/wood/user/socialregister.do?id="+userinfo.getId()+"&email="+userinfo.getEmail()+"&name="+URLEncoder.encode(userinfo.getName())+"&profile="+userinfo.getProfile());
		}
		
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
