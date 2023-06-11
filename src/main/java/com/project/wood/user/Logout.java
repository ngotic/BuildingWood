package com.project.wood.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.service.GoogleLoginApi;
import com.project.wood.user.service.NaverLoginApi;
import com.project.wood.util.ApiKeyHolder;

@WebServlet("/user/logout.do")
public class Logout extends HttpServlet {
	
	private NaverLoginApi naverapi;
	private GoogleLoginApi googleapi;
	
	// "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER"
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String clientSecret = ApiKeyHolder.getNaverLoginSecretKey(getServletContext().getRealPath("/"));
		naverapi = NaverLoginApi.instance();
		naverapi.setClientSecret(clientSecret);
		
		String clientSecretGoogle = ApiKeyHolder.getGoogleLoginSecretKey(getServletContext().getRealPath("/"));
		googleapi = GoogleLoginApi.instance();
		googleapi.setClientSecret(clientSecretGoogle);
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Logout.java
		/*
		 * req.getSession().removeAttribute("id");
		 * req.getSession().removeAttribute("lv");
		 * req.getSession().removeAttribute("nickname");
		 */
		
		String id = (String)req.getSession().getAttribute("id");
		System.out.println("this is "+id);
		if( id!=null && id.contains("google:")) {
			System.out.println("구글 로그아웃");
			googleapi.logout((String)req.getSession().getAttribute("access_token"));
		} else if( id!=null && id.contains("naver:")) {
			System.out.println("네이버 로그아웃");
			naverapi.logout((String)req.getSession().getAttribute("access_token"));
		} 
		
		req.getSession().invalidate();
		resp.sendRedirect("/wood/index.do");
	}

}