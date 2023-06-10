package com.project.wood.suggest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.suggest.repository.SuggestDAO;
import com.project.wood.suggest.repository.SuggestDTO;

@WebServlet("/suggest/suggest.do")
public class Suggest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		test(req, resp);
		
	}//get
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		test(req, resp);
	
	}//post


	private void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Support.java
		HttpSession session = req.getSession();
		
		session.setAttribute("read", "n");
		
		//페이징
		String page = req.getParameter("page");
		int nowPage = 0;	//현재페이지 번호
		int totalCount = 0;	//총 게시물 수
		int pageSize = 10;	//한 페이지에서 출력할 게시물 수
		int totalPage = 0;	//총 페이지 수
		int begin = 0;
		int end = 0;
		int n = 0;
		int loop = 0;
		int blockSize = 10; //한번에 보여질 페이지 개수(아래바)                                                                                                                                                                                                                      
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		//검색
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; //검색중인지 아닌지 확인
		
		HashMap<String, String> smap = new HashMap<String, String>();
		
		
		if ((column == null && word == null)
	             || (column.endsWith("") && word.equals(""))) {
	         search = "n";
	      } else {
	         search = "y";
	      }
		
		smap.put("column", column);
		smap.put("word", word);
		smap.put("search", search);
		
		//페이징
		smap.put("begin", begin + "");
		smap.put("end", end + "");
		
		//목록 내용
		SuggestDAO dao = new SuggestDAO();
		
		List<SuggestDTO> list = dao.list(smap);
		
		for (SuggestDTO dto : list) {
			//제목태그 이스케이프
			String subject = dto.getTitle();
			String nickname = dto.getNickname();
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");
			
			//제목에서 검색 중 > 검색어 강조 기능
			if (search.equals("y") && column.equals("title")) {
				subject = subject.replace(word, "<span style=\"background-color:gold; \">" + word + "</span>");
			}
			if (search.equals("y") && column.equals("nickname")) {
				nickname = nickname.replace(word, "<span style=\"background-color:gold; \">" + word + "</span>");
			}
			
			dto.setTitle(subject);
			dto.setNickname(nickname);
		}
		
		
		//총 게시물 수 256 >> 총 페이지 수? 256 / 10 = 25.6 >(올림) 26페이지
		totalCount = dao.getTotalCount(smap);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		//페이징
		StringBuilder sb = new StringBuilder();
		
		loop = 1; //루프변수(10바퀴)
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //페이지 번호
		
		//이전 10페이지
		if (n == 1) {
			sb.append(String.format(" <li class=\"page-item\"><a href=\"#!\" class=\"page-link disabled\" style=\"padding: 6px 11px; \"> < </a></li> ", blockSize));
		} else {
			sb.append(String.format(" <li class=\"page-item\"><a href=\"/wood/suggest/suggest.do?page=%d\" class=\"page-link\" style=\" padding: 6px 11px;\"> < </a></li> ", n - 1, blockSize));
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				sb.append(String.format(" <li class=\"page-item\"><a href=\"#!\" class=\"page-link active\">%d</a></li> ", n));
			} else {
				sb.append(String.format(" <li class=\"page-item\"><a href=\"/wood/suggest/suggest.do?page=%d\" class=\"page-link\">%d</a></li> ", n, n));
			}
			loop++;
			n++;
		}
		
		//다음 10페이지
		if (n > totalPage) {
			sb.append(String.format(" <li class=\"page-item\"><a href=\"#!\" class=\"page-link disabled\" style=\"padding: 6px 11px; \"> > </a></li> ", blockSize));
			
		} else {
			sb.append(String.format(" <li class=\"page-item\"><a href=\"/wood/suggest/suggest.do?page=%d\" class=\"page-link\" style=\"padding: 6px 11px; \"> > </a></li> ", n, blockSize));
		}
		
		
		req.setAttribute("list", list);
		req.setAttribute("smap", smap);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pagination", sb);
		
		
		
		//JSP 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/suggest/suggest.jsp");
		dispatcher.forward(req, resp);
	}//test()
	
	
}















