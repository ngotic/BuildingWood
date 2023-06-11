package com.project.wood.admin.stats;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.wood.admin.repository.BuildingAdminDAO;

@WebServlet("/admin/genderratio.do")
public class GenderRatio extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String gender = req.getParameter("gender");
		//GenderRatio.java
		JSONObject obj = new JSONObject();
		obj = dao.getGenderRatio(obj, gender);
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PrintWriter writer;
		writer = resp.getWriter();
		writer.print(obj);
		writer.close();
	}

}