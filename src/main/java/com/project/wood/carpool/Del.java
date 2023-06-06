package com.project.wood.carpool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.carpool.repository.CarpoolDAO;

@WebServlet("/carpool/del.do")
public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Del.java
		
		String carpoolseq = req.getParameter("carpoolseq");
		
		req.setAttribute("carpoolseq", carpoolseq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/del.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String carpoolseq = req.getParameter("carpoolseq");
		
		CarpoolDAO dao = new CarpoolDAO();
		
		int result = 0;
		
		result = dao.del(carpoolseq);
		
		if (result >= 1) {
			resp.sendRedirect("/wood/carpool/list.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
		
	}
	
}
