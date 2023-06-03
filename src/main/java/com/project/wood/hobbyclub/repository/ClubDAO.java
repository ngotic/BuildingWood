package com.project.wood.hobbyclub.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;


public class ClubDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ClubDAO(){
		this.conn = DBUtil.open();
	}
	
	// 1. 동호회개설 처음엔 close > 관리자가 승인하면 True > Open 
	// 동아리 8개 넣고 
	public List<ClubDTO> list() {
		try {
				// 개설자의 빌딩이름도 같이 출력해줘 
				String sql = "select c.*, to_char(opendate, 'yyyy-mm-dd') as opendatestring,"
						+ "(select name from tblBuilding b where b.buildingseq = a.buildingseq) "
						+ " as buildingname, (select nickname from tblMember where id = c.id) as nickname"
						+ " from tblClub c inner join tbladdress a"
						+ " on c.id = a.id";
				// 쿼리문 띄어쓰기 잘쓰자...
				
				pstat = conn.prepareStatement(sql);
				// address에서 회원이름을 가지고 건물 seq를 찾고
				// 건물 seq로 건물 이름조회
				
				rs = pstat.executeQuery();
				
				List<ClubDTO> list = new ArrayList<ClubDTO>();
				
				while (rs.next()) {
					ClubDTO dto = new ClubDTO();
					dto.setClubseq(rs.getString("clubseq"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setAmount(rs.getString("amount"));
					dto.setPic(rs.getString("pic"));
					dto.setOpendate(rs.getString("opendatestring"));
					dto.setApprove(rs.getString("approve"));
					dto.setBuildingname(rs.getString("buildingname"));
					dto.setNickname(rs.getString("nickname"));
					list.add(dto);
					
				}
				return list;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	}

	public ClubDTO readMemberClub(String id) {
		try {
			// 개설자의 빌딩이름도 같이 출력해줘 
			String sql = "select c.*, to_char(opendate, 'yyyy-mm-dd') as opendatestring,"
					   + "(select name from tblBuilding b where b.buildingseq = a.buildingseq)  as buildingname,"
					   + "(select nickname from tblMember where id=c.id) as nickname "
					   + "from tblClub c inner join tbladdress a "
					   + "on c.id = a.id and c.id = ?";
			// 쿼리문 띄어쓰기 잘쓰자...
			pstat = conn.prepareStatement(sql);
			// 건물 seq로 건물 이름조회 address에서 회원이름을 가지고 건물 seq를 찾고
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				ClubDTO dto = new ClubDTO();
				dto.setClubseq(rs.getString("clubseq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAmount(rs.getString("amount"));
				dto.setPic(rs.getString("pic"));
				dto.setOpendate(rs.getString("opendatestring"));
				dto.setApprove(rs.getString("approve"));
				dto.setBuildingname(rs.getString("buildingname"));
				dto.setNickname(rs.getString("nickname"));
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addClubBoard(ClubBoardDTO cbDto) {
		
		try {
			
			String sql = "insert into tblHobbyClub values ( hobbyclubseq.nextVal, ?,"
					+ " (select boardcategoryseq from tblBoardCategory where board='동호회게시판'),"
					+ " ?, default, default, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cbDto.getClubseq());
			pstat.setString(2, cbDto.getRecruits());
			pstat.setString(3, cbDto.getOpenregdate());
			pstat.setString(4, cbDto.getCloseregdate());
			pstat.setString(5, cbDto.getContent());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	// 해당 사용자의 건물별 동호회를 출력한다. 
	public List<ClubBoardDTO> boardlist(String id) { // 지역별
		
		try {
				String sql = "select hc.*,c.*,  b.buildingseq, b.name as buildingname, (select nickname from tblMember where id=c.id) as nickname "
						+ "from tblHobbyClub hc \r\n"
						+ "    inner join tblclub c on hc.clubseq = c.clubseq \r\n"
						+ "        inner join tbladdress a on c.id = a.id \r\n"
						+ "            inner join tblbuilding b on b.buildingseq = a.buildingseq and b.buildingseq = (select buildingseq from tblAddress where id = ?)";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, id);
				rs = pstat.executeQuery();
				
				List<ClubBoardDTO> list = new ArrayList<ClubBoardDTO>();
				
				while (rs.next()) {
					
					ClubBoardDTO dto = new ClubBoardDTO();
					
					dto.setHobbyclubseq(rs.getString("hobbyclubseq"));
					dto.setClubseq(rs.getString("clubseq"));
					dto.setRecruits(rs.getString("recruits"));
					dto.setRegdate(rs.getString("hobbyclubseq"));
					dto.setEditdate(rs.getString("editdate"));
					dto.setOpenregdate(rs.getString("openregdate").substring(0, 10));
					dto.setCloseregdate(rs.getString("closeregdate").substring(0, 10));
					dto.setContent(rs.getString("content"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					
					dto.setBuildingname(rs.getString("buildingname"));
					dto.setOpendate(rs.getString("opendate"));
					dto.setAmount(rs.getString("amount"));
					dto.setNickname(rs.getString("nickname"));
					list.add(dto);
				}
				
				
				return list;
				
			} catch (Exception e) {
				e.printStackTrace();
		}
		return null;
	}

	public List<ClubBoardDTO> statuscheck(List<ClubBoardDTO> cblist) {
		
		try {
			
			
		} catch (Exception e) {
			
			
		}
		
		return null;
	}

	
	
	public int existClubRegister(String seq, String id) {
	
		try {
			String sql = "select count(*) as cnt from tblClubRegister cr inner join tblClubList cl on cr.id = cl.id and cr.id = ? and cl.clubseq = ? and cr.status = 'N'";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int registerClub(String hseq, String id) {
		
		try {
			String sql = "insert into tblClubRegister values(clubregisterseq.nextVal, ?, ?, default, default)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, hseq);
			pstat.setString(2, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int existClubList(String seq, String id) {
		
		try {
			String sql = "select count(*) as cnt from tblClubList where id =? and clubseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	
	}

	public ClubBoardDTO readClubBoard(String hseq, String id) {
		
		try {
			String sql =   "select hc.*,c.*, c.pic as clubpic, b.buildingseq, b.name as buildingname, (select nickname from tblMember where id=c.id) as nickname \r\n"
					     + "from tblHobbyClub hc \r\n"
					     + "    inner join tblclub c on hc.clubseq = c.clubseq and hc.hobbyclubseq = ? \r\n"
					     + "        inner join tbladdress a on c.id = a.id \r\n"
					     + "            inner join tblbuilding b on b.buildingseq = a.buildingseq "
					     + "and b.buildingseq = (select buildingseq from tblAddress where id = ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, hseq);
			pstat.setString(2, id);
			rs = pstat.executeQuery();
			
		
			ClubBoardDTO dto = new ClubBoardDTO();
			if (rs.next()) {
			
				dto.setHobbyclubseq(rs.getString("hobbyclubseq"));
				dto.setClubseq(rs.getString("clubseq"));
				dto.setRecruits(rs.getString("recruits"));
				dto.setRegdate(rs.getString("hobbyclubseq"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setOpenregdate(rs.getString("openregdate"));
				dto.setCloseregdate(rs.getString("closeregdate"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBuildingname(rs.getString("buildingname"));
				dto.setOpendate(rs.getString("opendate"));
				dto.setAmount(rs.getString("amount"));
				dto.setClubpic(rs.getString("clubpic"));
				dto.setNickname(rs.getString("nickname"));

			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addClub(ClubDTO cdto) {
		
		try {
			// id, name, intro, amount, pic, opendate, approve
			String sql = "insert into tblClub values(clubseq.nextVal, ?, ?, ?, ?, ?, ?, default )";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cdto.getId());
			pstat.setString(2, cdto.getName());
			pstat.setString(3, cdto.getIntro());
			pstat.setString(4, cdto.getAmount());
			pstat.setString(5, cdto.getPic());
			pstat.setString(6, cdto.getOpendate());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
