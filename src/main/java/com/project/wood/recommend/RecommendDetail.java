package com.project.wood.recommend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.recommend.repository.RecCommentDTO;
import com.project.wood.recommend.repository.RecImageDTO;
import com.project.wood.recommend.repository.RecMenuDTO;
import com.project.wood.recommend.repository.RecommendDAO;
import com.project.wood.recommend.repository.RecommendDTO;

@WebServlet("/recommend/recommenddetail.do")
public class RecommendDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RecommendDetail.java
		HttpSession session = req.getSession();
		//String loc = (String)session.getAttribute("location");
		
		String recommendseq = req.getParameter("recommendseq");
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		
		RecommendDAO dao = new RecommendDAO();
		
		//기본정보
		RecommendDTO dto = dao.get(recommendseq); 
		
		//메뉴(리스트, 갯수)
		String restaurantseq = req.getParameter("restaurantseq");
		List<RecMenuDTO> mlist = dao.mlist(restaurantseq);
		
		RecMenuDTO mcountdto = dao.menucount(restaurantseq);
		
		//이미지
		List<RecImageDTO> ilist = dao.ilist(restaurantseq);		

		//댓글 목록
		List<RecCommentDTO> clist = dao.clist(recommendseq);
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("mlist", mlist);
		req.setAttribute("mcountdto", mcountdto);
		req.setAttribute("ilist", ilist);
		req.setAttribute("clist", clist);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		req.setAttribute("search", search);
		
		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/recommend/recommenddetail.jsp");
		dispatcher.forward(req, resp);

	}//get
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//map.java (위경도 가져오기)
		//상세페이지 서버 연결
		//별점구현
//	
//		String seq = req.getParameter("recommendseq");
//		String lat = req.getParameter("lat");
//		String lng = req.getParameter("lng");
//		RecommendDAO dao = new RecommendDAO();
//
//		RecommendDTO dto = dao.get(seq); //기본정보
//		
//		
//		req.setAttribute("dto", dto);
		
	
	}
}



















