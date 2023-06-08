package com.project.wood.carpool;

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

import com.project.wood.carpool.repository.CarpoolApplyDTO;
import com.project.wood.carpool.repository.CarpoolDAO;

@WebServlet("/carpool/apply.do")
public class Apply extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Apply.java
		HttpSession session = req.getSession();
		
		String carpoolapplyseq = req.getParameter("carpoolapplyseq");
		String carpoolseq = req.getParameter("carpoolseq");
		String applystatus = req.getParameter("applystatus");
		
		CarpoolDAO dao = new CarpoolDAO();
		CarpoolApplyDTO adto = new CarpoolApplyDTO();
		
		adto.setCarpoolapplyseq(carpoolapplyseq);
		adto.setCarpoolseq(carpoolseq);
		adto.setApplystatus(applystatus);
		adto.setId((String)session.getAttribute("id"));
		
		int result = dao.carpoolApply(adto);
		
		if (result == 1) {
			resp.sendRedirect("/wood/carpool/view.do?carpoolseq=" + carpoolseq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}	

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/apply.jsp");
		dispatcher.forward(req, resp);

	}

}
