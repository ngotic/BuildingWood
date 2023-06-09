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
import com.project.wood.promise.repository.PromiseDTO;
import com.project.wood.promise.repository.ReplyDTO;

@WebServlet("/promise/accept.do")
public class Accept extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String nickname = req.getParameter("nickname");
		String promiseseq = req.getParameter("promiseseq");

		System.out.println(nickname);
		System.out.println(promiseseq);

		PromiseDAO dao = new PromiseDAO();
		PromiseDTO dto = new PromiseDTO();
		ReplyDTO rdto = new ReplyDTO();

		int result = dao.edit(nickname, promiseseq);

		
		  int adminnum = dao.adminnum(promiseseq);
		  
		  String checknickname = dao.checknickname(nickname, promiseseq);
		  
		  req.setAttribute("checknickname", checknickname);
		 

		if (result >= 1) {
			resp.sendRedirect(
					"/wood/promise/view.do?promiseseq=" + promiseseq + "&adminnum=" + adminnum + "&nickname=" + URLEncoder.encode(nickname));
			System.out.println("성공");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}

	}

}
