package com.project.study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//View.java
		
		StudyDAO dao = new StudyDAO();
		StudyListDTO dto = new StudyListDTO();
		

		
		dto.setOpenstudyseq(req.getParameter("openstudyseq"));
		ArrayList<StudyListDTO> list = dao.ListContentstudys(dto);
		
		req.setAttribute("list", list);
		req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/view.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		StudyListDTO dto = new StudyListDTO();
		

		
		dto.setContent(req.getParameter("content"));
		dto.setTitle(req.getParameter("title"));
		dto.setOpenstudyseq(req.getParameter("openstudyseq"));
		
		System.out.println(req.getParameter("content"));
		System.out.println(req.getParameter("title"));
		System.out.println(req.getParameter("openstudyseq"));
		
		dao.ListContentstudys(dto);
		
		ArrayList<StudyListDTO> list = dao.ListContentstudys(dto);
		
		req.setAttribute("list", list);
		req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/view.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}

