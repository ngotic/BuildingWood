package com.project.wood.hobbyclub;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.hobbyclub.repository.ClubDAO;


// 회원은 신청중이지 않아야 다른 동아리를 신청할 수 있나...? 

@WebServlet("/club/register.do")
public class Register extends HttpServlet {
	ClubDAO cdao = new ClubDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ClubRegister.java
		String hseq = req.getParameter("hseq");
		String seq = req.getParameter("seq");
		String id = req.getParameter("id");
		System.out.print(hseq+'+'+ seq+'+'+ id);
		JSONObject obj = new JSONObject();
	
		// 이미 가입중입니다. 
		int exist = cdao.existClubRegister(seq, id); // 이미 신청중이거나 이미 신청중이면 ... 가입불가
		
		int existList = cdao.existClubList(seq, id); // 클럽 리스트에 이미 있으면 .... 가입불가
		
		if ( exist == 0 && existList == 0) {
			
			int result = cdao.registerClub(hseq, id);
			System.out.println(1+">>"+exist+existList+result);
			obj.put("result", result);
		} else {
			System.out.println(2+exist+existList);
			obj.put("result", -1);
		}
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();

	}

}