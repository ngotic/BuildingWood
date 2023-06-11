package com.project.wood.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.project.wood.promise.repository.PromiseDTO;
import com.project.wood.user.repository.UserDTO;
import com.test.my.DBUtil;

public class MypageDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	public MypageDAO() {
		this.conn = DBUtil.open("13.124.238.159","team", "java1234");
	}


	public int editProfile(UserDTO dto) {
		
		
		try {
			
			String sql = "update tblMember set name = ?, nickname=?, profile=? where id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			System.out.println(sql);
			

			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getNickname());
			pstat.setString(3, dto.getProfile());
			pstat.setString(4, dto.getId());
			
			System.out.println(sql);

			
			return pstat.executeUpdate();
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}


	public MypageDTO getInfo(String id) {
		
		try {
			
			String sql = "select m.*, b.name as bname,  b.address as baddress from tblMember m inner join tblAddress a on a.id = m.id inner join tblBuilding b on b.buildingseq = a.buildingseq where m.id=?";
			
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();
			
			 while (rs.next()) {
		            
		            MypageDTO dto = new MypageDTO();
		            
		            dto.setId(rs.getString("id"));
		            dto.setPassword(rs.getString("password"));
		            dto.setName(rs.getString("name"));
		            dto.setNickname(rs.getString("nickname"));
		            dto.setBirth(rs.getString("birth"));
		            dto.setGender(rs.getString("gender"));
		            dto.setEmail(rs.getString("email"));
		            dto.setTel(rs.getString("tel"));
		            dto.setProfile(rs.getString("profile"));
		            dto.setBname(rs.getString("bname"));
		            dto.setBaddress(rs.getString("baddress"));

		            
		            
		            return dto;
		            
		         }
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	
	
	

}
