package com.project.wood.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.repository.UserDAO;
import com.project.wood.user.repository.UserDTO;
import com.project.wood.user.service.GoogleLoginApi;
import com.project.wood.user.service.NaverLoginApi;
import com.project.wood.util.ApiKeyHolder;



@WebServlet("/user/login.do")
public class Login extends HttpServlet {
	
	private NaverLoginApi naverApi;
	private GoogleLoginApi googleApi;
	UserDAO dao = new UserDAO();
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Login.java
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String rememberId = req.getParameter("remember");
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPassword(password);
	
		//1.  비밀번호, 아아디 db에 있나 확인하기.
		//2.  있으면 성공  
		UserDTO user = dao.login(dto);
		//3. 없으면 fail

		// 쿠키의 setPath는 ContextRoot 바로 아래 
		if(rememberId != null ) {
            // 1. 쿠키를 생성
            Cookie cookie = new Cookie("id", id); 
            cookie.setPath("/wood/"); // 쿠키가 가는 위치를 지정
            // 2. 응답에 저장
            resp.addCookie(cookie);
            System.out.println("쿠키가 생성");
        } else {
            // 1. 쿠키를 삭제
            Cookie cookie = new Cookie("id", id); 
            cookie.setPath("/wood/"); // 쿠키가 가는 위치를 지정
            cookie.setMaxAge(0); // 2. 응답에 저장 
            resp.addCookie(cookie);
            System.out.println("쿠키를 삭제");
        }
        
		if (user != null) {
			
			// 로그인 성공, requset 객체가 session을 가지고 있다. 
			req.getSession().setAttribute("id", id);
			req.getSession().setAttribute("lv", user.getLv());
			req.getSession().setAttribute("nickname", user.getNickname());
			resp.sendRedirect("/wood/indexhome.do");
			
		} else {
			// 로그인 실패
			req.setAttribute("msg", "LOGIN_ERR");
			req.setAttribute("naverUrl", naverApi.getNaverLoginUrl());
			req.setAttribute("googleUrl", googleApi.getGoogleLoginUrl());
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/main.jsp");
			dispatcher.forward(req, resp);
		}
	}

}