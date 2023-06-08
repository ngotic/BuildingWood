package com.project.study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.study.repository.StudyDAO;
import com.project.study.repository.StudyListDTO;

@WebServlet("/study/viewboard.do")
public class Viewboard extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		
		StudyDAO dao = new StudyDAO();
		StudyListDTO cdto = new StudyListDTO();

		
		cdto.setStudyseq(req.getParameter("studyseq"));
		cdto.setOpenstudyseq( req.getParameter("openstudyseq"));

		ArrayList<StudyListDTO> commentlist = dao.ListCommentselect(cdto);
			StudyListDTO dto = dao.board(req.getParameter("studyseq"));
			
			req.setAttribute("dto", dto);
			
			req.setAttribute("commentlist", commentlist);
			req.setAttribute("studyseq", req.getParameter("studyseq"));
			req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		
		System.out.println("cdto = "+cdto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/viewboard.jsp");
		
		dispatcher.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StudyDAO dao = new StudyDAO();
		StudyListDTO cdto = new StudyListDTO();
		
		cdto.setContent(req.getParameter("content"));
		cdto.setStudyseq(req.getParameter("studyseq"));
		cdto.setOpenstudyseq( req.getParameter("openstudyseq"));
		System.out.println(cdto);
		int result  = dao.ListComment(cdto);
		
		if(result ==1 ) {
			
			ArrayList<StudyListDTO> commentlist = dao.ListCommentselect(cdto);
			StudyListDTO dto = dao.board(req.getParameter("studyseq"));
			
			req.setAttribute("dto", dto);
			req.setAttribute("cdto", cdto);
			req.setAttribute("commentlist", commentlist);
			req.setAttribute("studyseq", req.getParameter("studyseq"));
			req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		}
	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/viewboard.jsp");
		
		dispatcher.forward(req, resp);
	}

}
