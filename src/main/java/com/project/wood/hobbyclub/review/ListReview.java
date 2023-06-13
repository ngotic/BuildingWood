package com.project.wood.hobbyclub.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.wood.hobbyclub.repository.ClubAssessmentDTO;
import com.project.wood.hobbyclub.repository.ClubBoardDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;


@WebServlet("/club/listreview.do")
public class ListReview extends HttpServlet {

	ClubDAO dao = new ClubDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ListReview.java
		
		String clubseq = req.getParameter("clubseq");
		JSONArray arr = new JSONArray();

		List<ClubAssessmentDTO> reviewlist = dao.listReview(clubseq);
		
		if( reviewlist != null ) {
			for(ClubAssessmentDTO dto : reviewlist) {
				JSONObject obj = new JSONObject();
				obj.put("clubassessmentseq", dto.getClubassessmentseq());
				obj.put("clubseq", dto.getClubseq());
				obj.put("id", dto.getId());
				obj.put("score", dto.getScore());
				obj.put("review", dto.getReview().trim());
				obj.put("nickname", dto.getNickname());
				arr.add(obj);
			}
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer;
		writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		
	}

}