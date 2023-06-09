package com.project.wood.hobbyclub;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.hobbyclub.repository.ClubBoardDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;
import com.project.wood.hobbyclub.repository.ClubRegisterDTO;


@WebServlet("/club/detail.do")
public class Detail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//View.java
		ClubDAO cdao = new ClubDAO();
		String hseq = req.getParameter("hseq");
		String id = (String)req.getSession().getAttribute("id"); // > 현재 세션 
		ClubBoardDTO cbdto= cdao.readClubBoard(hseq, id);  
		// 동호회원이면 평가를 달 수 있다.  
		// 여기다가 해당 클럽의 신청 목록 뿌리기
		List<ClubRegisterDTO> crlist = cdao.clubRegisterList(hseq);
		System.out.println(">>"+cbdto);
		req.setAttribute("crlist", crlist);
		req.setAttribute("cbdto", cbdto);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/detail.jsp");
		dispatcher.forward(req, resp);

	}

}