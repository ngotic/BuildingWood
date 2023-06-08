package com.project.wood.carpool;

import java.io.IOException;
import java.io.PrintWriter;import java.sql.Driver;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.carpool.repository.CarpoolDAO;
import com.project.wood.carpool.repository.CarpoolDTO;

@WebServlet("/carpool/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String content = req.getParameter("content");
	    String date = req.getParameter("date");
	    String time = req.getParameter("time");
	    String ttime = String.format("%s %s:00", date, time);
	    String departuresCity = req.getParameter("departurescity");
	    String departures = req.getParameter("departures");
	    String arrivalsCity = req.getParameter("arrivalscity");
	    String arrivals = req.getParameter("arrivals");
	    String fee = req.getParameter("fee");
	    String recruit = req.getParameter("recruit");
		
	   
		
		  CarpoolDTO dto = new CarpoolDTO(); 
		  
		  dto.setContent(content);
		  dto.setTtime(ttime); 
		  dto.setDeparturescity(departuresCity);
		  dto.setDepartures(departures); 
		  dto.setArrivalscity(arrivalsCity);
		  dto.setArrivals(arrivals); 
		  dto.setFee(fee); 
		  dto.setRecruit(recruit);
		  
		  CarpoolDAO dao = new CarpoolDAO();
		  
		  
		  System.out.println(dto.getTtime());
		  
		  int result = dao.add(dto);
		  
		  if (result == 1) { resp.sendRedirect("/wood/carpool/list.do"); } else {
		  PrintWriter writer = resp.getWriter();
		  writer.print("<script>alert('failed');history.back();</script>");
		  writer.close(); }
		 
	    
	}

}




	