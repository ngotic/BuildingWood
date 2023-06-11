package com.project.wood.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.wood.user.repository.UserDTO;


// 관리자용도 유저용도 공용으로 썼으면 좋겠음
@WebServlet("/mypage/mypage.do") // 이용자 정보는 마이페이지 
public class Mypage extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		MypageDTO dto = new MypageDTO();
		MypageDAO dao = new MypageDAO();
		
		String id = (String)session.getAttribute("id");
		
		dto = dao.getInfo(id);
		
		
		req.setAttribute("dto", dto);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Admin.java
		
		HttpSession session = req.getSession();
		
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
											
											req,
											req.getRealPath("/asset/profilepic_ah"),
											1024 * 1024 * 10,
											"UTF-8",
											new DefaultFileRenamePolicy()
					
									);
			
			System.out.println(req.getRealPath("/asset/profilepic_ah"));
			
			String name = multi.getParameter("name");
			String nickname = multi.getParameter("nickname");
			String pic= multi.getFilesystemName("pic");
			
			UserDTO dto = new UserDTO();
			

			dto.setName(name);
			dto.setNickname(nickname);
			dto.setProfile(pic);
			dto.setId((String)session.getAttribute("id"));

			MypageDAO dao = new MypageDAO();
			
			int result = dao.editProfile(dto);
			
			if (result == 1) {
				resp.sendRedirect("/wood/mypage/mypage.do");
				System.out.println("성공");
			} else {
				//수정 실패
				
				req.setAttribute("msg", "editfail");
				
				doGet(req,resp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
