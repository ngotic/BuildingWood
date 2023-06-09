package com.project.wood.promise;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.wood.promise.repository.PromiseDAO;
import com.project.wood.promise.repository.PromiseDTO;



@WebServlet("/promise/list.do")
public class List extends HttpServlet {
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();

		
		
		//list.java
		PromiseDAO dao = new PromiseDAO();
		PromiseDTO dto = new PromiseDTO();
		
		
		/*
		
//		java.util.List<PromiseDTO> tlist = dao.list();
//		
//		req.setAttribute("tlist", tlist);
		

		String tag = req.getParameter("tag");
		
		//System.out.printf("tag: %s", tag);
		
		//req.setAttribute("dto", dto);
		
		//int minpromiseseq = dao.getMinpromiseSeq();
		
		
		java.util.List<PromiseDTO> list = dao.getTag();
		req.setAttribute("list", list);
		
		
		

		
		if (req.getParameter("n") != null) {
			
			int n = Integer.parseInt(req.getParameter("n"));
			
			java.util.List<PromiseDTO> list = dao.getTag(n);
			req.setAttribute("list", list);
			
			 JSONArray arr = new JSONArray();
		      
		      for (PromiseDTO mdto : list) {
		    	  
		    	  JSONObject obj = new JSONObject();
		    	  obj.put("promiseseq", mdto.getPromiseseq());
		    	  obj.put("title", mdto.getTitle());
		    	  obj.put("category", mdto.getCategory());
		    	  obj.put("num", mdto.getNum());
		    	  obj.put("regdate", mdto.getRegdate());
		    	  obj.put("nickname", mdto.getNickname());		    	  
		    	  obj.put("profile", mdto.getProfile());		    	  
		    	  obj.put("adminnum", mdto.getAdminnum());	
		    	  obj.put("tags", mdto.getTags());
		    	  
		    	  
		    	  arr.add(obj);
		    	  
		      }
		      
		      resp.setCharacterEncoding("UTF-8");
		      resp.setContentType("application/json");
		      
		      PrintWriter writer = resp.getWriter();
		      
		      writer.print(arr);
		      
		      writer.close();
			
			
			
		} else {
			java.util.List<PromiseDTO> list = dao.getTaglist(tag);
			req.setAttribute("list", list);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/promise/list.jsp");
			dispatcher.forward(req, resp);
			
		}
		
		
		
		*/
		
		String tag = req.getParameter("tag");
		
		if (req.getParameter("n") == null) {
			if (tag == null || tag.equals("")) {
				
				java.util.List<PromiseDTO> list = dao.getTag();
				req.setAttribute("list", list);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/promise/list.jsp");
				dispatcher.forward(req, resp);
				
			} else if (tag != null) {
				
				java.util.List<PromiseDTO> list = dao.getTaglist(tag);
				req.setAttribute("list", list);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/promise/list.jsp");
				dispatcher.forward(req, resp);
				
			} 
		} else {

			int n = Integer.parseInt(req.getParameter("n"));
			
			System.out.println(n);
			
			java.util.List<PromiseDTO> list = dao.getTag(n);
			req.setAttribute("list", list);
			
			 JSONArray arr = new JSONArray();
		      
		      for (PromiseDTO mdto : list) {
		    	  
		    	  JSONObject obj = new JSONObject();
		    	  obj.put("promiseseq", mdto.getPromiseseq());
		    	  obj.put("title", mdto.getTitle());
		    	  obj.put("category", mdto.getCategory());
		    	  obj.put("num", mdto.getNum());
		    	  obj.put("regdate", mdto.getRegdate());
		    	  obj.put("nickname", mdto.getNickname());		    	  
		    	  obj.put("profile", mdto.getProfile());		    	  
		    	  obj.put("adminnum", mdto.getAdminnum());	
		    	  obj.put("tags", mdto.getTags());
		    	  
		    	  System.out.println(mdto.getTags());
		    	  
		    	  arr.add(obj);
		    	 
		    	  System.out.println(obj);
		    	  
		      }
		      
		      resp.setCharacterEncoding("UTF-8");
		      resp.setContentType("application/json");
		      
		      PrintWriter writer = resp.getWriter();
		      
		      writer.print(arr);
		      
		      writer.close();
		}
		
		
		
		

		
		
		
	}

}

