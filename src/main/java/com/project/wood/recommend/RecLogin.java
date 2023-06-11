package com.project.wood.recommend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.recommend.repository.RecBuildingDTO;
import com.project.wood.recommend.repository.RecMemberDTO;
import com.project.wood.recommend.repository.RecommendDAO;


@WebServlet("/recommend/reclogin.do")
public class RecLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RecLogin.java

		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/recommend/reclogin.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//LoginOk.java
		
		//1. 데이터 가져오기
		//2. DB 작업 > 인증
		//3. 결과 > 인증 티켓
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		//포장
		RecMemberDTO dto = new RecMemberDTO();
		
		dto.setId(id);
		dto.setPassword(pw);
		
		RecommendDAO dao = new RecommendDAO();
		
		//dto : id, pw 전달
		//result : 로그인한 회원 정보 반환(아이디, 이름, 등급..) > 세션에 추가 목적
		RecMemberDTO result = dao.reclogin(dto);
		RecBuildingDTO bdto = dao.recmemberloc(id);
		
		if (result != null) {
			//로그인 성공
			//서블릿에서 session 객체 불러오는 법
			req.getSession().setAttribute("id", id); //인증 티켓 발급
			req.getSession().setAttribute("lv", result.getLv());
			req.getSession().setAttribute("nickname", result.getNickname());
			req.getSession().setAttribute("location", bdto.getAddress());
			
			//초기페이지로 보내기
			resp.sendRedirect("/wood/recommend/recommend.do");
			
		} else {
			//로그인 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
			
		}
		
		
	}//dopost
}

