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
import com.project.wood.hobbyclub.repository.ClubDTO;


// 1. 내가 가입신청한 동아리
// 2. 내가 가입한 동아리

// 1. 개설 동호회 만들어놓고 > 동호회명
//  . 개설날짜
// 2. 동호회 명단 만들고 > 10명  
// 3. todo : 회원이 속한 빌딩의 동호회만 불러온다. 

// 4. todo : NickName 처리 

// 그 회원이 사는 건물의 동아리들이 나와야 한다. 
@WebServlet("/club/club.do") // 클럽 리스트 출력 
public class Club extends HttpServlet {

	ClubDAO cdao = new ClubDAO();
	ClubDAO cbdao = new ClubDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// club.java
		// List<ClubDTO> list = cdao.list(); // 이건 add에서만 
		//cbdao
		String id = (String)req.getSession().getAttribute("id"); 
		List<ClubBoardDTO> cblist = cbdao.boardlist(id);
		
		//list.stream().filter(null);
		//cblist = cbdao.statuscheck(cblist);
		System.out.println(cblist);
		
		req.setAttribute("id",id);
		req.setAttribute("cblist", cblist);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/club.jsp");
		dispatcher.forward(req, resp);

	}

}