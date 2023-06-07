package com.project.wood.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.my.DBUtil;

public class BuildingInfoDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	

	public BuildingInfoDAO() {
		this.conn = DBUtil.open();
	}

	public List<Map<String, String>> getBuildingInfo() {

		try {
			String sql = "select buildingseq, '[' || name ||']' ||address as building from tblBuilding";
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			List<Map<String, String>> blist = new ArrayList<Map<String, String>>();
			while (rs.next()) {
				Map<String, String> bMap = new HashMap<String, String>();
				bMap.put("buildingseq", rs.getString("buildingseq"));
				bMap.put("building", rs.getString("building"));
				blist.add(bMap);
			}
			return blist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
