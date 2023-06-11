package com.project.wood.teach.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.my.DBUtil;

public class TeachDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public TeachDAO() {

		this.conn = DBUtil.open("localhost", "team", "java1234");

	}

	public int add(TeachDTO dto) {

		try {
			String sql = "insert into tblTeach values (teachseq.nextVal, ?, ?, ?, ?, ?, default, default, default, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPeriod());
			pstat.setString(3, dto.getPlace());
			pstat.setString(4, dto.getOnoff());
			pstat.setString(5, dto.getPrice());
			pstat.setString(6, dto.getTitle());
			pstat.setString(7, dto.getContent());
			pstat.setString(8, dto.getWeekend());
			pstat.setString(9, dto.getSettime());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<TeachDTO> list() {

		try {

			String sql = "select \r\n"
					+ "    t.*,\r\n"
					+ "    (select profile from tblMember where t.id = tblMember.id)as img, \r\n"
					+ "    (select name from tblMember where t.id=tblMember.id)as name,\r\n"
					+ "    (select nickname from tblMember where t.id=tblMember.id)as nickname,\r\n"
					+ "    c.intro,\r\n"
					+ "    s.studentseq as student,\r\n"
					+ "    a.ateachseq as a,\r\n"
					+ "    (select avg(matchnum) from tblMatch where tblMatch.aseq =(select aseq from tblApply where c.teacherseq = tblApply.ateachseq and s.studentseq = tblApply.astudentseq))as matchnum,\r\n"
					+ "    (select count(review) from tblMatch where tblMatch.aseq =(select aseq from tblApply where c.teacherseq = tblApply.ateachseq and s.studentseq = tblApply.astudentseq))as review\r\n"
					+ "        from tblTeach t\r\n"
					+ "            left outer join tblTeacher c\r\n"
					+ "                on t.id = c.id\r\n"
					+ "                    left outer join tblStudent s\r\n"
					+ "                        on t.id = s.id\r\n"
					+ "                            left outer join tblApply a\r\n"
					+ "                                on t.teachseq = a.ateachseq\r\n"
					+ "                                    order by t.teachseq desc";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			List<TeachDTO> list = new ArrayList<TeachDTO>();

			while (rs.next()) {

				TeachDTO dto = new TeachDTO();

				dto.setTeachseq(rs.getString("teachseq"));
				dto.setId(rs.getString("id"));
				dto.setPeriod(rs.getString("period"));
				dto.setPlace(rs.getString("place"));
				dto.setOnoff(rs.getString("onoff"));
				dto.setPrice(rs.getString("price"));
				dto.setTitle(rs.getString("title"));

//				String content = rs.getString("content");
//				if (content.length() <= 22) {
//				  dto.setContent(content);
//				} else {
//				  dto.setContent(content.substring(0, 22));
//				}

				dto.setContent(rs.getString("content"));

				dto.setImg(rs.getString("img"));
				// dto.setName(rs.getString("name"));
				dto.setNickname(rs.getString("nickname"));
				dto.setIntro(rs.getString("intro"));
				dto.setStudent(rs.getString("student"));

				dto.setMatchNum(String.valueOf(String.format("%.1f", rs.getDouble("matchnum"))));
				dto.setReview(rs.getString("review"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public TeachDTO get(String teachseq) {

		try {
			String sql = "select * from tblTeach where teachseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, teachseq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				TeachDTO dto = new TeachDTO();

				dto.setTeachseq(rs.getString("teachseq"));
				dto.setId(rs.getString("id"));
				dto.setPeriod(rs.getString("period").substring(0, 10));
				dto.setPlace(rs.getString("place"));
				dto.setOnoff(rs.getString("onoff"));
				dto.setPrice(rs.getString("price"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEditdate(rs.getString("editdate"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSettime(rs.getString("settime"));
				dto.setWeekend(rs.getString("weekend"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int subscribe(String teachseq, String id) {
		try {
			String sql = "insert into tblapply values(aseq.nextVal, ?,(select studentseq from tblStudent where id = ?))";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, teachseq);
			pstat.setString(2, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int subscribe(String aseq) {

		try {
			String sql = "delete from tblapply where aseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, aseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int del(String teachseq, String id) {

		try {
			String sql = "delete from tblTeach where teachseq=? and id=?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, teachseq);
			pstat.setString(2, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int editregdate(TeachDTO dto) {

		try {
			String sql = "update tblTeach set editdate=default, title=?, content=?, period=?, onoff=?, price=? where teachseq=? ";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getPeriod());
			pstat.setString(4, dto.getOnoff());
			pstat.setString(5, dto.getPrice());
			pstat.setString(6, dto.getTeachseq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public List<TeachDTO> apply(String id) {

		try {

			String sql = "select * from tblApply where astudentseq = (select studentseq from tblStudent where id = ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();
			List<TeachDTO> alist = new ArrayList<TeachDTO>();

			while (rs.next()) {

				TeachDTO dto = new TeachDTO();

				dto.setAteachseq(rs.getString("ateachseq"));
				dto.setAseq(rs.getString("aseq"));

				alist.add(dto);
			}

			return alist;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public String test(String id) {

		try {
			String sql = "select * from tblStudent s left outer join tblTeacher t on s.id = t.id where s.id = '?' or t.id = '?'";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getString("column");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String place(String id) {

		try {
			String sql = "select address from tblBuilding where buildingseq = (select buildingseq from tblAddress where memberid = ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getString("address");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
