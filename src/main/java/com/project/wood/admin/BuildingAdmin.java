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
import com.project.wood.admin.repository.BuildingAdminDTO;

@WebServlet("/admin/adminbuilding.do")
public class BuildingAdmin extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//BuildingAdmin.java
		
		List<BuildingAdminDTO> blist = dao.buildingList();
		System.out.println(blist);
		req.setAttribute("blist", blist);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminbuilding.jsp");
		dispatcher.forward(req, resp);

	}

}