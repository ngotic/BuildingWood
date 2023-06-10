package com.project.wood.suggest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.suggest.repository.SuggestDAO;
import com.project.wood.suggest.repository.SuggestDTO;

@WebServlet("/suggest/suggestdetail.do")
public class SuggestDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//SuggestDetail.java
		HttpSession session = req.getSession();
		
		String suggestseq = req.getParameter("suggestseq");
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		
		SuggestDAO dao = new SuggestDAO();
		
		//조회수 증가
		if (session.getAttribute("read") == null || session.getAttribute("read").toString().equals("n")) {
			dao.updateSugReadCount(suggestseq);
			session.setAttribute("read", "y");
		}
		
		SuggestDTO dto = dao.getSuggest(suggestseq);
		
		String content = dto.getContent();
		
		//글 내용 개행문자 처리
		content = content.replace("<", "&lt;").replace(">", "&gt;");
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);
		
		//검색어 강조
		if (search.equals("y") && column.equals("content")) {
			content = content.replace(word, "<span style=\"background-color:gold;\">" + word + "</span>");
		
		}
		
		//제목태그 이스케이프
		String subject = dto.getTitle();
		subject = subject.replace("<", "&lt;").replace(">", "&gt;");
		dto.setTitle(subject);
		
		req.setAttribute("dto", dto);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		req.setAttribute("search", search);
		
		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/suggest/suggestdetail.jsp");
		dispatcher.forward(req, resp);
	}
}
















