package com.project.wood.teach;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.wood.teach.repository.TeachDAO;
import com.project.wood.teach.repository.TeachDTO;

@WebServlet("/teach/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TeachDAO dao = new TeachDAO();
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");

		String idplace = dao.place(id);
		
		req.setAttribute("idplace", idplace);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/teach/add.jsp");
		dispatcher.forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String title=req.getParameter("title");
		String period=req.getParameter("period");
		String place = (req.getParameter("place")).replace("[","").replace("]","");
		String onoff = req.getParameter("onoff");
		String price = req.getParameter("price");
		String content = (req.getParameter("content")).replace("\r\n", "<br>");
		String regdate = req.getParameter("regdate");
		String weekend = req.getParameter("hidden");
		String sttime = req.getParameter("sttime");
		String edtime = req.getParameter("edtime");
		
		weekend = weekend.substring(0, (weekend.length()-1));

		String time = sttime+"~"+edtime;

		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		TeachDAO dao = new TeachDAO();
		TeachDTO dto = new TeachDTO();
		
		dto.setPeriod(period);
		dto.setPlace(place);
		dto.setOnoff(onoff);
		dto.setPrice(price);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		dto.setWeekend(weekend);
		dto.setSettime(time);
		
//		String num = dao.test(id);
		
		int result = dao.add(dto);
		
		if(result==1) {
			session.setAttribute("id", dto.getId());
			
			Calendar cal = Calendar.getInstance();
			System.out.println(regdate);
			cal.get(Calendar.DAY_OF_MONTH);
			resp.sendRedirect("/wood/teach/list.do");
			
		}else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed'); history.back();</script>");
			writer.close();
		}
	}
}
