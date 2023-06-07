package com.project.wood;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/indexhome.do")
public class homeTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//homeTest.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/indexhome.jsp");
		dispatcher.forward(req, resp);

	}

}