package com.project.wood.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.wood.user.repository.BuildingInfoDAO;
import com.project.wood.user.repository.UserDAO;
import com.project.wood.user.repository.UserDTO;

@WebServlet("/user/socialregister.do")
public class SocialRegister extends HttpServlet {
	
	private UserDAO dao = new UserDAO();
	private BuildingInfoDAO bdao = new BuildingInfoDAO();
	
	private String addZero(String in) {
		return in.length() == 1 ? '0' + in : in;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//SocialRegister.java
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String profile = req.getParameter("profile");
		
		
		
		List<Map<String, String>> blist = bdao.getBuildingInfo();
		req.setAttribute("buildinglist", blist);
		
		req.setAttribute("id", id);
		req.setAttribute("email", email);
		req.setAttribute("name", name);
		req.setAttribute("profile", profile);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/socialregister.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String nickname = req.getParameter("nickname");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		String profile = req.getParameter("profile");
		String building = req.getParameter("building");
		UserDTO dto = new UserDTO();
		System.out.println(">>"+name+profile+year+month+day);
		dto.setId(id);
		dto.setPassword(pw);
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setGender(gender);
		dto.setBirth(year + "-" + addZero(month) + "-" + addZero(day));
		dto.setEmail(email);
		dto.setTel(tel);
		dto.setProfile(profile);
		dto.setBuildseq(building);
		
		int result1 = dao.registerMember(dto);
		int result2 = dao.registerAddressMember(dto);
		result2 *= result1;
		JSONObject obj = new JSONObject();
		obj.put("result", result2);
		resp.setContentType("application/json");

		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();
		
	}

}