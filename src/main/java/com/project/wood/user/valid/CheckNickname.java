package com.project.wood.user.valid;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.repository.UserDAO;

@WebServlet("/user/checknickname.do")
public class CheckNickname extends HttpServlet {
	
	UserDAO dao = new UserDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//CheckEmail.java
		
		resp.setContentType("application/json");
		String nickname = req.getParameter("nickname");
		// db갔다오기 
		int result = dao.checkUserInput(nickname, Type.NICKNAME);
		resp.getWriter().append( result !=0 ? "false":"true");

	}
}