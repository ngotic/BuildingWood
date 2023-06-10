package com.project.wood.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.admin.repository.BuildingAdminDAO;

// 밴한 유저를 복구시킨다.
@WebServlet("/admin/adminuserrecovery.do")
public class UserAdminRecovery extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		int result = dao.adminUserRecovery(id);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		resp.setContentType("application/json"); 
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close(); 
	}

}