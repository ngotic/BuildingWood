package com.project.wood.hobbyclub;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/club/addclub.do")
public class AddClub extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddClub.java
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/addclub.jsp");
		dispatcher.forward(req, resp);

	}

}