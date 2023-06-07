package com.project.wood.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.user.valid.MailSender;
import com.project.wood.util.ApiKeyHolder;

@WebServlet("/user/findpw.do")
public class FindPw extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//FindPw.java
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/findpw.jsp");
		dispatcher.forward(req, resp);

	}
	


}