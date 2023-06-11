package com.project.wood.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.suggest.repository.SuggestDAO;
import com.project.wood.suggest.repository.SuggestDTO;

@WebServlet("/admin/adminquestion.do")
public class QuestionAdmin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//QuestionAdmin.java
		
		HttpSession session = req.getSession();
		
		String id = (String)req.getSession().getAttribute("id");
		
		SuggestDAO dao = new SuggestDAO();
		List<SuggestDTO> myslist = dao.mysuggestlist(id);
		
		req.setAttribute("myslist", myslist);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminquestion.jsp");
		dispatcher.forward(req, resp);

	}

}