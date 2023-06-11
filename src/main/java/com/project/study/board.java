package com.project.study;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.study.repository.StudyDAO;
import com.project.study.repository.StudyDTO;
import com.project.study.repository.StudyListDTO;

@WebServlet("/study/board.do")
public class board extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//board.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/board.jsp");
		dispatcher.forward(req, resp);
	}

	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		StudyDTO dto = new StudyDTO();
		StudyListDTO odto = new StudyListDTO();
		
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setOpenstudyseq(req.getParameter("openstudyseq"));
		
		int result = dao.Setboard(dto);
		System.out.println(result);
		if(result ==1 ) {
			
			ArrayList<StudyListDTO> list = dao.ListContentstudys(odto);
			dto = dao.odtocontent(req.getParameter("openstudyseq"));
			
			
			req.setAttribute("list", list);
			req.setAttribute("odto", odto);
			req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/view.jsp");
		dispatcher.forward(req, resp);
		}else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
			
		}
		
		
		
	}
	
}
