package com.project.wood.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 관리자용도 유저용도 공용으로 썼으면 좋겠음
@WebServlet("/mypage/mypage.do") // 이용자 정보는 마이페이지 
public class Mypage extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Admin.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
		dispatcher.forward(req, resp);
	}
}
