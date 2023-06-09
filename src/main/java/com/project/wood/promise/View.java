package com.project.wood.promise;

import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/promise/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();


		
		PromiseDAO dao = new PromiseDAO();
		PromiseDTO dto = new PromiseDTO();
		ReplyDTO rdto = new ReplyDTO();
		
		String promiseseq = req.getParameter("promiseseq");
		
		java.util.List<PromiseDTO> list = dao.list();
		
		dto = dao.getpost(promiseseq);
		
		ArrayList<String> tag = dao.getTag(promiseseq);
		
		dto.setTag(tag);
		
		

		
		req.setAttribute("list", list);
		
		req.setAttribute("dto", dto);
		
		req.setAttribute("promiseseq", promiseseq);
		
		

		
		
		
		java.util.List<ReplyDTO> rlist = dao.rlist(promiseseq);
		
		req.setAttribute("rlist", rlist);
		
		
		 ArrayList<ReplyDTO> acceptnickname = dao.getAcceptnickname(promiseseq);
//		 rdto.setAcceptnickname(acceptnickname);
		 System.out.println(acceptnickname);
		 
		 req.setAttribute("acceptnickname", acceptnickname);

		 
		 String nickname = req.getParameter("nickname");
		 
		 
		 
		 int adminnum = dao.adminnum(promiseseq);
		 req.setAttribute("adminnum", adminnum);
		 
		 
		 

		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/promise/view.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PromiseDAO dao = new PromiseDAO();
		
		java.util.List<PromiseDTO> list = dao.list();
		
		req.setAttribute("list", list);	
	
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/promise/view.jsp");
		dispatcher.forward(req, resp);
		

	}
	
//	protected void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		
//		PromiseDAO dao = new PromiseDAO();
//		
//		java.util.List<PromiseDTO> list = dao.list();
//		
//		req.setAttribute("list", list);
//	
//		
//		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/promise/view.jsp");
//		dispatcher.forward(req, resp);
//		
//		
//	}
	
	

}
