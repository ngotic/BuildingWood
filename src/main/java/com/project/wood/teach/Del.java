package com.project.wood.teach;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/teach/del.do")
public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String teachseq =req.getParameter("teachseq");
		System.out.println(teachseq);
		
		TeachDAO dao = new TeachDAO();
		int result = dao.del(teachseq, id);
		
		if(result==1) {
			
			resp.sendRedirect("/wood/teach/list.do");
			
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed'); history.back();</script>");
			writer.close();
		}

	}
}
