package com.project.wood.sns;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.wood.sns.repository.BuildingDTO;
import com.project.wood.sns.repository.CommentDTO;
import com.project.wood.sns.repository.LikeDTO;
import com.project.wood.sns.repository.MapDAO;
import com.project.wood.sns.repository.SnsDAO;
import com.project.wood.sns.repository.SnsDTO;

@WebServlet("/snsmain.do")
public class SnsMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session =req.getSession();
		
		SnsDAO dao = new SnsDAO();
		
		
		String uid=(session.getAttribute("id").toString());
		
		String unickname = dao.getusernickname(uid);
		String profile = dao.getuserprofile(uid);
		String ubuildingseq = dao.getuserbuildingseq(uid);
		String buildingseq = req.getParameter("buildingseq");  
		String hidemapbox = req.getParameter("hidemapbox");
		
		
		
		
		if(req.getParameter("buildingseq")==null) {
			buildingseq = ubuildingseq;
		}
		if(hidemapbox==null) {
			hidemapbox="f";
		}
		
		String udong = dao.getuserdong(buildingseq);
		
		List<String> likelist = dao.getUserLiked(uid);
		List<SnsDTO> list = dao.getSNSList(buildingseq);
		List<SnsDTO> plist = dao.getPicList();
		List<SnsDTO> commentlist = dao.getComment();
		

		MapDAO mdao = new MapDAO();
		
		HashMap<String, String> buildingInfo = new HashMap<String, String>();
		
		buildingInfo=mdao.getuBuildingInfo(buildingseq);
		
		List<BuildingDTO> blist = mdao.blist(); //장소 건물 
		req.setAttribute("blist", blist);
		
		
		List<BuildingDTO> dlist = mdao.dlist(); //장소 동
		req.setAttribute("dlist", dlist);
		
		System.out.println(list.toString());

		System.out.println(likelist.toString());
		
		
		
		req.setAttribute("plist", plist);
		req.setAttribute("list", list);
		req.setAttribute("commentlist", commentlist);
		req.setAttribute("unickname", unickname);
		req.setAttribute("profile", profile);
		req.setAttribute("buildingseq", buildingseq);
		req.setAttribute("ubuildingseq", ubuildingseq);
		req.setAttribute("buildinginfo", buildingInfo);
		int selected = Integer.parseInt(buildingseq)-1;
		req.setAttribute("selected", selected);
		req.setAttribute("udong", udong);
		req.setAttribute("hidemapbox", hidemapbox);
		req.setAttribute("likelist", likelist);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/sns/snsmain.jsp");
		dispatcher.forward(req, resp);
		
		

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		SnsDAO dao = new SnsDAO();
		HttpSession session =req.getSession();
		String uid=(session.getAttribute("id").toString());
		String type = req.getParameter("type");
		System.out.println(type);
		String ubuildingseq = dao.getuserbuildingseq(uid);
		String buildingseq = req.getParameter("buildingseq"); 
		
		
		
		
		if(req.getParameter("buildingseq")==null) {
			buildingseq = ubuildingseq;
		}
		
		if("1".equals(type)) {
			int count = 0 ;
			String snsboardseq=req.getParameter("snsboardseq");
			String comment = req.getParameter("comment");
			CommentDTO cdto = new CommentDTO();
			cdto.setId(uid);
			cdto.setContent(comment);
			cdto.setSnsboardseq(type);
			cdto.setSnsboardseq(snsboardseq);
			
			System.out.println(cdto.toString());
			
			
			
			int commentresult = dao.addcomment(cdto);
			
			
			if(commentresult==1) {
				System.out.println("성공");
			}else {
				PrintWriter w = resp.getWriter();
				w.print("<script>alert('failed');history.back();</script>");
				w.close();
			}
			
		}
		else if("2".equals(type)) {
			String likesnsboardseq =req.getParameter("likesnsboardseq");
			
			LikeDTO ldto = new LikeDTO();
			ldto.setId(uid);
			ldto.setSnsboardseq(likesnsboardseq);
			
			int likeadd = dao.addlike(ldto);
			System.out.println(ldto.toString());
			System.out.println(likesnsboardseq);
			System.out.println("저장");
			
			
		}  
		else if("3".equals(type)) {
			String likesnsboardseq =req.getParameter("likesnsboardseq");
			
			LikeDTO ldto = new LikeDTO();
			ldto.setId(uid);
			ldto.setSnsboardseq(likesnsboardseq);
			
			int likecancel = dao.cancellike(ldto);
			System.out.println(ldto.toString());
			System.out.println(likesnsboardseq);
			System.out.println("지우기");
			
		}  
		else if("4".equals(type)) {
			String snsboardseq =req.getParameter("delsnsboardseq");
			
			SnsDTO dto = new SnsDTO();
			dto.setId(uid);
			dto.setSnsboardseq(snsboardseq);
			
			int deleteboard = dao.deleteboard(dto);
			System.out.println("지우기");
			
		}  
		else{
			try {
				
				MultipartRequest multi = new MultipartRequest(
						
										req,
										req.getRealPath("/asset/sns"),
										1024*1024*10,
										"UTF-8",
										new DefaultFileRenamePolicy()
						
						);
				
				System.out.println(req.getRealPath("/asset/sns"));
				
				String content = multi.getParameter("add_useritem");
				
				String pic1 = multi.getFilesystemName("addpic1");
				String pic2 = multi.getFilesystemName("addpic2");
				String pic3 = multi.getFilesystemName("addpic3");	
				
				SnsDTO dto = new SnsDTO();
				
				dto.setId(uid);
				dto.setContent(content);
				
				ArrayList<String> piclist = new ArrayList<String>();
				piclist.add(pic1);
				piclist.add(pic2);
				piclist.add(pic3);
				
				//dto.setId(session.getAttribute("id").toString());
				
				
				int result = dao.addsnsboard(dto);
				int result2 = dao.addpic(piclist);
				
				if(result+result2!=0) {
					resp.sendRedirect("/wood/snsmain.do?");
				}else {
					PrintWriter w = resp.getWriter();
					w.print("<script>alert('failed');history.back();</script>");
					w.close();
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	}
}