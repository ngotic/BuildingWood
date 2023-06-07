package com.project.wood.sns;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.wood.sns.repository.BuildingDTO;
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
		if(req.getParameter("buildlingseq")==null) {
			buildingseq = ubuildingseq;
		}
		
		System.out.println(buildingseq);
		List<SnsDTO> list = dao.getSNSList(buildingseq);
		List<SnsDTO> plist = dao.getPicList();
		List<SnsDTO> commentlist = dao.getComment();
		
		MapDAO mdao = new MapDAO();
		
		HashMap<String, String> ubuildingInfo = new HashMap<String, String>();
		
		ubuildingInfo=mdao.getuBuildingInfo(ubuildingseq);
		
		List<BuildingDTO> blist = mdao.blist(); //장소 건물
		req.setAttribute("blist", blist);
		
		
		List<BuildingDTO> dlist = mdao.dlist(); //장소 동
		req.setAttribute("dlist", dlist);
		
		
		req.setAttribute("plist", plist);
		req.setAttribute("list", list);
		req.setAttribute("commentlist", commentlist);
		req.setAttribute("unickname", unickname);
		req.setAttribute("profile", profile);
		req.setAttribute("ubuildingseq", ubuildingseq);
		req.setAttribute("ubuildingInfo", ubuildingInfo);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/sns/snsmain.jsp");
		dispatcher.forward(req, resp);
		

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		SnsDAO dao = new SnsDAO();
		try {
			
			MultipartRequest multi = new MultipartRequest(
					
									req,
									req.getRealPath("/asset/sns"),
									1024*1024*10,
									"UTF-8",
									new DefaultFileRenamePolicy()
					
					);
			System.out.println(req.getRealPath("/asset/sns")); 
			HttpSession session =req.getSession();
			String uid=(session.getAttribute("id").toString());
			
			String content = multi.getParameter("add_useritem");
			
			String pic = multi.getFilesystemName("addpic");
			String pic2 = multi.getFilesystemName("addpic2");
			String pic3 = multi.getFilesystemName("addpic3");	
			
			SnsDTO dto = new SnsDTO();
			
			dto.setId(uid);
			dto.setContent(content);
			
			ArrayList<String> piclist = new ArrayList<String>();
			piclist.add(pic);
			piclist.add(pic2);
			piclist.add(pic3);
			
			//dto.setId(session.getAttribute("id").toString());
			
			
			int result = dao.addsnsboard(dto);
			int result2 = dao.addpic(piclist);
			
			if(result!=0&&result2!=0) {
				resp.sendRedirect("/wood/snsmain.do");
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