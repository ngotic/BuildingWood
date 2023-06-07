package com.project.wood.board.teach;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;

/*
public class UserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserDAO() {

		this.conn = DBUtil.open("localhost", "team", "java1234");

	}

	public UserDTO login(UserDTO dto) {

		try {

			String sql = "select * from tblMember where id = ? and password = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());

			rs = pstat.executeQuery();

			if (rs.next()) {

				UserDTO result = new UserDTO();

				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setNickname(rs.getString("nickname"));
				//result.setPw(rs.getString("password"));
				//result.setBirth(rs.getString("birth"));
				//result.setGender(rs.getString("gender"));
				//result.setEmail(rs.getString("email"));
				//result.setTel(rs.getString("tel"));
				//result.setLv(rs.getString("lv"));
				//result.setProfile(rs.getString("profile"));
				//result.setBan(rs.getString("ban"));
				//result.setPoint(rs.getString("point"));

				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}*/
