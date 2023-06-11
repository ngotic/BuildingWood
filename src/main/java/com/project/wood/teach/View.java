package com.project.wood.teach;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.teach.repository.TeachDAO;
import com.project.wood.teach.repository.TeachDTO;

@WebServlet("/teach/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String teachseq = req.getParameter("teachseq");
		
		TeachDAO dao = new TeachDAO();
		
		TeachDTO dto = dao.get(teachseq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/teach/view.jsp");
		dispatcher.forward(req, resp);

	}
}
