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

// 삭제가 안되니 모집종료
@WebServlet("/club/delete.do")
public class Delete extends HttpServlet {
	
	ClubDAO cdao = new ClubDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String hobbyclubseq = req.getParameter("hobbyclubseq");
		System.out.println(">>>>"+hobbyclubseq);
		int result = cdao.deleteClubBoard(hobbyclubseq);
		
		JSONObject obj = new JSONObject();
		
		if(result == 1 ) {
			obj.put("result", result);
			resp.setContentType("application/json"); 
			PrintWriter writer = resp.getWriter();
			writer.print(obj);
			writer.close(); 
			
		} else {
			PrintWriter writer = resp.getWriter();
			resp.setCharacterEncoding("UTF-8");
			writer.print("<script>alert('failed.'); history.back();</script>");
			writer.close();
		}
		
	
	}

}