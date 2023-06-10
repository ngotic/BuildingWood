package com.project.wood.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.admin.repository.BuildingAdminDAO;
import com.project.wood.admin.repository.MemberInBuildingDTO;

@WebServlet("/admin/adminuser.do")
public class UserAdmin extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//UserAdmin.java
		
		List<MemberInBuildingDTO> ulist =  dao.AllMemberList();
		req.setAttribute("ulist", ulist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminuser.jsp");
		dispatcher.forward(req, resp);

	}

}