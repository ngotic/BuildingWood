package com.project.wood.hobbyclub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.wood.hobbyclub.repository.ClubDAO;
import com.project.wood.hobbyclub.repository.ClubDTO;

@WebServlet("/club/addclub.do")
public class AddClub extends HttpServlet {
	
	ClubDAO cdao = new ClubDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddClub.java
		String id = "WJssd875"; 
		String building = "한독빌딩";
		req.setAttribute("id",id);
		req.setAttribute("building",building);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/club/addclub.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			System.out.println("this is upload");
			
			MultipartRequest multi = new MultipartRequest(
					req,
					req.getRealPath("/clubupload"),
					1024*1024*100,
					"UTF-8",
					new DefaultFileRenamePolicy());
			
			System.out.println(req.getRealPath("/clubupload"));
			String id       = multi.getParameter("id");
			String name     = multi.getParameter("name");
			String intro    = multi.getParameter("intro");
			String amount   = multi.getParameter("amount");
			String opendate = multi.getParameter("opendate");
			String pic      = multi.getFilesystemName("pic");
			
			ClubDTO cdto = new ClubDTO();
			
			cdto.setId(id);
			cdto.setName(name);
			cdto.setIntro(intro);
			cdto.setAmount(amount);
			cdto.setOpendate(opendate);
			cdto.setPic(pic);
			
			System.out.println("cdto is "+cdto);
			
			int result      = cdao.addClub(cdto);
			
			if(result == 1 ) {
				resp.sendRedirect("/wood/club/club.do");
			} else {
				PrintWriter writer = resp.getWriter();
				resp.setCharacterEncoding("UTF-8");
				writer.print("<script>alert('failed.'); history.back();</script>");
				writer.close();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}	

}