package com.project.wood.hobbyclub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.hobbyclub.repository.ClubBoardDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;
import com.project.wood.hobbyclub.repository.ClubDTO;

@WebServlet("/club/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Add.java
		
		ClubDAO cdao = new ClubDAO();
		String id = "nqeFKf555"; 
		ClubDTO cdto= cdao.readMemberClub(id); // 1. 그 회원이 개설한 동호회 정보 꺼내줘 ~ 
		req.setAttribute("cdto", cdto);
		System.out.println(cdto);
		// req.setAttribute("id", "owFSkN242");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/add.jsp");
		dispatcher.forward(req, resp);
	}
	
	// 동호회 게시글 등록
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("post club : ");
		//Add.java
		String clubseq = req.getParameter("clubseq");
		String recruits = req.getParameter("recruits");
		String openregdate= req.getParameter("openregdate");
		String closeregdate= req.getParameter("closeregdate");
		String content=req.getParameter("content");
		ClubDAO cdao = new ClubDAO();
		ClubBoardDTO cbDto = new ClubBoardDTO();
		cbDto.setClubseq(clubseq);
		cbDto.setRecruits(recruits);
		cbDto.setOpenregdate(openregdate);
		cbDto.setCloseregdate(closeregdate);
		cbDto.setContent(content);
		
		int result = cdao.addClubBoard(cbDto);
		req.setAttribute("result", result);
		
		if(result == 1 ) {
			resp.sendRedirect("/wood/club/club.do");
		} else {
			PrintWriter writer = resp.getWriter();
			resp.setCharacterEncoding("UTF-8");
			writer.print("<script>alert('failed.'); history.back();</script>");
			writer.close();
		}
	}
};