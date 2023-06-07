package com.project.wood.carpool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.carpool.repository.CarpoolDAO;
import com.project.wood.carpool.repository.CarpoolDTO;

@WebServlet("/carpool/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//carpool/View.java
		
		HttpSession session = req.getSession();
		
		
		String carpoolseq = req.getParameter("carpoolseq");
		
		
		CarpoolDAO dao = new CarpoolDAO();
		
		CarpoolDTO dto = dao.get(carpoolseq);
		
		
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/view.jsp");
		dispatcher.forward(req, resp);

	}

}