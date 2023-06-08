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
		
		
		/* String jessionid = */
		String name = req.getParameter("name");
		String recruit = req.getParameter("recruit");
		String intro = req.getParameter("intro");
		String period = req.getParameter("period");
		String startdate  = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String onoff = req.getParameter("onoff");
		String address = req.getParameter("address");
			
		
		
		System.out.println(name);
		System.out.println(recruit);
		System.out.println(intro);
		System.out.println(period);
		System.out.println(startdate);
		System.out.println(enddate);
		System.out.println(onoff);
		System.out.println(address);
		
		
		dto.setName(name);
		dto.setRecruit(recruit);
		dto.setIntro(intro);
		dto.setPeriod(period);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		dto.setOnoff(onoff);
		dto.setAddress(address);
		
		
		
		int result = dao.OpenStudy(dto);
		if(result ==1 ) {
			
			resp.sendRedirect("./list.do");
			
			
		}else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
			
		}
		

		
	}
	
	
}
