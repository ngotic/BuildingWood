package com.project.wood.suggest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.suggest.repository.SuggestDAO;

@WebServlet("/suggest/suggestdel.do")
public class SuggestDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//SuggestDel.java
		String suggestseq = req.getParameter("suggestseq");
		req.setAttribute("suggestseq", suggestseq);
		
		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/suggest/suggestdel.jsp");
		dispatcher.forward(req, resp);
	}//get
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String suggestseq = req.getParameter("suggestseq");
		SuggestDAO dao = new SuggestDAO();
		
		int result = 0;
		result = dao.suggestdel(suggestseq);
		
		if (result == 1) {
			//성공
			resp.sendRedirect("/wood/suggest/suggest.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
	
	}
}
