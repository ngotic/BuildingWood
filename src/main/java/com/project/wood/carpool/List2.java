package com.project.wood.carpool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/carpool/list2.do")
public class List2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/list2.jsp");
		dispatcher.forward(req, resp);

	}

}
