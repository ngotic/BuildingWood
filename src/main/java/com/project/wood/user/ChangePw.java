package com.project.wood.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.user.repository.UserDAO;

@WebServlet("/user/changepw.do")
public class ChangePw extends HttpServlet {
	
	UserDAO dao = new UserDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ChangePw.java
		String email = req.getParameter("email");
		String authnum = req.getParameter("authnum");
		String sessionauthnum = (String) req.getSession().getAttribute("authnum");
		if( authnum!=null && authnum.equals(sessionauthnum)) {
			req.setAttribute("email", email);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/changepw.jsp");
			dispatcher.forward(req, resp);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/main.jsp");
			dispatcher.forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String authnum = req.getParameter("authnum");
		String pw = req.getParameter("pw");
		JSONObject obj = new JSONObject();
		String sessionauthnum = (String) req.getSession().getAttribute("authnum");
		if( authnum!=null && authnum.equals(sessionauthnum)) {
			int result = dao.changePw(email, pw); // 비밀번호 변경하자
			obj.put("result", result);
			req.getSession().removeAttribute("authnum");
		} else 
			obj.put("result", 0);
		
		resp.setContentType("application/json"); 
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close(); 
	
	}
}