package com.project.wood.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.wood.user.repository.BuildingInfoDAO;
import com.project.wood.user.repository.UserDAO;
import com.project.wood.user.repository.UserDTO;
import com.test.my.DBUtil;

/*<form id="form1" action="/wood/user/register.do" method="POST">*/
@WebServlet("/user/register.do")
public class Register extends HttpServlet {
	
	private UserDAO dao = new UserDAO();
	private BuildingInfoDAO bdao = new BuildingInfoDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Register.java
		// 건물 정보 다 넘겨줘야 함
		List<Map<String, String>> blist = bdao.getBuildingInfo();
		req.setAttribute("buildinglist", blist);
		/* System.out.println(blist); */
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
		dispatcher.forward(req, resp);

	}

	private String addZero(String in) {
		return in.length() == 1 ? '0' + in : in;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/profileupload"), 1024 * 1024 * 100,
				"UTF-8", new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String gender = multi.getParameter("gender");
		String nickname = multi.getParameter("nickname");

		String year = multi.getParameter("year");
		String month = multi.getParameter("month");
		String day = multi.getParameter("day");

		String email = multi.getParameter("email");
		String tel = multi.getParameter("tel");
		String profile = multi.getFilesystemName("profile");
		String building = multi.getParameter("building");
		System.out.println(id + "," + pw + "," + name + "," + gender + "," + nickname);
		System.out.println(year + "," + month + "," + day + "," + email + "," + tel + "," + profile);

		// 회원가입 > 소셜 로그인 사용자 회원 가입도
		UserDTO dto = new UserDTO();

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

		System.out.println(dto);

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
