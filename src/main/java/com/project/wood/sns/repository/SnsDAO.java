package com.project.wood.sns.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;


public class SnsDAO {
	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;
	
	public SnsDAO() {
		this.conn =DBUtil.open("jdbc:oracle:thin:@localhost:1521:xe","team","java1234");
	}

	public SnsDTO getSNSList() {
		
		try {

			/*
			 * String sql =
			 * "select m.profile ,m.nickname ,b.content, b.regdate , b.editdate from tblSnsBoard b inner join tblMember m on b.id = m.id"
			 * ;
			 */
			String sql = "select * from tblsnsBoard";
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();

			if (rs.next()) {
				SnsDTO dto = new SnsDTO();
				
				dto.setSnsboardseq("Snsboardseq");
				dto.setId("id");
				dto.setBoardcategoryseq("boardcategory");
				dto.setBuildingseq("buildingseq");
				dto.setContent("content");
				
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
