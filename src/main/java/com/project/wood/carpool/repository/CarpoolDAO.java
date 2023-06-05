package com.project.wood.carpool.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;

public class CarpoolDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public CarpoolDAO() {
		this.conn = DBUtil.open();
	}
	
	

	public int add(CarpoolDTO dto) {
		
		try {
			
			String sql = "insert into tblCarpool (carpoolseq, boardcategoryseq, driverseq, content, regdate, departtime, departures, arrivals, fee, status, recruit) values (carpoolseq.nextval, default, ?, ?, default, ?, ?, ?, ?, default, ?)";	
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getDriverseq());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getDeparttime());
			pstat.setString(4, dto.getDepartures());
			pstat.setString(5, dto.getArrivals());
			pstat.setInt(6, dto.getFee());
			pstat.setString(7, dto.getRecruit());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	public ArrayList<CarpoolDTO> list() {
		
		ArrayList<CarpoolDTO> list = new ArrayList<CarpoolDTO>();
		
		try {
			
			String sql = "select * from tblCarpool order by seq desc";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			while (rs.next()) {
				
				CarpoolDTO dto = new CarpoolDTO();
				
				dto.setCarpoolseq(rs.getString("carpoolseq"));
				dto.setBoardcategoryseq(rs.getString("boardcategoryseq"));
				dto.setDriverseq(rs.getString("driverseq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setDeparttime(rs.getString("departtime"));
				dto.setDepartures(rs.getString("departures"));
				dto.setArrivals(rs.getString("arrivals"));
				dto.setFee(rs.getInt("fee"));
				dto.setStatus(rs.getString("status"));
				dto.setRecruit(rs.getString("recruit"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

}
