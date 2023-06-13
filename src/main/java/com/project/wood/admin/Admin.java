package com.project.wood.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.user.valid.MailSender;


// 관리자용도 유저용도 공용으로 썼으면 좋겠음
@WebServlet("/admin/admin.do")
public class Admin extends HttpServlet {
	
	private int number;// 이렇게 전역변수 보관하고 있으면 된다.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Admin.java
		System.out.println("s"+number);
		number++;
	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp");
		dispatcher.forward(req, resp);

	}

}
