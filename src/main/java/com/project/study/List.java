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

@WebServlet("/study/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//list.java

		StudyDAO dao = new StudyDAO();
		StudyDTO dto = new StudyDTO();
		
		ArrayList<StudyDTO> list = dao.ListContent();
		
		req.setAttribute("list", list);
		req.setAttribute("openstudyseq", dto.getOpenstudyseq());
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/list.jsp");
		
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		StudyDAO dao = new StudyDAO();
		StudyDTO dto = new StudyDTO();
		
		String name = req.getParameter("name");
		
		String ck = req.getParameter("ck");
		System.out.println(name);
		System.out.println(ck);
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


	
