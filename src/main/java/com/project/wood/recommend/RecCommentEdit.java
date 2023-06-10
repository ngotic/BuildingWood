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

import com.project.wood.recommend.repository.RecommendDAO;

@WebServlet("/recommend/reccommentedit.do")
public class RecCommentEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//RecCommentEdit.java

		String rcseq =  req.getParameter("rcseq");
		String content =  req.getParameter("content");
		String recommendseq =  req.getParameter("recommendseq");
		String restaurantseq =  req.getParameter("restaurantseq");
		String column =  req.getParameter("column");
		String word =  req.getParameter("word");
		String search =  req.getParameter("search");
		
		RecommendDAO dao = new RecommendDAO();
		
		int result = dao.editRecComment(rcseq, content);
		
		if (result == 1) {	
			resp.sendRedirect("/wood/recommend/recommenddetail.do?recommendseq=" + recommendseq + "&column=" + column + "&word=" + URLEncoder.encode(word,"UTF-8") + "&search=" + search + "&restaurantseq=" + restaurantseq);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();

		}
		
		
	}
}

