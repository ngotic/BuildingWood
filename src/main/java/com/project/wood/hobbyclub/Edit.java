package com.project.wood.hobbyclub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.hobbyclub.repository.ClubBoardDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;

@WebServlet("/club/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Edit.java
		ClubDAO cdao = new ClubDAO();
		String hseq = req.getParameter("hseq");
		String id = (String)req.getSession().getAttribute("id"); // > 현재 세션 
		ClubBoardDTO cbdto= cdao.readClubBoard(hseq, id);  
		// 동호회원이면 평가를 달 수 있다.  
		req.setAttribute("cbdto", cbdto);
		System.out.println(cbdto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/edit.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("post club : ");
		//Edit.java
		String hobbyclubseq = req.getParameter("hobbyclubseq");
		String clubseq = req.getParameter("clubseq");
		String recruits = req.getParameter("recruits");
		String openregdate= req.getParameter("openregdate");
		String closeregdate= req.getParameter("closeregdate");
		String content=req.getParameter("content");
		System.out.println(hobbyclubseq+clubseq+recruits+openregdate+closeregdate+content);
		
		ClubDAO cdao = new ClubDAO();
		ClubBoardDTO cbDto = new ClubBoardDTO();
		
		System.out.println(1);
		cbDto.setHobbyclubseq(hobbyclubseq);
		cbDto.setClubseq(clubseq);
		cbDto.setRecruits(recruits);
		cbDto.setOpenregdate(openregdate);
		cbDto.setCloseregdate(closeregdate);
		cbDto.setContent(content);
		
		int result = cdao.updateClubBoard(cbDto);
		
		System.out.println(2);
		if(result == 1 ) {
			resp.sendRedirect("/wood/club/club.do");
		} else {
			PrintWriter writer = resp.getWriter();
			resp.setCharacterEncoding("UTF-8");
			writer.print("<script>alert('failed.'); history.back();</script>");
			writer.close();
		}
	}
	
}
