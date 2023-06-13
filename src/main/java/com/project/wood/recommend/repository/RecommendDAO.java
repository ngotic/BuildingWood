package com.project.wood.recommend.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.my.DBUtil;

public class RecommendDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public RecommendDAO() {
		this.conn = DBUtil.open("13.124.238.159", "team", "java1234");
	}

	public RecMemberDTO reclogin(RecMemberDTO dto) {

		try {

			String sql = "select * from tblMember where id = ? and password = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPassword());

			rs = pstat.executeQuery();

			if (rs.next()) {

				RecMemberDTO result = new RecMemberDTO();

				result.setId(rs.getString("id"));
				result.setLv(rs.getString("lv"));
				result.setNickname(rs.getString("nickname"));
				
				return result;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public RecBuildingDTO recmemberloc(String id) {

		try {

			String sql = "select substr(address, 4, 7) as loc from tblBuilding where buildingseq = (select buildingseq from tblAddress where id = ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {

				RecBuildingDTO bdto = new RecBuildingDTO();

				bdto.setAddress(rs.getString("loc"));

				return bdto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<RecommendDTO> list(HashMap<String, String> map, String loc) {

		List<RecommendDTO> list = new ArrayList<RecommendDTO>();
		try {

			String where = "";
			
			if (map.get("search").equals("y")) {
	            where = String.format("where %s like '%%%s%%'"
	                              , map.get("column")
	                              , map.get("word"));
	         }

	         String sql = String.format("select * from (select a.*, rownum as rnum from vwRecommend a %s) where rnum between %s and %s and area = '%s'"
	                              , where
	                              , map.get("begin")
	                              , map.get("end")
	                              , loc
	                              );

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);


			while (rs.next()) {

				RecommendDTO dto = new RecommendDTO();

				dto.setRecommendseq(rs.getString("recommendseq"));
				dto.setRestaurantseq(rs.getString("restaurantseq"));
				dto.setBoardseq(rs.getString("boardcategoryseq"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setScore(rs.getString("score"));
				dto.setLove(rs.getString("love"));
				dto.setFulladdress(rs.getString("fulladdress"));
				dto.setCategory(rs.getString("category"));
				dto.setArea(rs.getString("area"));
				dto.setCcnt(rs.getString("ccnt"));
				dto.setAvgscore(rs.getString("avgscore"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int getTotalCount(HashMap<String, String> map, String loc) {

		try {

			String where = "";
			
			if (map.get("search").equals("y")) {
				where = String.format("and %s like '%%%s%%'"
														, map.get("column")
														, map.get("word"));
			}
			
			
			String sql = String.format("select count(*) as cnt from vwRecommend where area = '%s' %s", loc, where);
			

			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public RecommendDTO get(String recommendseq) {

		try {

			String sql = "select * from vwRecommend where recommendseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, recommendseq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				RecommendDTO dto = new RecommendDTO();
					
				dto.setRecommendseq(rs.getString("recommendseq"));
				dto.setRestaurantseq(rs.getString("restaurantseq"));
				dto.setBoardseq(rs.getString("boardcategoryseq"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setScore(rs.getString("score"));
				dto.setLove(rs.getString("love"));
				dto.setFulladdress(rs.getString("fulladdress"));
				dto.setCategory(rs.getString("category"));
				dto.setArea(rs.getString("area"));
				dto.setCcnt(rs.getString("ccnt"));
				dto.setAvgscore(rs.getString("avgscore"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<RecMenuDTO> mlist(String restaurantseq) {

		try {

			String sql = "select * from tblmenu where restaurantseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, restaurantseq);

			rs = pstat.executeQuery();

			List<RecMenuDTO> mlist = new ArrayList<RecMenuDTO>();

			while (rs.next()) {

				RecMenuDTO mdto = new RecMenuDTO();

				mdto.setMenuseq(rs.getString("menuseq"));
				mdto.setRestaurantseq(rs.getString("restaurantseq"));
				mdto.setMenu(rs.getString("menu"));
				mdto.setPrice(rs.getString("price"));

				mlist.add(mdto);
			}

			return mlist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public RecMenuDTO menucount(String restaurantseq) {

		try {

			String sql = "select count(*)+1 as mcnt from tblmenu where restaurantseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, restaurantseq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				RecMenuDTO mcountdto = new RecMenuDTO();

				mcountdto.setMcnt(rs.getString("mcnt"));
				
				return mcountdto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<RecImageDTO> ilist(String restaurantseq) {

		try {

			String sql = "select * from tblRestaurantImage where restaurantseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, restaurantseq);

			rs = pstat.executeQuery();

			List<RecImageDTO> ilist = new ArrayList<RecImageDTO>();

			while (rs.next()) {

				RecImageDTO idto = new RecImageDTO();

				idto.setRiseq(rs.getString("riseq"));
				idto.setRestaurantseq(rs.getString("restaurantseq"));
				idto.setPic(rs.getString("pic"));

				ilist.add(idto);
			}

			return ilist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public List<RecCommentDTO> clist(String recommendseq) {

		try {

			String sql = "select * from vwRecComment where recommendseq = ? order by writedate asc";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, recommendseq);

			rs = pstat.executeQuery();

			List<RecCommentDTO> clist = new ArrayList<RecCommentDTO>();

			while (rs.next()) {

				RecCommentDTO cdto = new RecCommentDTO();

				cdto.setRcseq(rs.getString("rcseq"));
				cdto.setRecommendseq(rs.getString("recommendseq"));
				cdto.setId(rs.getString("id"));
				cdto.setContent(rs.getString("content"));
				cdto.setWritedate(rs.getString("writedate"));
				cdto.setEditdate(rs.getString("editdate"));
				cdto.setCommentscore(rs.getString("commentscore"));
				cdto.setNickname(rs.getString("nickname"));
				cdto.setProfile(rs.getString("profile"));

				clist.add(cdto);
			}

			return clist;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int addRecComment(RecCommentDTO cdto) {

		try {

			String sql = "insert into tblRestaurantcomment values (rcseq.nextval, ?, ?, ?, sysdate, sysdate, ?)";
							
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cdto.getRecommendseq());
			pstat.setString(2, cdto.getId());
			pstat.setString(3, cdto.getContent());
			pstat.setString(4, cdto.getCommentscore());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delRecComment(String rcseq) {

		try {

			String sql = "delete from tblRestaurantcomment where rcseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, rcseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editRecComment(String rcseq, String content) {

		try {

			String sql = "update tblRestaurantcomment set content = ? where rcseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, content);
			pstat.setString(2, rcseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	

}




















