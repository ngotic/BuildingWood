package com.project.wood.user.valid;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.repository.UserDAO;

@WebServlet("/user/checkidandemail.do")
public class CheckIdAndEmail extends HttpServlet {
	
	UserDAO dao = new UserDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//CheckEmail.java
		resp.setContentType("application/json");
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		// db갔다오기 
		int result = dao.checkUserInput(id, email);
		resp.getWriter().append( result !=0 ? "true" : "false");

	}
}