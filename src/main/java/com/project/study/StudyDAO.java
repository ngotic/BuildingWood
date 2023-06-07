package com.project.study;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;




public class StudyDAO {
	
	   private Connection conn;
	   private PreparedStatement pstat;
	   private Statement stat;
	   private ResultSet rs;
	   
	public StudyDAO(){
		
		
	   this.conn = DBUtil.open();
		
	}

	public int OpenStudy(StudyDTO dto) {
	
		try {

			String sql = "insert tblOpenStudy (openstudyseq,name,status,recruit,,intro) values (openstudyseq.nextVal,?,'진행중'?,?)";
	         pstat = conn.prepareStatement(sql);

	         pstat.setString(1, dto.getName());
	         pstat.setInt(2, dto.getRecruit());
	         pstat.setString(3, dto.getIntro());

	         return pstat.executeUpdate();

			
			
		

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
