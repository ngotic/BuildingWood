package com.project.wood.carpool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.carpool.repository.CarpoolDAO;
import com.project.wood.carpool.repository.CarpoolDTO;

@WebServlet("/carpool/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Edit.java
		
		String carpoolseq = req.getParameter("carpoolseq");
		
		CarpoolDAO dao = new CarpoolDAO();
		CarpoolDTO dto = dao.get(carpoolseq);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/edit.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String carpoolseq = req.getParameter("carpoolseq");
		
		String content = req.getParameter("content");
	    String ttime = req.getParameter("ttime");
	    String departuresCity = req.getParameter("departurescity");
	    String departures = req.getParameter("departures");
	    String arrivalsCity = req.getParameter("arrivalscity");
	    String arrivals = req.getParameter("arrivals");
	    String fee = req.getParameter("fee");
	    String recruit = req.getParameter("recruit");
	    
	    
	    CarpoolDAO dao = new CarpoolDAO();
	    
	    CarpoolDTO dto = new CarpoolDTO();
	    dto.setCarpoolseq(carpoolseq);
	    dto.setContent(content);
		dto.setTtime(ttime);
		dto.setDeparturescity(departuresCity);
		dto.setDepartures(departures);
		dto.setArrivalscity(arrivalsCity);
		dto.setArrivals(arrivals);
		dto.setFee(fee);
		dto.setRecruit(recruit);
		
		
		int result = dao.edit(dto);
		
		if (result == 1) {
			resp.sendRedirect("/wood/carpool/view.do?carpoolseq=" + carpoolseq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}	
		
	}

}




















