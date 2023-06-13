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

@WebServlet("/study/pagingview.do")
public class Pagingview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StudyDAO dao = new StudyDAO();
		StudyListDTO dto = new StudyListDTO();
		StudyDTO odto = new StudyDTO();
		PagingDAO pagedao = new PagingDAO();
		PagingDTO pagedto = new PagingDTO();
		
		pagedto.setClicknumber(req.getParameter("pagenumber"));
		
		System.out.println("페이지 넘버 = "+req.getParameter("pagenumber"));
		
		pagedto.setMaxPage(pagedao.pagingmaxpage(req.getParameter("openstudyseq")));
		
		System.out.println("max page = " + pagedto.getMaxPage());
		
		pagedto.setEndtListpageNumber(Integer.parseInt(req.getParameter("endtListpageNumber")));
		pagedto.setStartListpageNumber(Integer.parseInt(req.getParameter("startListpageNumber")));
		
		if(pagedto.getMaxPage() > 10) {
			pagedto.setEndtListpageNumber(pagedto.getEndtListpageNumber());
			pagedto.setStartListpageNumber(pagedto.getStartListpageNumber());
			
			if(pagedto.getClicknumber().equals("다음")){
				if(pagedto.getEndtListpageNumber()!=pagedto.getMaxPage()) {
				pagedto.setStartListpageNumber(pagedto.getStartListpageNumber()+10);
				if(pagedto.getStartListpageNumber()+9 >= pagedto.getMaxPage()) {
					pagedto.setEndtListpageNumber(pagedto.getMaxPage());
				}else {
					pagedto.setEndtListpageNumber(pagedto.getEndtListpageNumber()+10);				
				}
				}
				pagedto.setClicknumber(String.valueOf(pagedto.getStartListpageNumber()));
			}else if(pagedto.getClicknumber().equals("이전")) {
				if(pagedto.getStartListpageNumber()>10) {
			
				pagedto.setStartListpageNumber(pagedto.getStartListpageNumber()-10);
				pagedto.setEndtListpageNumber(pagedto.getStartListpageNumber()+9);	
				if(pagedto.getEndtListpageNumber() >= pagedto.getMaxPage()) {
					pagedto.setEndtListpageNumber(pagedto.getMaxPage());
				}else {
								
				}
			}
				pagedto.setClicknumber(String.valueOf(pagedto.getStartListpageNumber()));
			
			}
		}else {
			
			pagedto.setEndtListpageNumber(pagedto.getMaxPage());
			pagedto.setStartListpageNumber(1);
		}
		
		
		
		/*
		 * if(pagedto.getClicknumber().equals("이전")){
		 * 
		 * if(pagedto.getStartListpageNumber()==1) { pagedto.setClicknumber("1"); }else
		 * { pagedto.setStartListpageNumber(pagedto.getStartListpageNumber()-10);
		 * pagedto.setEndtListpageNumber(pagedto.getEndtListpageNumber()-10);
		 * pagedto.setClicknumber(String.valueOf(pagedto.getStartListpageNumber())); }
		 * 
		 * }else if(pagedto.getClicknumber().equals("다음")) {
		 * 
		 * pagedto.setStartListpageNumber(pagedto.getStartListpageNumber()+10);
		 * pagedto.setEndtListpageNumber(pagedto.getEndtListpageNumber()+10);
		 * 
		 * System.out.println("스타트넘버 1 ="+pagedto.getStartListpageNumber());
		 * 
		 * pagedto.setClicknumber(String.valueOf(pagedto.getStartListpageNumber()));
		 * System.out.println("스타트넘버 2 ="+pagedto.getStartListpageNumber());
		 * 
		 * }else {
		 * 
		 * pagedto.setClicknumber(req.getParameter("pagenumber"));
		 * 
		 * 
		 * }
		 */
		if(pagedto.getClicknumber().equals("1")) {
			//출력 게시글 개수
			pagedto.setStartNumber(Integer.parseInt(pagedto.getClicknumber())-1);
			pagedto.setEndNumber(Integer.parseInt(pagedto.getClicknumber())+4-1);

			
		}else {
			pagedto.setStartNumber(Integer.parseInt(pagedto.getClicknumber())*5-5);
			pagedto.setEndNumber(Integer.parseInt(pagedto.getClicknumber())*5-1);
			
		}
		
		
		dto.setStudyseq(req.getParameter("studyseq"));
		dto.setOpenstudyseq( req.getParameter("openstudyseq"));

			ArrayList<StudyListDTO> commentlist = dao.ListCommentselect(dto);
			dto = dao.board(req.getParameter("studyseq"));
			dto.setOpenstudyseq(req.getParameter("openstudyseq"));
			
			ArrayList<StudyListDTO> list = dao.ListContentstudys(dto);
			odto = dao.odtocontent(req.getParameter("openstudyseq"));

			
			pagedto.setMaxContent(pagedao.pagingmaxcontent(req.getParameter("openstudyseq")));
			pagedto.setMaxPage(pagedao.pagingmaxpage(req.getParameter("openstudyseq")));
			
	
			
			

			
			req.setAttribute("dto", dto);
			req.setAttribute("list", list);
			req.setAttribute("pagedto", pagedto);
			req.setAttribute("odto", odto);
			req.setAttribute("commentlist", commentlist);
			req.setAttribute("studyseq", req.getParameter("studyseq"));
			req.setAttribute("openstudyseq", req.getParameter("openstudyseq"));
		
			
			
			System.out.println("list="+list);
			
			System.out.println("commentlist="+commentlist);
			

		
					
	
			
		if(list != null) {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/study/view.jsp");
		
		dispatcher.forward(req, resp);
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back(); </script>");
			writer.close();
		}
		
	}

	private void pagelist() {
		// TODO Auto-generated method stub
		
	}
	
}