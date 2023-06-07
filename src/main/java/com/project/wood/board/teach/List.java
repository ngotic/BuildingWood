package com.project.wood.board.teach;

import java.io.IOException;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/teach/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		
		TeachDAO dao = new TeachDAO();
		TeachDTO dto = new TeachDTO();

		java.util.List<TeachDTO> list = dao.list();

		HashSet<String> set = new HashSet<String>();
		HashSet<String> money = new HashSet<String>();
		
		for(int i=0; i<list.size(); i++) {
		
			set.add(list.get(i).getPlace());
			money.add(list.get(i).getPrice());
		}
		
		java.util.List<TeachDTO> alist = dao.apply(id);

		req.setAttribute("alist", alist);
		req.setAttribute("list", list);
		req.setAttribute("set", set);
		req.setAttribute("money", money);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/teach/list.jsp");
		dispatcher.forward(req, resp);

	}
}
