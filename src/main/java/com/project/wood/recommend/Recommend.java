package com.project.wood.recommend;

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

import com.project.wood.recommend.repository.RecommendDAO;
import com.project.wood.recommend.repository.RecommendDTO;

@WebServlet("/recommend/recommend.do")
public class Recommend extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		test(req,resp);

}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		test(req,resp);

}

	private void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Recommend.java

				HttpSession session = req.getSession();
				System.out.println("id: " + (String)session.getAttribute("id") + ", nickname: " + (String)session.getAttribute("nickname") + ", lv: " + (String)session.getAttribute("lv") + ", location: " + (String)session.getAttribute("location"));
				//읽음 제어
				session.setAttribute("read", "n");
				//'서울시 강남구'
				String loc = (String)session.getAttribute("location");
				
				//페이징
				String page = req.getParameter("page");
				int nowPage = 0;	//현재페이지 번호
				int totalCount = 0;	//총 게시물 수
				int pageSize = 9;	//한 페이지에서 출력할 게시물 수
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
				
				//2가지 용도로 호출
				//1. 일반 목록 보기 > board.do
				//2. 검색 결과 보기 > board.do?column=subject&word=test
				
				String column = req.getParameter("column");
				String word = req.getParameter("word");
				String search = "n"; //검색중인지 아닌지 확인
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				
				if ((column == null && word == null)
			             || (column.endsWith("") && word.equals(""))) {
			         search = "n";
			      } else {
			         search = "y";
			      }
				
				//System.out.println("search" + search);
				
				map.put("column", column);
				map.put("word", word);
				map.put("search", search);
				
				//페이징
				map.put("begin", begin + "");
				map.put("end", end + "");
				
				//목록 내용
				RecommendDAO dao = new RecommendDAO();
				
				List<RecommendDTO> list = dao.list(map, loc);
				
				for (RecommendDTO dto : list) {
					//제목태그 이스케이프
					String subject = dto.getTitle();
					String content = dto.getContent();
					subject = subject.replace("<", "&lt;").replace(">", "&gt;");
					
					//제목에서 검색 중 > 검색어 강조 기능
					if (search.equals("y") && column.equals("title")) {
						subject = subject.replace(word, "<span style=\"background-color:gold; \">" + word + "</span>");
					}
					if (search.equals("y") && column.equals("content")) {
						content = content.replace(word, "<span style=\"background-color:gold; \">" + word + "</span>");
					}
					
					
					dto.setTitle(subject);
					dto.setContent(content);
				
				}
				
				
				//페이징
				//총 게시물 수 256 >> 총 페이지 수? 256 / 10 = 25.6 >(올림) 26페이지
				totalCount = dao.getTotalCount(map, loc);
				totalPage = (int)Math.ceil((double)totalCount / pageSize);
				
				//페이징
				StringBuilder sb = new StringBuilder();
				
				loop = 1; //루프변수(10바퀴)
				n = ((nowPage - 1) / blockSize) * blockSize + 1; //페이지 번호
				
				//이전 10페이지
				if (n == 1) {
					sb.append(String.format(" <li class=\"page-item\"><a href=\"#!\" class=\"page-link disabled\" style=\"padding: 6px 11px; \"> < </a></li> ", blockSize));
				} else {
					sb.append(String.format(" <li class=\"page-item\"><a href=\"/wood/recommend/recommend.do?page=%d\" class=\"page-link\" style=\" padding: 6px 11px;\"> < </a></li> ", n - 1, blockSize));
				}
				
				while (!(loop > blockSize || n > totalPage)) {
					
					if (n == nowPage) {
						sb.append(String.format(" <li class=\"page-item\"><a href=\"#!\" class=\"page-link active\">%d</a></li> ", n));
					} else {
						sb.append(String.format(" <li class=\"page-item\"><a href=\"/wood/recommend/recommend.do?page=%d\" class=\"page-link\">%d</a></li> ", n, n));
					}
					loop++;
					n++;
				}
				
				//다음 10페이지
				if (n > totalPage) {
					sb.append(String.format(" <li class=\"page-item\"><a href=\"#!\" class=\"page-link disabled\" style=\"padding: 6px 11px; \"> > </a></li> ", blockSize));
					
				} else {
					sb.append(String.format(" <li class=\"page-item\"><a href=\"/wood/recommend/recommend.do?page=%d\" class=\"page-link\" style=\"padding: 6px 11px; \"> > </a></li> ", n, blockSize));
				}
				
				
				req.setAttribute("list", list);
				req.setAttribute("map", map);
				req.setAttribute("totalCount", totalCount);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("nowPage", nowPage);
				req.setAttribute("pagination", sb);
				
				
				//JSP 호출
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/recommend/recommend.jsp");
				dispatcher.forward(req, resp);

			}//test
		
	
	
	
	
	
	}












