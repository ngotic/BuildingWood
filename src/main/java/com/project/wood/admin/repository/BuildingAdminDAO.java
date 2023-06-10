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

	public BuildingAdminDTO readBuildingInfo(String buildingseq) {
		
		try {

			String sql = "select b.*, substr(address, 8, 3) as dong from tblBuilding b where buildingseq=?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, buildingseq);
			rs = pstat.executeQuery();

			if (rs.next()) {

				BuildingAdminDTO dto = new BuildingAdminDTO();
				dto.setBuildingseq(rs.getString("buildingseq"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));					
				dto.setDong(rs.getString("dong"));
				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<MemberInBuildingDTO> listMemberInBuilding(String buildingseq) {

		
		
		
		try {
				
				String sql ="select a.id, (select nickname from tblmember where id=a.id) as nickname,(select email from tblmember where id=a.id) as email,(select tel from tblmember where id=a.id) as tel,(select birth from tblmember where id=a.id) as birth, (select profile from tblMember where id=a.id) as profile,((select count(*) from tblCarpoolReview where id=a.id )+(select count(*) from tblSnscomment where id=a.id)+(select count(*) from tblSnsRecomment where id=a.id)+(select count(*) from tblRestaurantComment where id=a.id)+(select count(*) from tblRestaurantReComment where id=a.id)+(select count(*) from tblPromiseReply where id=a.id)+(select count(*) from tblPromiseReply where id=a.id)) as replycnt, ((select count(*) from tblopenstudy where id=a.id) + (select count(*) from tblTeach  where id=a.id) + (select count(*) from tblHobbyclub where clubseq = (select clubseq from tblclub  where id=a.id)) + (select count(*) from tblCarpool where driverseq = a.id) + (select count(*) from tblSnsboard where id = a.id) + (select count(*) from tblSuggest where id = a.id) + (select count(*) from tblpromise where writer = a.id)) as boardcnt from tblAddress a where buildingseq = ?";
			
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, buildingseq);
				rs = pstat.executeQuery();
				
				List<MemberInBuildingDTO> list = new ArrayList<MemberInBuildingDTO>();
				
				while (rs.next()) {
					MemberInBuildingDTO dto = new MemberInBuildingDTO();
					dto.setId(rs.getString("id"));
					dto.setNickname(rs.getString("nickname"));
					dto.setEmail(rs.getString("email"));
					dto.setTel(rs.getString("tel"));
					dto.setBirth(rs.getString("birth").substring(0,10));
					dto.setProfile(rs.getString("profile"));
					dto.setReplycnt(rs.getString("replycnt"));
					dto.setBoardcnt(rs.getString("boardcnt"));
					list.add(dto);
				}
				return list;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
		return null;
	}

	public int updateBuildingInfo(BuildingAdminDTO dto) {
		
		try {
			String sql = "update tblBuilding set name=?, address=?, lat=?, lng=? where buildingseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAddress());
			pstat.setString(3, dto.getLat());
			pstat.setString(4, dto.getLng());
			pstat.setString(5, dto.getBuildingseq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
