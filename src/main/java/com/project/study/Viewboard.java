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

import com.project.study.repository.PagingDAO;
import com.project.study.repository.PagingDTO;
import com.project.study.repository.StudyDAO;
import com.project.study.repository.StudyDTO;
import com.project.study.repository.StudyListDTO;

@WebServlet("/study/viewboard.do")
public class Viewboard extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		

		StudyDAO dao = new StudyDAO();
		StudyDTO odto = new StudyDTO();
		StudyListDTO dto = new StudyListDTO();

		dao.chcke(req.getParameter("studyseq"));
		 
		
		
		
		dto.setStudyseq(req.getParameter("studyseq"));
		dto.setOpenstudyseq( req.getParameter("openstudyseq"));
		
		ArrayList<StudyListDTO> commentlist = dao.ListCommentselect(dto);
			dto = dao.board(req.getParameter("studyseq"));
			dto.setOpenstudyseq(req.getParameter("openstudyseq"));
			
		
			
			req.setAttribute("commentlist", commentlist);
			req.setAttribute("studyseq", req.getParameter("studyseq"));

		ArrayList<StudyListDTO> list = dao.ListContentstudys(dto);
		odto = dao.odtocontent(req.getParameter("openstudyseq"));
		
		
		
		 
		

		
		req.setAttribute("list", list);
		req.setAttribute("odto", odto); //studydto
		req.setAttribute("dto", dto); //studtlistdto
		
		req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		if(list != null) {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/viewboard.jsp");
		dispatcher.forward(req, resp);
		
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
		}
	
	
		
		
		

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StudyDAO dao = new StudyDAO();
		StudyListDTO cdto = new StudyListDTO();
		
		cdto.setContent(req.getParameter("content"));
		cdto.setStudyseq(req.getParameter("studyseq"));
		cdto.setOpenstudyseq( req.getParameter("openstudyseq"));
		cdto.setNickname((String)req.getSession().getAttribute("nickname"));
		
		System.out.println("cdto 가뭐야 "+cdto);
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
