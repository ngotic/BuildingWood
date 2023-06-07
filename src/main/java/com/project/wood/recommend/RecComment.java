package com.project.wood.recommend;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.recommend.repository.RecCommentDTO;
import com.project.wood.recommend.repository.RecommendDAO;

@WebServlet("/recommend/reccomment.do")
public class RecComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RecComment.java
		HttpSession session = req.getSession();
		
		String comment = req.getParameter("comment");
		String recommendseq = req.getParameter("recommendseq");
		String score = req.getParameter("reviewStar");
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		String restaurantseq = req.getParameter("restaurantseq");
		
		RecommendDAO dao = new RecommendDAO();
		RecCommentDTO cdto = new RecCommentDTO();
		
		cdto.setRecommendseq(recommendseq);
		cdto.setContent(comment);
		cdto.setId((String)session.getAttribute("id"));
		cdto.setCommentscore(score);
		
		int result = dao.addRecComment(cdto);
		

		if (result == 1) {	
			resp.sendRedirect("/wood/recommend/recommenddetail.do?recommendseq=" + recommendseq + "&column=" + column + "&word=" + URLEncoder.encode(word,"UTF-8") + "&search=" + search + "&restaurantseq=" + restaurantseq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}
}
















