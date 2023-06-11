package com.project.wood.mypage;

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


@WebServlet("/mypage/question.do")
public class QuestionPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//QuestionPage.java
		
		HttpSession session = req.getSession();
		
		String id = (String)req.getSession().getAttribute("id");
		
		SuggestDAO dao = new SuggestDAO();
		List<SuggestDTO> myslist = dao.mysuggestlist(id);
		
		req.setAttribute("myslist", myslist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/question.jsp");
		dispatcher.forward(req, resp);

	}

}