package com.project.wood.sns.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;




public class SnsDAO {
	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;
	
	public SnsDAO() {
		this.conn= new DBConnect().getConn();
	}
	
	public SnsDTO getSNSList() {
		
		try {

			/*
			 * String sql =
			 * "select m.profile ,m.nickname ,b.content, b.regdate , b.editdate from tblSnsBoard b inner join tblMember m on b.id = m.id"
			 * ;
			 */
			String sql = "select * from tblsnsboard";
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			if (rs.next()) {
				SnsDTO dto = new SnsDTO();
				
				dto.setSnsboardseq(rs.getString("snsboardseq"));
				dto.setId(rs.getString("id"));
				dto.setBoardcategoryseq(rs.getString("boardcategoryseq"));
				dto.setBuildingseq(rs.getString("buildingseq"));
				dto.setContent(rs.getString("content"));
				/*
				 * dto.setProfile(rs.getString("m.profile"));
				 * dto.setNickname(rs.getString("m.nickname"));
				 * dto.setContent(rs.getString("b.content"));
				 * dto.setRegdate(rs.getString("b.regdate"));
				 * dto.setEditdate(rs.getString("b.editdate"));
				 */
				
				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("¿¡·¯");
		}
		
		return null;
	}
}
