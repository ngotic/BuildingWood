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

import org.json.simple.JSONObject;

import com.project.wood.admin.repository.BuildingAdminDAO;
import com.project.wood.admin.repository.MemberInBuildingDTO;


// 유저를 밴때림
@WebServlet("/admin/adminuserban.do")
public class UserAdminBan extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//UserAdminList.java
		// 유저의 id를 받으면 iv와 ban을 업데이트 시킨다.
		// lv는 -1
		// ban은 true
		String id = req.getParameter("id");
		int result = dao.adminUserBan(id);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		resp.setContentType("application/json"); 
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close(); 

	}

}