package com.project.wood.board.teach;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/teach/signup.do")
public class SignUp extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String teachseq = req.getParameter("teachseq");
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		TeachDAO dao = new TeachDAO();

		String aseq = req.getParameter("aseq");
		
		int result = 0;
		
		if(aseq==null) {
			result = dao.subscribe(teachseq,id);
			
		}else {
			result = dao.subscribe(aseq);
		}
		
		if(result==1) {
			resp.sendRedirect("/wood/teach/list.do");
			
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed'); history.back();</script>");
			writer.close();
		}
		
	}
}
