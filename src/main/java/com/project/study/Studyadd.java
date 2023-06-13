package com.project.study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.study.repository.StudyDAO;
import com.project.study.repository.StudyDTO;

@WebServlet("/study/studyadd.do")
public class Studyadd extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		StudyDAO dao = new StudyDAO();
		StudyDTO dto = new StudyDTO();
		
		dto = dao.odtocontent(req.getParameter("openstudyseq"));
		
		
		
		if(dto != null ) {
			req.setAttribute("dto", dto);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/studyadd.jsp");
			dispatcher.forward(req, resp);
			}else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
			
			}
	}
	
	
}