package com.project.wood.user.valid;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.repository.UserDAO;


@WebServlet("/user/checkid.do")
public class CheckId extends HttpServlet {
	
	UserDAO dao = new UserDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//CheckEmail.java
		
		resp.setContentType("application/json");
		String id = req.getParameter("id");
		String flip = req.getParameter("flip");
		
		// db갔다오기
		int result = dao.checkUserInput(id, Type.ID);
		if( flip!=null)
			resp.getWriter().append( result !=0 ? "true" : "false");
		else 
			resp.getWriter().append( result !=0 ? "false":"true");

	}
}