package com.project.wood.board.teach;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/teach/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String teachseq = req.getParameter("teachseq");
		
		TeachDAO dao = new TeachDAO();
		
		TeachDTO dto = dao.get(teachseq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/teach/edit.jsp");
		dispatcher.forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String teachseq = req.getParameter("teachseq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String period = req.getParameter("period");
		String onoff = req.getParameter("onoff");
		String price = req.getParameter("price");

		TeachDAO dao = new TeachDAO();
		TeachDTO dto = new TeachDTO();
		
		dto.setTeachseq(teachseq);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPeriod(period);
		dto.setOnoff(onoff);
		dto.setPrice(price);
		
		int result = dao.editregdate(dto);
		
		if(result > 0) {
			
			resp.sendRedirect("/wood/teach/list.do");
			
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed'); history.back();</script>");
			writer.close();
		}
	}
}
