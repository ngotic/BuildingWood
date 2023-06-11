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

@WebServlet("/study/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//list.java

		StudyDAO dao = new StudyDAO();
		StudyDTO dto = new StudyDTO();
		
		if(req.getParameter("studyjoin") != null) {

			String id = (String)req.getSession().getAttribute("id");
			int result = dao.studyjoinck(id,req.getParameter("openstudyseq"));
			if(result ==1 ) {
			dao.studyjoin(id,req.getParameter("openstudyseq"));
			}
		}
		
		
		ArrayList<StudyDTO> list = dao.ListContent();
		
		req.setAttribute("list", list);
		req.setAttribute("openstudyseq", dto.getOpenstudyseq());
		
		req.setAttribute("dto", dto);
		
		
		
		if(list != null ) {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/list.jsp");
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
		StudyDTO dto = new StudyDTO();
		
		String name = req.getParameter("name");
		
		String ck = req.getParameter("ck");
		System.out.println(name);
		
		ArrayList<StudyDTO> list;
		if(ck.equals("name")) {
			
			list = dao.Search(name);
		}else if(ck.equals("content")) {
			list = dao.Searchcontent(name);
		}else {
			list = dao.Search(name);
		}
		
//			else if(ck.equals("tag")) {
//			
//			/* ArrayList<StudyDTO> list = dao.Searchtag(name); */
//		}
//		

		if(list != null ) {
			
			req.setAttribute("list", list);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/list.jsp");
			dispatcher.forward(req, resp);
			
		}else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
			
		}
		
		
	
	}
	
	
	
	
}


	
