package com.project.wood.carpool;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.carpool.repository.CarpoolDAO;
import com.project.wood.carpool.repository.CarpoolDTO;

@WebServlet("/carpool/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CarpoolDAO dao = new CarpoolDAO();
	    ArrayList<CarpoolDTO> list = dao.list();
	    req.setAttribute("list", list);
	    
	    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/carpool/list.jsp");
	    dispatcher.forward(req, resp);

	}
	

}
