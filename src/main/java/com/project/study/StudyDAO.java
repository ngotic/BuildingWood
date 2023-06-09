package com.project.study;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

			String sql = "insert into tblOpenStudy "
					+ " values (openstudyseq.nextVal,?,'진행중',?,?,?,?,?,?,?)";
	         pstat = conn.prepareStatement(sql);

	         pstat.setString(1, dto.getName());
	         
	         pstat.setString(2, dto.getRecruit());
	         pstat.setString(3, dto.getIntro());
	         pstat.setString(4, dto.getPeriod());
	         pstat.setString(5, dto.getStartdate());
	         pstat.setString(6, dto.getEnddate());
	         pstat.setString(7, dto.getOnoff());
	         pstat.setString(8, dto.getAddress());
	         

	         return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<StudyDTO> ListContent() {

		
		ArrayList<StudyDTO> list = new ArrayList<StudyDTO>();
		
		try {
			
			String sql = "select name, intro, recruit,openstudyseq from tblOpenStudy  order by openstudyseq DESC";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()){
				  StudyDTO dto = new StudyDTO();

                  dto.setName(rs.getString("name"));
                  dto.setOpenstudyseq(rs.getString("openstudyseq"));
                  dto.setRecruit(rs.getString("recruit"));
                  dto.setIntro(rs.getString("intro"));


                 list.add(dto);

                  
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	public ArrayList<StudyDTO> Search(String name) {
		
		ArrayList<StudyDTO> list = new ArrayList<StudyDTO>();
		
		try {
			String sql = "select name, intro, recruit from tblOpenStudy  WHERE name LIKE '%"+name+"%'  order by openstudyseq DESC"; 
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			
			while(rs.next()){
				  StudyDTO dto = new StudyDTO();

                dto.setName(rs.getString("name"));

                dto.setRecruit(rs.getString("recruit"));
                dto.setIntro(rs.getString("intro"));


               list.add(dto);

                
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<StudyDTO> Searchcontent(String name) {
		
		ArrayList<StudyDTO> list = new ArrayList<StudyDTO>();
		 StudyDTO dto = new StudyDTO();
		try {
			String sql = "select name, intro, recruit from tblOpenStudy  WHERE intro LIKE '%"+name+"%'  order by openstudyseq DESC"; 
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			
			while(rs.next()){
				 

                dto.setName(rs.getString("name"));

                dto.setRecruit(rs.getString("recruit"));
                dto.setIntro(rs.getString("intro"));


               list.add(dto);

                
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;	}

	public int Setboard() {

		try {
			
		String sql = "insert into from tblStudy values (studyseq.nextVAL,openstudyseq,boardcategoryseq,sysdate,?,?)";
		
		pstat = conn.prepareStatement(sql);
		rs = pstat.executeQuery();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public ArrayList<StudyListDTO> ListContentstudys(StudyListDTO dto) {
	
		ArrayList<StudyListDTO> list = new ArrayList<StudyListDTO>();
		
		String sql = "select st.*,rownum from (select * from tblStudy st  WHERE openstudyseq = ?  order by studyseq DESC) st"; 

		try {
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getOpenstudyseq());
			
			rs = pstat.executeQuery();
			
			while(rs.next()){
				
				dto = new StudyListDTO();
				
				dto.setRownum(rs.getString("rownum"));
				dto.setStudyseq(rs.getString("studyseq"));
				dto.setOpenstudyseq(rs.getString("openstudyseq"));
                dto.setRegdate(rs.getString("regdate"));
                dto.setEditdate(rs.getString("editdate"));
                dto.setContent(rs.getString("content"));
                dto.setTitle(rs.getString("title"));

              
                
               list.add(dto);

                
			}
			
		System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;	
	}


	
}
