package com.project.wood.carpool.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
			
			String sql = "insert into tblCarpool (carpoolseq, boardcategoryseq, driverseq, content, regdate, departtime, departurescity, departures, arrivalscity, arrivals, fee, recruitstatus, recruit) values (carpoolseq.nextval, default, (select driverseq from tblDriver where id = ?), ?, default, to_date(?, 'yyyy-mm-dd hh24:mi:ss'), ?, ?, ?, ?, ?, default, ?)";	
			
			pstat = conn.prepareStatement(sql);
			
			System.out.println(dto);
			
			//CarpoolDTO(carpoolseq=null, boardcategoryseq=null, driverseq=OaKoFc263, content=asdf, regdate=null, ttime=2023-06-16 14:16:00, departurescity=울산, departures=asdfsdf, arrivalscity=인천, arrivals=asdsf, fee=3000, recruitstatus=null, recruit=2, id=null, score=0.0, count=null, carpoolapplyseq=null, applyid=null, applystatus=null, profile=null, nickname=null, gender=null)

			
			pstat.setString(1, dto.getDriverseq());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getTtime());
			pstat.setString(4, dto.getDeparturescity());
			pstat.setString(5, dto.getDepartures());
			pstat.setString(6, dto.getArrivalscity());
			pstat.setString(7, dto.getArrivals());
			pstat.setString(8, dto.getFee());
			pstat.setString(9, dto.getRecruit());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	public ArrayList<CarpoolDTO> list() {
		
		ArrayList<CarpoolDTO> list = new ArrayList<CarpoolDTO>();
		
		try {
			
			
			String sql = "select tblCarpool.*, "
							  + "to_char(departtime, 'MM/DD(DY) HH24:MI') as ttime, "
							  + "(select score from tblDriver where driverseq = tblCarpool.driverseq) as score, "
							  + "(select count from tblDriver where driverseq = tblCarpool.driverseq) as count, "
							  + "(select id from tblDriver where driverseq = tblCarpool.driverseq) as id, "
							  + "(select (select profile from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as profile, "
							  + "(select (select gender from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as gender, "
							  + "(select (select nickname from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as nickname, "
							  + "(select count(*) from tblCarpoolApply where applystatus = '신청 완료' and carpoolseq = tblCarpool.carpoolseq) as recruitcount "
							  + "from tblCarpool order by carpoolseq desc";
			
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			while (rs.next()) {
				
				CarpoolDTO dto = new CarpoolDTO();
				
				dto.setCarpoolseq(rs.getString("carpoolseq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setTtime(rs.getString("ttime"));
				dto.setDeparturescity(rs.getString("departurescity"));
				dto.setDepartures(rs.getString("departures"));
				dto.setArrivalscity(rs.getString("arrivalscity"));
				dto.setArrivals(rs.getString("arrivals"));
				dto.setFee(rs.getString("fee"));
				dto.setRecruitstatus(rs.getString("recruitstatus"));
				dto.setRecruit(rs.getString("recruit"));
				
				dto.setRecruitcount(rs.getString("recruitcount"));
				
				dto.setId(rs.getString("id"));
				dto.setScore(rs.getDouble("score"));
				dto.setCount(rs.getString("count"));

				dto.setProfile(rs.getString("profile"));
				dto.setNickname(rs.getString("nickname"));
				dto.setGender(rs.getString("gender"));
				
				/*System.out.println(rs.getString("carpoolseq") + ":" + rs.getString("recruitcount"));*/
				
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}



	public CarpoolDTO get(String carpoolseq) {
		
		try {
			
			String sql = "select tblCarpool.*, "
					  + "to_char(departtime, 'YYYY/MM/DD(DY) HH24:MI') as ttime, "
					  + "(select score from tblDriver where driverseq = tblCarpool.driverseq) as score, "
					  + "(select count from tblDriver where driverseq = tblCarpool.driverseq) as count, "
					  + "(select id from tblDriver where driverseq = tblCarpool.driverseq) as id, "
					  + "(select (select profile from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as profile, "
					  + "(select (select gender from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as gender, "
					  + "(select (select nickname from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as nickname "
					  + "from tblCarpool where carpoolseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, carpoolseq);
;			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				CarpoolDTO dto = new CarpoolDTO();
				
				dto.setCarpoolseq(rs.getString("carpoolseq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setTtime(rs.getString("ttime"));
				dto.setDeparturescity(rs.getString("departurescity"));
				dto.setDepartures(rs.getString("departures"));
				dto.setArrivalscity(rs.getString("arrivalscity"));
				dto.setArrivals(rs.getString("arrivals"));
				dto.setFee(rs.getString("fee"));
				dto.setRecruitstatus(rs.getString("recruitstatus"));
				dto.setRecruit(rs.getString("recruit"));
				dto.setContent(rs.getString("content"));

				
				dto.setId(rs.getString("id"));
				dto.setScore(rs.getDouble("score"));
				dto.setCount(rs.getString("count"));
				
				dto.setProfile(rs.getString("profile"));
				dto.setNickname(rs.getString("nickname"));
				dto.setGender(rs.getString("gender"));
				
				dto.setApplyid(sql);
				dto.setCarpoolapplyseq(carpoolseq);
			
				
				return dto;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}



	public int edit(CarpoolDTO dto) {
		
		try {
			
			String sql = "update tblCarpool set departurescity = ?, departures = ?, "
					 + "arrivalscity = ?, arrivals = ?, "
					 + "departtime = ?, "
					 + "score = ?, count = ?, "
					 + "content = ? wherer carpoolseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getDeparturescity());
			pstat.setString(2, dto.getDepartures());
			pstat.setString(3, dto.getArrivalscity());
			pstat.setString(4, dto.getArrivals());
			pstat.setString(5, dto.getTtime());
			pstat.setDouble(6, dto.getScore());
			pstat.setString(7, dto.getCount());
			pstat.setString(8, dto.getContent());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}



	public int del(String carpoolseq) {
		
		try {
			
			String sql = "delete from tblCarpool where carpoolseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, carpoolseq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	
	// ------------------------- CarpoolApply ---------------------------------

	//이미 해당하는 carpoolseq 게시글에 신청을 했는지
	public int applyCarpoolList(String carpoolseq, String applyid) {
		
		try {
			
			String sql = "select count(*) as cnt from tblCarpoolApply where carpoolseq = ? and id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, carpoolseq);
			pstat.setString(2, applyid);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}



	public int applyCarpool(String carpoolseq, String applyid) {
		
		try {
			
			String sql = "insert into tblCarpoolApply (carpoolapplyseq, carpoolseq, id, applystatus) values (carpoolapplyseq.nextval, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, carpoolseq);
			pstat.setString(2, applyid);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}



	public ArrayList<CarpoolDTO> getApply(String carpoolseq) {

		try {
			
			String sql = "select "
					+ "(select nickname from tblMember where id = tblCarpoolApply.id) as applynickname, "
					+ "(select gender from tblMember where id = tblCarpoolApply.id) as applygender "
					+ "from tblCarpoolApply "
					+ "where carpoolseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, carpoolseq);
			
			rs = pstat.executeQuery();
			
			
			ArrayList<CarpoolDTO> apply = new ArrayList<CarpoolDTO>();
			
			while (rs.next()) {
				
				CarpoolDTO adto = new CarpoolDTO();
				
				adto.setApplynickname(rs.getString("applynickname"));
				adto.setApplygender(rs.getString("applygender"));
				
				System.out.println("nickname:" + rs.getString("applynickname"));
				System.out.println("gender:" + rs.getString("applygender"));
				
				apply.add(adto);
				
			}
			
			return apply;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}



	


	
	
	

}

























