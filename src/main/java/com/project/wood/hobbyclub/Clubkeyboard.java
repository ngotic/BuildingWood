package com.project.wood.hobbyclub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.wood.hobbyclub.repository.ClubBoardDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;

@WebServlet("/club/clubkeyboard.do") 
public class Clubkeyboard extends HttpServlet {
	
	ClubDAO cdao = new ClubDAO();
	ClubDAO cbdao = new ClubDAO();
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// club.java
		// List<ClubDTO> list = cdao.list(); // 이건 add에서만 
		//cbdao
		String id = (String)req.getSession().getAttribute("id");
		String keyword = req.getParameter("keyword");
		String type = req.getParameter("type");
		System.out.println("test");
		
		// System.out.println("test > : "+id+keyword+type);
		
		List<ClubBoardDTO> cblist = cbdao.boardlist(id, keyword, type);
		
		JSONArray arr = new JSONArray();
		if( cblist != null ) {
			for(ClubBoardDTO dto : cblist) {
				JSONObject obj = new JSONObject();
				obj.put("hobbyclubseq", dto.getHobbyclubseq());
				obj.put("clupseq", dto.getClubseq());
				obj.put("name", dto.getName());
				obj.put("buildingname", dto.getBuildingname());
				obj.put("content", dto.getContent());
				obj.put("openregdate", dto.getOpenregdate());
				obj.put("closeregdate", dto.getCloseregdate());
				obj.put("recruits", dto.getRecruits());
				arr.add(obj);
			}
		}
		// System.out.println("test > "+arr);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer;
		writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		

	}


}
