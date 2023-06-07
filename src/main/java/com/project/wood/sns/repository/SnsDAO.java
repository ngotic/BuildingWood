package com.project.wood.sns.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;





public class SnsDAO {
	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;
	
	public SnsDAO() {
		this.conn= new DBConnect().getConn();
	}
	
	public List<SnsDTO> getSNSList() {
		
		try {

			List<SnsDTO> list = new ArrayList<SnsDTO>();
			String sql = "select * from snslist where buildingseq = 1 order by regdate desc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				SnsDTO dto = new SnsDTO();
				
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setProfile(rs.getString("profile"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setClike(rs.getString("clike"));
				dto.setSnsboardseq(rs.getString("snsboardseq"));
				dto.setCpic(rs.getString("cpic"));
				dto.setBuildingseq(rs.getString("buildingseq"));
				list.add(dto);
				
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<SnsDTO> getPicList() {
		
		try {
			List<SnsDTO> plist = new ArrayList<SnsDTO>();
			String sql = "select tblsnspic.*, (select count(*) from tblsnspic where tblsnspic.snsboardseq = tblsnsboard.snsboardseq) as cpic from tblsnsboard left outer join tblsnspic on tblsnsboard.snsboardseq=tblsnspic.snsboardseq order by tblsnsboard.regdate desc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				SnsDTO pic = new SnsDTO();
				
				pic.setPic(rs.getString("pic"));
				pic.setSnsboardseq(rs.getString("snsboardseq"));
				plist.add(pic);
				
				
			}
			return plist;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<SnsDTO> getComment() {
		try {
			List<SnsDTO> clist = new ArrayList<SnsDTO>();
			String sql = "select * from snscommentlist";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				SnsDTO comment = new SnsDTO();
				
				comment.setSnscommentseq(rs.getString("snscommentseq"));
				comment.setSnsboardseq(rs.getString("snsboardseq"));
				comment.setId(rs.getString("id"));
				comment.setContent(rs.getString("content"));
				comment.setRegdate(rs.getString("writedate"));
				comment.setEditdate(rs.getString("editdate"));
				comment.setNickname(rs.getString("nickname"));
				comment.setProfile(rs.getString("profile"));
				clist.add(comment);
				
				
			}
			return clist;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
