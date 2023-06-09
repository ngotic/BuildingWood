package com.project.wood.promise;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.promise.repository.PromiseDAO;
import com.project.wood.promise.repository.ReplyDTO;

@WebServlet("/promise/reply.do")
public class Reply extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		

		String promiseseq = req.getParameter("promiseseq");
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		String regdate = req.getParameter("regdate");

		
		PromiseDAO dao = new PromiseDAO();
		ReplyDTO rdto = new ReplyDTO();
		
		rdto.setId((String)session.getAttribute("id"));
		rdto.setContent(content);
		rdto.setPromiseseq(promiseseq);
		
		
		int result = dao.addComment(rdto);
		

		if (result == 1) {
			resp.sendRedirect("/wood/promise/view.do?promiseseq=" + promiseseq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
		

	}

}
