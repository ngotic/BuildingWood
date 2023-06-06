package com.project.wood.sns;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.sns.repository.SnsDAO;
import com.project.wood.sns.repository.SnsDTO;

@WebServlet("/snsmain.do")
public class SnsMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SnsDAO dao = new SnsDAO();
		List<SnsDTO> list = dao.getSNSList();
		
		List<SnsDTO> plist = dao.getPicList();
		
		req.setAttribute("plist", plist);
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/sns/snsmain.jsp");
		dispatcher.forward(req, resp);
		

	}

}