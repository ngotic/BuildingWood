package com.project.wood.mypage.schedule;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/mypage/schedulelist.do")
public class ScheduleList extends HttpServlet {
	
	ScheduleDAO dao = new ScheduleDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//ScheduleList.java
		String id = req.getParameter("id");
		
		List<ScheduleDTO> list = dao.listSchdule(id);
		JSONArray arr = new JSONArray();
		
		for(  ScheduleDTO dto : list ) {
			JSONObject obj = new JSONObject();
			obj.put("scheduleseq", dto.getScheduleseq());
			obj.put("category", dto.getCategory());
			obj.put("title", dto.getTitle());
			obj.put("start", dto.getStartdate());
			obj.put("end", dto.getEnddate());
			arr.add(obj);
		}
		
		System.out.println(arr);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer;
		writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		

	}

}