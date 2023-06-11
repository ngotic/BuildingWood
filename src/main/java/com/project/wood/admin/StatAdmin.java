package com.project.wood.admin;

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

import com.project.wood.admin.repository.BuildingAdminDAO;


@WebServlet("/admin/adminstat.do")
public class StatAdmin extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//StatAdmin.java
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminstat.jsp");
		dispatcher.forward(req, resp);
	}

}
