package com.project.wood.mypage.schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class ScheduleDAO {
	
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ScheduleDAO(){
		this.conn = DBUtil.open();
	}

	public int addSchedule(ScheduleDTO dto) {
	
		try {
			String sql ="insert into tblSchedule values(scheduleseq.nextVal, ?, ?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getCategory());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getStartdate());
			pstat.setString(5, dto.getEnddate());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public List<ScheduleDTO> listSchdule(String id) {

		try {
				
				String sql = "select scheduleseq, category, ('['||category||']' ||title) as title, startdate, enddate from tblSchedule where id=?";
				
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, id);
				rs = pstat.executeQuery();
				
				List<ScheduleDTO> list = new ArrayList<ScheduleDTO>();
				
				while (rs.next()) {
					
					ScheduleDTO dto = new ScheduleDTO();
					dto.setScheduleseq(rs.getString("scheduleseq"));
					dto.setCategory(rs.getString("category"));
					dto.setTitle(rs.getString("title"));
					dto.setStartdate(rs.getString("startdate"));
					dto.setEnddate(rs.getString("enddate"));
					
					list.add(dto);
				}
				return list;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return null;
	}

	public int delSchedule(String scheduleseq) {

		try {
			String sql = "delete from tblSchedule where scheduleseq =?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, scheduleseq);
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
