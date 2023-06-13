package com.project.study;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.study.repository.PagingDAO;
import com.project.study.repository.PagingDTO;
import com.project.study.repository.StudyDAO;
import com.project.study.repository.StudyDTO;
import com.project.study.repository.StudyListDTO;

@WebServlet("/study/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//View.java
		
		StudyDAO dao = new StudyDAO();
		StudyListDTO dto = new StudyListDTO();
		StudyDTO odto = new StudyDTO();
		PagingDTO pagedto = new PagingDTO();
		PagingDAO pagedao = new PagingDAO();
		
		ArrayList<StudyListDTO> list = new ArrayList<StudyListDTO>();
		
		System.out.println(req.getParameter("openstudyseq"));
		pagedto.setMaxPage(pagedao.pagingmaxpage(req.getParameter("openstudyseq")));
		
		System.out.println("max page = " + pagedto.getMaxPage());
		
		if(pagedto.getMaxPage() > 10) {
			pagedto.setEndtListpageNumber(10);
			pagedto.setStartListpageNumber(1);
			
		}else {
			
			pagedto.setEndtListpageNumber(pagedto.getMaxPage());
			pagedto.setStartListpageNumber(1);
		}
		
		
		
		System.out.println(req.getParameter("openstudyseq"));
		dto.setOpenstudyseq(req.getParameter("openstudyseq"));
		if(req.getParameter("title")!=null) {
			System.out.println("찍힘ㄴ");
			dto.setContent(req.getParameter("content"));
			dto.setTitle(req.getParameter("title"));
			System.out.println("글내용 ="+dto.getContent());
			System.out.println("글제목 ="+dto.getTitle());
			dto.setOpenstudyseq(req.getParameter("openstudyseq"));
			odto.setContent(req.getParameter("content"));
			odto.setTitle(req.getParameter("title"));
			odto.setOpenstudyseq(req.getParameter("openstudyseq"));
			odto.setNickname((String)req.getSession().getAttribute("nickname"));
			dto.setNickname((String)req.getSession().getAttribute("nickname"));
			int result = dao.Setboard(odto);
			System.out.println("re ="+result);
			if(result ==1 ) {
				
				
				
				
				
				
				
				list = dao.ListContentstudys(dto);
				odto = dao.odtocontent(req.getParameter("openstudyseq"));
		
			
		
				req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
				
			}	
		}
		
		
		String ck = req.getParameter("ck");
		String name = req.getParameter("name");
		System.out.println(name +"이름이요");
		System.out.println(ck +"ck이요");
		if(req.getParameter("name")!=null) {
			
			if(ck.equals("name")) {
				
				list = dao.Searchboard(name , req.getParameter("openstudyseq"));
				
				System.out.println("name list = "+list);
			}else if(ck.equals("content")) {
				list = dao.Searchcontentboard(name , req.getParameter("openstudyseq"));
				
				System.out.println("content list = "+list);
			}else {
				list = dao.Searchboard(name , req.getParameter("openstudyseq"));
				
				System.out.println("걍 list = "+list);
			}
			
		}else {
			
		
		 list = dao.ListContentstudys(dto);
		 odto = dao.odtocontent(req.getParameter("openstudyseq"));
		 System.out.println("걍 list 2 = "+list);
		}
		System.out.println("오디티오에여 " + odto);
		req.setAttribute("pagedto", pagedto);
		req.setAttribute("list", list);
		req.setAttribute("odto", odto);
		req.setAttribute("dto", dto);
		req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		if(list != null) {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/view.jsp");
		dispatcher.forward(req, resp);
		
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
		}
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		StudyListDTO dto = new StudyListDTO();
		StudyDTO odto = new StudyDTO();
		PagingDTO pagedto = new PagingDTO();
		
		
		
		dto.setContent(req.getParameter("content"));
		dto.setTitle(req.getParameter("title"));
		System.out.println("글내용 ="+dto.getContent());
		System.out.println("글제목 ="+dto.getTitle());
		dto.setOpenstudyseq(req.getParameter("openstudyseq"));
		odto.setContent(req.getParameter("content"));
		odto.setTitle(req.getParameter("title"));
		odto.setOpenstudyseq(req.getParameter("openstudyseq"));
		odto.setNickname((String)req.getSession().getAttribute("nickname"));
		int result = dao.Setboard(odto);
		System.out.println("re ="+result);
		if(result ==1 ) {
		
			
			
			
			
			
			
		ArrayList<StudyListDTO> list ;
		
		if(req.getParameter("name")!=null) {
			String ck = req.getParameter("ck");
			String name = req.getParameter("name");
			if(ck.equals("name")) {
				
				list = dao.Searchboard(name , req.getParameter("openstudyseq"));
				
				
			}else if(ck.equals("content")) {
				list = dao.Searchcontentboard(name , req.getParameter("openstudyseq"));
			
			}else {
				list = dao.Searchboard(name , req.getParameter("openstudyseq"));
				
			}
			
		}else {
			list = dao.ListContentstudys(dto);
			
		}
		odto = dao.odtocontent(req.getParameter("openstudyseq"));
		
		System.out.println("list = "+list);
		req.setAttribute("list", list);
		req.setAttribute("dto", dto);
		req.setAttribute("odto", odto);
		req.setAttribute("pagedto", pagedto);
		req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/view.jsp");
		dispatcher.forward(req, resp);
		}else {
			
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
			
		}
	}
	
}

