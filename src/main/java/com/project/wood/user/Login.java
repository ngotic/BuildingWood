package com.project.wood.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.repository.UserDAO;
import com.project.wood.user.repository.UserDTO;



@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Login.java
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		System.out.println("id : "+id);
		System.out.println("password : "+password);
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPassword(password);
		
		UserDAO dao = new UserDAO();
		
		//1.  비밀번호, 아아디 db에 있나 확인하기.
		//2.  있으면 성공  
		UserDTO result = dao.login(dto);
		//3. 없으면 fail
		
		if (result != null) {
			// 로그인 성공, requset 객체가 session을 가지고 있다. 
			req.getSession().setAttribute("id", id);
			req.getSession().setAttribute("lv", result.getLv());
			req.getSession().setAttribute("nickname", result.getNickname());
			resp.sendRedirect("/wood/club/club.do");
		} else {
			// 로그인 실패
			PrintWriter writer = resp.getWriter();
			resp.setCharacterEncoding("UTF-8");
			writer.print("<script>alert('failed.'); history.back();</script>");
			writer.close();
		}
	
	}

}