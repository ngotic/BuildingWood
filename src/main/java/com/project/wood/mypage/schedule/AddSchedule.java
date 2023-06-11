package com.project.wood.mypage.schedule;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.my.DBUtil;

@WebServlet("/mypage/addschedule.do")
public class AddSchedule extends HttpServlet {

	ScheduleDAO dao = new ScheduleDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//AddSchedule.java
		String category = req.getParameter("category");
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		try {
			Date sdate = (Date)formatter.parse(startdate);
			startdate = formatter.format(sdate);
			Date edate = (Date)formatter.parse(enddate);
			enddate = formatter.format(edate);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		ScheduleDTO dto = new ScheduleDTO();
		System.out.println(startdate+ enddate);
		dto.setCategory(category);
		dto.setId(id);
		dto.setTitle(title);
		dto.setStartdate(startdate);
		dto.setEnddate(enddate);
		
		System.out.println(dto);
		JSONObject obj = new JSONObject();
		int result = dao.addSchedule(dto);
		
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
