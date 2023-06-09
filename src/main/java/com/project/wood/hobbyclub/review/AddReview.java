package com.project.wood.hobbyclub.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.hobbyclub.repository.ClubAssessmentDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;

@WebServlet("/club/addreview.do")
public class AddReview extends HttpServlet {
	
	ClubDAO cdao = new ClubDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddReview.java
		String clubseq = req.getParameter("clubseq");
		String score = req.getParameter("score");
		String review = req.getParameter("review");
		String id = req.getParameter("id");
		System.out.println(clubseq+","+ score+","+review+","+id);
		
		ClubAssessmentDTO dto = new ClubAssessmentDTO();
		dto.setClubseq(clubseq);
		dto.setScore(score);
		dto.setReview(review);
		dto.setId(id);
		
		JSONObject obj = new JSONObject();
		int result= cdao.addReview(dto);
		
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