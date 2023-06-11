package com.project.wood.suggest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.suggest.repository.SuggestDAO;
import com.project.wood.suggest.repository.SuggestDTO;

@WebServlet("/suggest/suggestadd.do")
public class SuggestAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//SuggestAdd.java

		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/suggest/suggestadd.jsp");
		dispatcher.forward(req, resp);
	}//get
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String category = req.getParameter("category");
		
		
		SuggestDTO dto = new SuggestDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory(category);
		dto.setId((String)session.getAttribute("id"));
		
		SuggestDAO dao = new SuggestDAO();
		
		int result  = dao.suggestadd(dto);
		
		if (result == 1) {
			//성공
			resp.sendRedirect("/wood/suggest/suggest.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
	
	}//post
	
}











