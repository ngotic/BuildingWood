package com.project.wood.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.project.wood.user.valid.Type;
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
				result.setBan(rs.getString("ban"));

				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int checkUserInput(String data, Type utype) {
		//utype.EMAIL;
		try {
			
			String sql="";
		
			if(utype==utype.EMAIL) {
				sql = "select count(*) as cnt from tblMember where email = ?";
			} else if(utype==utype.ID){
				sql = "select count(*) as cnt from tblMember where id = ?";
			} else if(utype==utype.NICKNAME){
				sql = "select count(*) as cnt from tblMember where nickname = ?";
			} 
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, data);
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int registerMember(UserDTO dto) {

		try {
			System.out.println(dto);
			String sql = "insert into tblMember(id,"
					+ " password,"
					+ " name,"
					+ " nickname,"
					+ " birth,"
					+ " gender,"
					+ " email,"
					+ " tel,"
					+ " profile) values(?, ?, ?, ?, ?, ?, ?, ?,? )";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPassword());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getNickname());
			pstat.setString(5, dto.getBirth());
			pstat.setString(6, dto.getGender());
			pstat.setString(7, dto.getEmail());
			pstat.setString(8, dto.getTel());
			
			if (dto.getProfile() == null) {
				pstat.setString(9, "profile.jpg");
			}  
			else {
				pstat.setString(9, dto.getProfile());
			}

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int registerAddressMember(UserDTO dto) {
		
		try {
			String sql = "insert into tblAddress values(addressseq.nextVal, ?, ?, 'T')";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getBuildseq());
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int checkUserInput(String id, String email) {
		
		try {

			String sql = "select count(*) as cnt from tblMember where id = ? and email =?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, email);
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int changePw(String email, String pw) {
		
		try {
			String sql = "update tblMember set password= ? where email=?";
		
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, pw);
			pstat.setString(2, email);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public UserDTO existMember(String id) {
		
		String sql = "select * from tblMember where id =?";
		
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				UserDTO result = new UserDTO();
				// 이정도만 넘기자 
				result.setId(rs.getString("id"));
				result.setNickname(rs.getString("nickname"));
				result.setLv(rs.getString("lv"));
				result.setBan(rs.getString("ban"));
				return result;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

}
