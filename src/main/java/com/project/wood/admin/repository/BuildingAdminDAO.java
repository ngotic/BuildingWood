package com.project.wood.admin.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class BuildingAdminDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public BuildingAdminDAO() {
		this.conn = DBUtil.open();
	}

	public List<BuildingAdminDTO> buildingList() {
	try {
				
				String sql = "select b.*, substr(address, 8, 3) as dong from tblBuilding b";
				pstat = conn.prepareStatement(sql);
				rs = pstat.executeQuery();
				List<BuildingAdminDTO> list = new ArrayList<BuildingAdminDTO>();
				while (rs.next()) {
					BuildingAdminDTO dto = new BuildingAdminDTO();
					dto.setBuildingseq(rs.getString("buildingseq"));
					dto.setName(rs.getString("name"));
					dto.setAddress(rs.getString("address"));
					dto.setDong(rs.getString("dong"));
					dto.setLat(rs.getString("lat"));
					dto.setLng(rs.getString("lng"));
					list.add(dto);
				}
				return list;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		return null;
	}
	
}
