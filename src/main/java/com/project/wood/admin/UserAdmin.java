package com.project.wood.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/adminuser.do")
public class UserAdmin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//UserAdmin.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminuser.jsp");
		dispatcher.forward(req, resp);

	}

}