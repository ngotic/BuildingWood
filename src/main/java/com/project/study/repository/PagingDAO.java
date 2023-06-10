package com.project.study.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;

public class PagingDAO {
	

	   private Connection conn;
	   private PreparedStatement pstat;
	   private Statement stat;
	   private ResultSet rs;
	   
	public PagingDAO(){
		
	  this.conn = DBUtil.open();

	}
	

		//페에지 max 번호 dto 저장
		public int pagingmaxcontent(String parameter) {

			String sql = "SELECT count(*) as count FROM (SELECT t.*, ROWNUM AS rn FROM (SELECT *FROM tblStudyWHERE openstudyseq = ? ORDER BY studyseq DESC ) t)";
			PagingDTO pagedto = new PagingDTO();
			
			try {
				pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			pstat.setString(1,parameter);
			
			pagedto.setMaxContent(rs.getInt("count"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return pagedto.getMaxContent();
			
			
		}

		
		public int pagingmaxpage(String parameter) {
			
			String sql = "SELECT count(*) as count FROM (SELECT t.*, ROWNUM AS rn FROM (SELECT *FROM tblStudy WHERE openstudyseq = ? ORDER BY studyseq DESC ) t)";
			PagingDTO pagedto = new PagingDTO();
			
			try {
				pstat = conn.prepareStatement(sql);
			pstat.setString(1,parameter);
			rs = pstat.executeQuery();
			if(rs.next()) {
			pagedto.setMaxContent(rs.getInt("count"));
			}
			int pagecount;
			int page = pagedto.getMaxContent();
			
			if(page > 0) {
				
				pagecount = page/5;
				if(page%5 >0) {
					pagecount++;
				}
				
				pagedto.setMaxPage(pagecount);
				
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return pagedto.getMaxPage();
			
			
		
		}
		

	
}

