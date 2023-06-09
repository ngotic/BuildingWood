package com.project.wood.suggest.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.wood.recommend.repository.RecommendDTO;
import com.test.my.DBUtil;

public class SuggestDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public SuggestDAO() {
		this.conn = DBUtil.open("13.124.238.159", "team", "java1234");
	}

	public List<SuggestDTO> list(HashMap<String, String> smap) {

		List<SuggestDTO> list = new ArrayList<SuggestDTO>();
		try {

			String where = "";
			
			if (smap.get("search").equals("y")) {
	            where = String.format("where %s like '%%%s%%'"
	                              , smap.get("column")
	                              , smap.get("word"));
	         }

	         String sql = String.format("select * from (select a.*, rownum as rnum from vwSuggest a %s) where rnum between %s and %s "
	                              , where
	                              , smap.get("begin")
	                              , smap.get("end")
	                              );

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);


			while (rs.next()) {

				SuggestDTO dto = new SuggestDTO();

				dto.setSuggestseq(rs.getString("suggestseq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setNickname(rs.getString("nickname"));
				dto.setBoardcategoryseq(rs.getString("boardcategoryseq"));
				dto.setIsnew(rs.getDouble("isnew"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int getTotalCount(HashMap<String, String> smap) {

		try {

			String where = "";
			
			if (smap.get("search").equals("y")) {
				where = String.format("where %s like '%%%s%%'"
														, smap.get("column")
														, smap.get("word"));
			}
			
			
			String sql = String.format("select count(*) as cnt from vwSuggest %s", where);
			

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

	//건의게시판 조회수 증가
	public void updateSugReadCount(String suggestseq) {

		try {

			String sql = "update tblSuggest set readcount = readcount + 1 where suggestseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, suggestseq);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//건의게시판 목록
	public SuggestDTO getSuggest(String suggestseq) {

		try {
	
			String sql = "select tblSuggest.*, (select nickname from tblMember where id = tblSuggest.id) as nickname from tblSuggest where suggestseq = ?";
	
			pstat = conn.prepareStatement(sql);
	
			pstat.setString(1, suggestseq);
	
			rs = pstat.executeQuery();
	
			if (rs.next()) {
	
				SuggestDTO dto = new SuggestDTO();
					
				dto.setSuggestseq(rs.getString("suggestseq"));
				dto.setId(rs.getString("id"));
				dto.setBoardcategoryseq(rs.getString("boardcategoryseq"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setCategory(rs.getString("category"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setNickname(rs.getString("nickname"));
	
				return dto;
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int suggestadd(SuggestDTO dto) {

		try {

			String sql = "insert into tblSuggest values (suggestseq.nextVal, ?, 27, ?, ?, sysdate, sysdate, ?, default)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getCategory());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int suggestdel(String suggestseq) {

		try {

			String sql = "delete from tblSuggest where suggestseq = ?";
			

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, suggestseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	
	
	
	
	
	
}




















