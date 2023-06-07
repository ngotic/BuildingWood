package com.project.study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//StudyAdd.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/add.jsp");
		dispatcher.forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		StudyDAO dao = new StudyDAO();
		StudyDTO dto = new StudyDTO();
		
		
		
		String name = req.getParameter("name");
		int recruit = Integer.parseInt(req.getParameter("age"));
		String intro = req.getParameter("intro");
		dto.setName(name);
		dto.setRecruit(recruit);
		dto.setIntro(intro);
		
		
		int result=1; 
		//= dao.OpenStudy(dto);
		if(result ==1 ) {
			
			resp.sendRedirect("./list.do");
			
		}else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
			
		}
		
		
	}
}
