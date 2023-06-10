package com.project.wood.recommend;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.recommend.repository.RecommendDAO;

@WebServlet("/recommend/reccommentdel.do")
public class RecCommentDel extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RecCommentDel.java
		
		String rcseq = req.getParameter("rcseq");
		String recommendseq = req.getParameter("recommendseq");
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		String restaurantseq = req.getParameter("restaurantseq");
		
		RecommendDAO dao = new RecommendDAO();
		
		int result = dao.delRecComment(rcseq);
		
		if (result == 1) {	
			resp.sendRedirect("/wood/recommend/recommenddetail.do?recommendseq=" + recommendseq + "&column=" + column + "&word=" + URLEncoder.encode(word,"UTF-8") + "&search=" + search + "&restaurantseq=" + restaurantseq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();

		}
	}//
	
	
	
}

