package com.project.wood.board.teach;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
@WebServlet("/teach/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/teach/login.jsp");
		dispatcher.forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		UserDAO dto = new UserDAO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		UserDAO dao = new UserDAO();
		
		UserDAO result = dao.login(dto);
		
		
		if (result != null) {
			req.getSession().setAttribute("id", id);
			req.getSession().setAttribute("name", result.getName());
			req.getSession().setAttribute("nickname", result.getNickname());
			
			resp.sendRedirect("/wood/teach/list.do");
			
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed'); history.back();</script>");
			writer.close();
			
		}
		
	}
}*/

