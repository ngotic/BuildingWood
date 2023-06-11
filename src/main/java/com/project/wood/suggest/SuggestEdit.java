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
import com.project.wood.suggest.repository.SuggestDTO;

@WebServlet("/suggest/suggestedit.do")
public class SuggestEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//SuggestEdit.java
		String suggestseq = req.getParameter("suggestseq");
		SuggestDAO dao = new SuggestDAO();
		SuggestDTO dto = dao.getSuggest(suggestseq);
		
		req.setAttribute("dto", dto);
		
		
		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/suggest/suggestedit.jsp");
		dispatcher.forward(req, resp);
	}//get
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String suggestseq = req.getParameter("suggestseq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String category = req.getParameter("category");
		
		SuggestDAO dao = new SuggestDAO();
		SuggestDTO dto = new SuggestDTO();
		dto.setSuggestseq(suggestseq);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory(category);
		
		int result = dao.suggestedit(dto);
		
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















