package com.project.wood.sns;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.project.wood.sns.repository.SnsDAO;
import com.project.wood.sns.repository.SnsDTO;

@WebServlet("/snsmain.do")
public class SnsMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SnsDAO dao = new SnsDAO();
		List<SnsDTO> list = dao.getSNSList();
		List<SnsDTO> plist = dao.getPicList();
		List<SnsDTO> commentlist = dao.getComment();
		
		req.setAttribute("plist", plist);
		req.setAttribute("list", list);
		req.setAttribute("commentlist", commentlist);
		
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
			
			String id = multi.getParameter("id");
			String content = multi.getParameter("add_useritem");
			
			String pic = multi.getFilesystemName("addpic");
			String pic2 = multi.getFilesystemName("addpic2");
			String pic3 = multi.getFilesystemName("addpic3");	
			
			SnsDTO dto = new SnsDTO();
			
			dto.setId(id);
			dto.setContent(content);
			
			ArrayList<String> piclist = new ArrayList<String>();
			piclist.add(pic);
			System.out.println(piclist.toString());
			piclist.add(pic2);
			System.out.println(piclist.toString());
			piclist.add(pic3);
			System.out.println(piclist.toString());
			
			//dto.setId(session.getAttribute("id").toString());
			
			
			int result = dao.addsnsboard(dto);
			int result2 = dao.addpic(piclist);
			
			if(result==1&&result2==1) {
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