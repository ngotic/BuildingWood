package com.project.wood;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.service.GoogleLoginApi;
import com.project.wood.user.service.NaverLoginApi;
import com.project.wood.util.ApiKeyHolder;
import com.test.mycrypto.DESUtil;

import javax.crypto.Cipher;

@WebServlet("/index.do")
public class Index extends HttpServlet {
	
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

		// 이미 세션정보가 있으면 페이지 내부로 리다이렉션 
		//Index.java
		req.setAttribute("naverUrl", naverApi.getNaverLoginUrl());
		req.setAttribute("googleUrl", googleApi.getGoogleLoginUrl());
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/main.jsp");
		dispatcher.forward(req, resp);

		
	}

}