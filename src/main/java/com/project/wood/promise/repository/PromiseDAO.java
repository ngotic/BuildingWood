package com.project.wood.promise.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.test.my.DBUtil;


public class PromiseDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	private ResultSet rs2;
	
	
	public PromiseDAO() {
		this.conn = DBUtil.open("13.124.238.159","team", "java1234");
	}





	public int add(PromiseDTO dto) {
		try {
			


			String sql = "insert into tblPromise values (promiseseq.nextVal, ?, 26, ?, ?, ?,? , default, default)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContent());
			pstat.setString(4, dto.getCategory());
			pstat.setString(5, dto.getNum());
			

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	   public List<PromiseDTO> list() {
		      
		      
		      try {
		         
		         String sql = "select promiseseq, title, id, category, num, regdate, nickname, profile from tblPromise p inner join tblMember m on p.writer = m.id";
		         
		         stat = conn.createStatement();
		         rs = stat.executeQuery(sql);
		         
		         List<PromiseDTO> list = new ArrayList<PromiseDTO>();
		         
		         while (rs.next()) {
		            
		            PromiseDTO dto = new PromiseDTO();
		            
		            dto.setPromiseseq(rs.getString("promiseseq"));
		            dto.setTitle(rs.getString("title"));
		            dto.setCategory(rs.getString("category"));
		            dto.setNum(rs.getString("num"));
		            dto.setRegdate(rs.getString("regdate"));
		            dto.setId(rs.getString("id"));
		            dto.setNickname(rs.getString("nickname"));
		            dto.setProfile(rs.getString("profile"));

		            
		            list.add(dto);
		            
		         }
		         
		         return list;
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      
		      
		      return null;
		   }


	public PromiseDTO getpost(String promiseseq) {
		
		try {
			
			String sql ="select promiseseq, id, title, category, content, num, regdate, nickname, profile from tblPromise p inner join tblMember m on p.writer = m.id where promiseseq = ?";
			
			pstat = conn.prepareStatement(sql);

			pstat.setString(1, promiseseq);

			rs = pstat.executeQuery();
			
			
			if (rs.next()) {
				
				PromiseDTO dto = new PromiseDTO();
				
				dto.setPromiseseq(rs.getString("promiseseq"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setNickname(rs.getString("nickname"));
				dto.setProfile(rs.getString("profile"));
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}


	public ArrayList<String> getTag(String promiseseq) {
		
		
		try {
			
			String sql = "select tag from tblPromiseHash ph inner join tblhashtag ht on ph.hashtagseq = ht.hashtagseq where promiseseq = ? ";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, promiseseq);
			
			rs2 = pstat.executeQuery();
			
			ArrayList<String> tags = new ArrayList<String>();
			
			while (rs2.next()) {
				tags.add(rs2.getString("tag"));
			}
			
			return tags;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
public List<PromiseDTO> getTag() {
		
		
		try {
			
			String sql = "select * from tblPromise p inner join tblMember m on m.id = p.writer where regdate between (sysdate-7) and sysdate order by promiseseq desc";
			
	         stat = conn.createStatement();
	         rs = stat.executeQuery(sql);
	         
	         List<PromiseDTO> list = new ArrayList<PromiseDTO>();
	         
	         while (rs.next()) {
	            
	            PromiseDTO dto = new PromiseDTO();
	            
	            dto.setPromiseseq(rs.getString("promiseseq"));
	            dto.setTitle(rs.getString("title"));
	            dto.setCategory(rs.getString("category"));
	            dto.setNum(rs.getString("num"));
	            dto.setRegdate(rs.getString("regdate"));
	            dto.setNickname(rs.getString("nickname"));
	            dto.setProfile(rs.getString("profile"));

	            int adminnum = 0;
	            adminnum = adminnum(dto.getPromiseseq());
	            dto.setAdminnum(adminnum);
	            
//	            getTag((String)dto.getPromiseseq()); //arraylist 왜냐면 dto에서 tag배열이 arraylist니깐
	            
	            ArrayList<String> tags = getTag(dto.getPromiseseq());
	            dto.setTags(tags);
	            
	            
	            list.add(dto);
	            
	         }
	         
	         
	         return list;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      
	      return null;
	   }



public List<PromiseDTO> getTaglist(String tag) {
	
	
	
	try {
		
		String sql = String.format("select * from tblPromise p inner join tblPromisehash ph on ph.promiseseq = p.promiseseq inner join tblhashtag h on h.hashtagseq = ph.hashtagseq inner join tblMember m on m.id = p.writer where tag like '%%%s%%' order by p.promiseseq desc", tag);
		
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);	
         
		List<PromiseDTO> list = new ArrayList<PromiseDTO>();
         
         while (rs.next()) {
            
            PromiseDTO dto = new PromiseDTO();
            
            dto.setPromiseseq(rs.getString("promiseseq"));
            dto.setTitle(rs.getString("title"));
            dto.setCategory(rs.getString("category"));
            dto.setNum(rs.getString("num"));
            dto.setRegdate(rs.getString("regdate"));
            dto.setNickname(rs.getString("nickname"));
            dto.setProfile(rs.getString("profile"));
            
            int adminnum = 0;
            adminnum = adminnum(dto.getPromiseseq());
            dto.setAdminnum(adminnum);

//            getTag((String)dto.getPromiseseq()); //arraylist 왜냐면 dto에서 tag배열이 arraylist니깐
            
            ArrayList<String> tags = getTag(dto.getPromiseseq());
            dto.setTags(tags);
            

            
            list.add(dto);
            
         }
         
        
         return list;
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      return null;
   }






	public boolean checkHashTag(String tag) {

		try {

			String sql = "select count(*) as cnt from tblHashTag where tag = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, tag);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getInt("cnt") > 0 ? false : true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}


	public void addHashTag(String tag) {
		
		try {

			String sql = "insert into tblHashTag values (hashtagseq.nextVal, ?)";
			

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, tag);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}


	public String getHashTagSeq() {
		try {

			String sql = "select max(hashtagseq) as seq from tblHashTag";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);


			if (rs.next()) {

				return rs.getString("seq");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	public String getHashTagSeq(String tag) {
		
		try {

			String sql = String.format("select hashtagseq from tblHashTag where tag = '%s'", tag);

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);


			if (rs.next()) {
				return rs.getString("hashtagseq");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}


	public String getPromiseSeq() {
		
		try {

			String sql = "select max(promiseseq) as seq from tblPromise";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);


			if (rs.next()) {

				return rs.getString("seq");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}


	public void addPromiseHash(HashMap<String, String> map) {
		try {

			String sql = "insert into tblPromisehash values (promisehashseq.nextVal, ?, ?, 26)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, map.get("pseq"));
			pstat.setString(2, map.get("hseq"));

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	public int addComment(ReplyDTO rdto) {
		
	      try {

		         String sql = "insert into tblPromisereply values (promisereplyseq.nextVal, ?, ?, ?, default, default)";

		         pstat = conn.prepareStatement(sql);

		         pstat.setString(1, rdto.getPromiseseq());
		         pstat.setString(2, rdto.getId());
		         pstat.setString(3, rdto.getContent());

		         return pstat.executeUpdate();

		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		
		
		return 0;
	}
	
	
	
	public List<ReplyDTO> rlist(String promiseseq) {

	      try {

	         String sql = "select ps.*,m.nickname from tblPromisereply ps inner join tblMember m on ps.id = m.id  where promiseseq = ? order by promisereplyseq desc";

	         pstat = conn.prepareStatement(sql);

	         pstat.setString(1, promiseseq);

	         rs = pstat.executeQuery();

	         List<ReplyDTO> rlist = new ArrayList<ReplyDTO>();

	         while (rs.next()) {

	            ReplyDTO dto = new ReplyDTO();

	            dto.setPromisereplyseq(rs.getString("promisereplyseq"));
	            dto.setPromiseseq(rs.getString("promiseseq"));
	            dto.setNickname(rs.getString("nickname"));
	            dto.setId(rs.getString("id"));
	            dto.setContent(rs.getString("content"));
	            dto.setRegdate(rs.getString("regdate"));
	            dto.setAccept(rs.getString("accept"));
	            

	            rlist.add(dto);
	         }

	         return rlist;

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return null;
	   }





	public ArrayList<String> getAcceptid(String promiseseq) {
		
		
		try {
			
			String sql = "select distinct(pr.id), nickname from tblPromisereply pr inner join tblMember m on m.id = pr.id where promiseseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, promiseseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<String> acceptid = new ArrayList<String>();
			
			while (rs.next()) {
				acceptid.add(rs.getString("id"));
			}
			
			return acceptid;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}	
	
public ArrayList<String> getApplication(String promiseseq) {
		
		
		try {
			
			String sql = "select distinct(pr.id), nickname from tblPromisereply pr inner join tblMember m on m.id = pr.id where promiseseq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, promiseseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<String> acceptid = new ArrayList<String>();
			
			while (rs.next()) {
				acceptid.add(rs.getString("id"));
			}
			
			return acceptid;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}





public ArrayList<ReplyDTO> getAcceptnickname(String promiseseq) {
	
	
	try {
		
		String sql = "select distinct(nickname),accept from tblPromisereply pr inner join tblMember m on m.id = pr.id where promiseseq = ?";
		
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, promiseseq);
		
		rs = pstat.executeQuery();
		

		ArrayList<ReplyDTO> acceptnickname = new ArrayList<ReplyDTO>();
		
		while (rs.next()) {
			
			ReplyDTO rdto = new ReplyDTO();
			
			rdto.setChecknickname(rs.getString("nickname"));
			rdto.setCheckstate(rs.getString("accept"));
			
			acceptnickname.add(rdto);
		
			
		}
		
		return acceptnickname;
		

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	return null;
}





public int edit(String nickname, String promiseseq) {
	
	try {

		String sql = "update (select pr.*,m.nickname from tblPromisereply pr inner join tblMember m on m.id = pr.id) set accept = 'T' where promiseseq=? and nickname=?";

		pstat = conn.prepareStatement(sql);
		
		System.out.println(sql);

		pstat.setString(1, promiseseq);
		pstat.setString(2, nickname);


		return pstat.executeUpdate();
		

	} catch (Exception e) {
		e.printStackTrace();
	}
	

	return 0;
}





public int adminnum(String promiseseq) {

	try {
		
		String sql = "select count(*) as adminnum from (select distinct(nickname), accept from  tblPromisereply pr inner join tblMember m on m.id = pr.id  where promiseseq=?) where accept='T'";
		
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, promiseseq);
		
		rs2 = pstat.executeQuery();
		
		while (rs2.next()) {
			
			int adminnum = 0;
			adminnum = rs2.getInt("adminnum");
			
			return adminnum;
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	return 0;
}





public String checknickname(String nickname, String promiseseq) {
	
	try {
		
		String sql = "select distinct(nickname) from tblPromisereply pr inner join tblMember m on m.id = pr.id where promiseseq=? and nickname=? and accept='T'";
		
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, promiseseq);
		pstat.setString(2, nickname);
		
		rs = pstat.executeQuery();
		
		while (rs.next()) {
			
			
			
		}		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	

	
	return null;
}





public List<PromiseDTO> getTag(int n) {
	
	
	try {
		
		String sql = "select * from tblPromise p inner join tblMember m on m.id = p.writer where regdate between (sysdate-7-?) and sysdate-? order by promiseseq desc";
		
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setInt(1, n);
		pstat.setInt(2, n);
		
		rs = pstat.executeQuery();
		
         
         List<PromiseDTO> list = new ArrayList<PromiseDTO>();
         
         while (rs.next()) {
            
            PromiseDTO dto = new PromiseDTO();
            
            dto.setPromiseseq(rs.getString("promiseseq"));
            dto.setTitle(rs.getString("title"));
            dto.setCategory(rs.getString("category"));
            dto.setNum(rs.getString("num"));
            dto.setRegdate(rs.getString("regdate"));
            dto.setNickname(rs.getString("nickname"));
            dto.setProfile(rs.getString("profile"));

            int adminnum = 0;
            adminnum = adminnum(dto.getPromiseseq());
            dto.setAdminnum(adminnum);
            
//            getTag((String)dto.getPromiseseq()); //arraylist 왜냐면 dto에서 tag배열이 arraylist니깐
            
            ArrayList<String> tags = getTag(dto.getPromiseseq());
            dto.setTags(tags);
            
            
            list.add(dto);
            
         }
         
         
         return list;
         
      } catch (Exception e) {
         e.printStackTrace();
      }
	
	
	
	
	
	
	
	
	return null;
}



	
	
	

}
