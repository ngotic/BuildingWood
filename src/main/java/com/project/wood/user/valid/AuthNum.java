package com.project.wood.user.valid;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.util.ApiKeyHolder;

@WebServlet("/user/authnum.do")
public class AuthNum extends HttpServlet {

	private int realauthnum; 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String authnum = req.getParameter("authnum");
		String real = realauthnum+"";
		JSONObject obj = new JSONObject();
		PrintWriter writer = resp.getWriter();
		if (real.equals(authnum)) {
			obj.put("result", 1);
			//일치가 되면 이제 authnum session에 저장
			req.getSession().setAttribute("authnum", authnum);
		}
		else 
			obj.put("result", 0);
		
		writer.print(obj);
		writer.close(); 
	}
	
	
	// 메일전송
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		System.out.println(email);
		realauthnum = MailSender.sender(ApiKeyHolder.getEmailKey(getServletContext().getRealPath("/")), email);
		System.out.println(email+"에게 인증번호발송"+realauthnum);
		JSONObject obj = new JSONObject();
		obj.put("result", 1);
		resp.setContentType("application/json"); 
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close(); 
		
	}

}