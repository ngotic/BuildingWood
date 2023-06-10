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
import com.project.wood.admin.repository.BuildingAdminDTO;
import com.project.wood.admin.repository.MemberInBuildingDTO;

@WebServlet("/admin/adminbuildingdetail.do")
public class BuildingAdminDetail extends HttpServlet {
	
	BuildingAdminDAO dao = new BuildingAdminDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//BuildingAdminDetail.java
		String buildingseq = req.getParameter("buildingseq");
		System.out.println(buildingseq);
		// 이 빌딩의 상세정보와 이 빌딩에 사는 사람 정보를 보여줘
		BuildingAdminDTO bdto = dao.readBuildingInfo(buildingseq);// 1. 빌딩정보
		req.setAttribute("bdto", bdto);
		System.out.println(">>"+bdto);
		List<MemberInBuildingDTO> mlist = dao.listMemberInBuilding(buildingseq);
		req.setAttribute("mlist", mlist);
		// 글 작성 횟수
		//select ((select count(*) from tblopenstudy where id='oWOExL506') + (select count(*) from tblTeach  where id='oWOExL506') + (select count(*) from tblHobbyclub where clubseq = (select clubseq from tblclub  where id='oWOExL506')) + (select count(*) from tblCarpool where driverseq = 'oWOExL506') + (select count(*) from tblSnsboard where id = 'oWOExL506') + (select count(*) from tblSuggest where id = 'oWOExL506') + (select count(*) from tblpromise where writer = 'oWOExL506')) as boardcnt from dual;
		// 댓글 작성 회수
		//select 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/admin/adminbuildingdetail.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String buildingseq = req.getParameter("buildingseq");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		BuildingAdminDTO dto = new BuildingAdminDTO();
		dto.setBuildingseq(buildingseq);
		dto.setName(name);
		dto.setAddress(address);
		dto.setLat(lat);
		dto.setLng(lng);
		
		int result = dao.updateBuildingInfo(dto);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		System.out.println(">>>>>>"+dto+">"+result);
		resp.setContentType("application/json"); 
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close(); 
		
	}
	

}