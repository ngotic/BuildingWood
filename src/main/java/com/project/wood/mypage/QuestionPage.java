package com.project.wood.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mypage/question.do")
public class QuestionPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//QuestionPage.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/question.jsp");
		dispatcher.forward(req, resp);

	}

}