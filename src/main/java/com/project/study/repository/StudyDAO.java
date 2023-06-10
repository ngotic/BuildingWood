package com.project.study.repository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
					+ " values (openstudyseq.nextVal,?,?,?,'진행중',?,?,?,?,?,?,?)";
	         pstat = conn.prepareStatement(sql);
	         pstat.setString(1, dto.getJSESSIONID());
	         pstat.setString(2, dto.getNickname());
	         pstat.setString(3, dto.getName());
	         
	         pstat.setString(4, dto.getRecruit());
	         pstat.setString(5, dto.getIntro());
	         pstat.setString(6, dto.getPeriod());
	         pstat.setString(7, dto.getStartdate());
	         pstat.setString(8, dto.getEnddate());
	         pstat.setString(9, dto.getOnoff());
	         pstat.setString(10, dto.getAddress());
	       
	         
	         System.out.println("세션id ="+ dto.getJSESSIONID());
	         System.out.println("id = "+dto.getJSESSIONID());

	         return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<StudyDTO> ListContent() {

		
		ArrayList<StudyDTO> list = new ArrayList<StudyDTO>();
		
		try {
			
			String sql = "select * from tblOpenStudy  order by openstudyseq DESC";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			while(rs.next()){
				  StudyDTO dto = new StudyDTO();
				  dto.setStatus(rs.getString("status"));
                  dto.setName(rs.getString("name"));
                  dto.setOpenstudyseq(rs.getString("openstudyseq"));
                  dto.setRecruit(rs.getString("recruit"));
                  dto.setIntro(rs.getString("intro"));
                  dto.setNickname(rs.getString("nickname"));

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

	public int Setboard(StudyDTO odto) {

		try {
			
		String sql = "insert into tblstudy values (studyseq.nextVAl , ? , ? , (select boardcategoryseq from tblBoardCategory where board = '스터디') ,sysdate,sysdate, ?, ?,0)";
		
		pstat = conn.prepareStatement(sql);

		
		 pstat.setString(1, odto.getOpenstudyseq());
		 pstat.setString(2, odto.getNickname());
		 pstat.setString(3, odto.getContent());
		 pstat.setString(4, odto.getTitle());
		System.out.println("oseq="+odto.getOpenstudyseq());
		System.out.println("title="+odto.getTitle());
		System.out.println("contetnt= "+odto.getContent());
		
		 return pstat.executeUpdate();
		 
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
                dto.setNickname(rs.getString("nickname"));
                dto.setChecke(rs.getInt("checke"));
                
               list.add(dto);

                
			}
			
		System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;	
	}

	public int getCount(String openstudyseq) {
		int maxronum = 0;
		String sql = "select count(rownum) maxronum from (select * from tblStudy st  WHERE openstudyseq = ?  order by studyseq DESC) st";
		StudyListDTO dto = new StudyListDTO();
		try {
			stat = conn.prepareStatement(sql);
			
			pstat.setString(1, openstudyseq);
			
			
			
			return maxronum;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	
		return 0;
	}

	public StudyListDTO board(String studyseq) {
		
		String sql = "select * from tblstudy where studyseq = "+studyseq;
	
		try {
			
			
			pstat = conn.prepareStatement(sql);
			System.out.println("studyseq = "+studyseq);
			rs = pstat.executeQuery();
			StudyListDTO dto = new StudyListDTO();
			if(rs.next()) {
				
			dto.setTitle(rs.getString("title"));
			dto.setNickname(rs.getString("nickname"));
			System.out.println("dto = " + dto);
			dto.setContent(rs.getString("content"));
			dto.setChecke(rs.getInt("checke"));
			
			
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return null;
	}



	public int ListComment(StudyListDTO dto) {
		
		
		
		String sql = "insert into tblStudyComment values (studycommentseq.nextVAL,?,?,?,sysdate,sysdate)";
		
		try {
		pstat = conn.prepareStatement(sql);		
		pstat.setString(1, dto.getStudyseq());
		pstat.setString(2, dto.getNickname());
		pstat.setString(3, dto.getContent());
		
		
		
	    return pstat.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public ArrayList<StudyListDTO> ListCommentselect(StudyListDTO dto) {
		ArrayList<StudyListDTO> list = new ArrayList<StudyListDTO>();
		String sql = "select * from tblStudyComment  WHERE studyseq = ?  ";

		try {
			
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,dto.getStudyseq());
			rs = pstat.executeQuery();
			
			
			while(rs.next()){
			dto = new StudyListDTO();
			
		
			dto.setContent(rs.getString("content"));
			dto.setModifydate(rs.getString("modifydate"));
			dto.setNickname(rs.getString("nickname"));
			
			
			list.add(dto);
			
			}
			System.out.println(list);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
	}

	public StudyDTO odtocontent(String parameter) {
		String sql = "select * from tblopenstudy  WHERE openstudyseq = "+parameter;
		StudyDTO dto = new StudyDTO();
		try {
			
			pstat = conn.prepareStatement(sql);
	
			rs = pstat.executeQuery();
			if (rs.next()) {
				
		
			dto.setName(rs.getString("name"));
			dto.setStatus(rs.getString("status"));
			dto.setRecruit(rs.getString("recruit"));
			dto.setIntro(rs.getString("intro"));
			dto.setPeriod(rs.getString("period"));
			dto.setStartdate(rs.getString("startdate"));
			dto.setEnddate(rs.getString("enddate"));
			dto.setOnoff(rs.getString("onoff"));
			dto.setAddress(rs.getString("address"));
			dto.setNickname(rs.getString("nickname"));
			
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return null;
	}

	public int chcke(String parameter) {
		String sql = "update tblstudy set checke = NVL(checke,0)+1 where studyseq ="+parameter;
		try {
			pstat = conn.prepareStatement(sql);
		
		
			return pstat.executeUpdate();
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}	
		return 0;
	}


	}


	



