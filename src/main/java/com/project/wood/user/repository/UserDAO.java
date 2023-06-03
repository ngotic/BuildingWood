package com.project.wood.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;

public class UserDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO(){
		this.conn = DBUtil.open();
	}

	public UserDTO login(UserDTO dto) {
		try {
			String sql = "select * from tblMember where id = ? and password = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPassword());
			
			rs = pstat.executeQuery();
			
			
			if (rs.next()) {
				UserDTO result = new UserDTO();
				// 이정도만 넘기자 
				result.setId(rs.getString("id"));
				result.setNickname(rs.getString("nickname"));
				result.setLv(rs.getString("lv"));

				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	
}
