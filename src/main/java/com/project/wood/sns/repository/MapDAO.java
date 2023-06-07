package com.project.wood.sns.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MapDAO {

	private Connection conn;
	private PreparedStatement pstat;
	private Statement stat;
	private ResultSet rs;
	
	public MapDAO() {
		this.conn= new DBConnect().getConn();
	}
	
	public List<BuildingDTO> blist() {
		
		try {
			
			String sql = "select * from snsbuilding";
			
			stat= conn.createStatement();
			rs= stat.executeQuery(sql);
			
			List<BuildingDTO> blist = new ArrayList<BuildingDTO>();
			
			while(rs.next()) {
				BuildingDTO dto = new BuildingDTO();
				
				dto.setBuildingseq(rs.getString("buildingseq"));
				dto.setName(rs.getString("name"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setAddress(rs.getString("address"));
				dto.setDong(rs.getString("dong"));
				blist.add(dto);
			}
			return blist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<BuildingDTO> dlist() {
		try {
			
			String sql = "select distinct * from dong";
			
			stat= conn.createStatement();
			rs= stat.executeQuery(sql);
			
			List<BuildingDTO> dlist = new ArrayList<BuildingDTO>();
			
			while(rs.next()) {
				BuildingDTO dto = new BuildingDTO();
				dto.setDong(rs.getString("dong"));
				dlist.add(dto);
			}
			return dlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
