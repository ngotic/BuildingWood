package com.project.wood.promise;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.project.wood.promise.repository.PromiseDAO;
import com.project.wood.promise.repository.PromiseDTO;

@WebServlet("/promise/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//add.java
		
		HttpSession session = req.getSession();
		
		
		PromiseDTO dto = new PromiseDTO();
		PromiseDAO dao = new PromiseDAO();

try {
		
		
		String promiseseq = req.getParameter("promiseseq");
		String pwriter = req.getParameter("writer");
		String key = req.getParameter("key");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String category = req.getParameter("category");
		String num = req.getParameter("num");
		String regdate = req.getParameter("regdate");
		String editdate = req.getParameter("editdate");
		
		dto.setPromiseseq(promiseseq);
		dto.setWriter((String)session.getAttribute("id"));
		dto.setKey(key);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory(category);
		dto.setNum(num);
		dto.setRegdate(regdate);
		dto.setEditdate(editdate);
		
		
		int result = dao.add(dto);
		
		String pseq = dao.getPromiseSeq();
		
		
		String hashtag = req.getParameter("hashtag");
		
		
		JSONParser parser = new JSONParser();
		
		JSONArray arr = (JSONArray)parser.parse(hashtag);

		
		for (Object obj : arr) {
			//System.out.println(obj); //{"value":"사진"}
			String tag = (String)((JSONObject)obj).get("value");
			
			//해시태그 > insert
			String hseq = "";
			
			if (dao.checkHashTag(tag)) {
				dao.addHashTag(tag);
				hseq = dao.getHashTagSeq();
			} else {
				hseq = dao.getHashTagSeq(tag); //기존 태그 번호
			}
			
			
			//관계 테이블 추가
			HashMap<String,String> map = new HashMap<String,String>();
			
			map.put("pseq", pseq);
			map.put("hseq", hseq);
			
			dao.addPromiseHash(map);
			
			
		}
		
		
		
		
		if (result == 1) {
			resp.sendRedirect("/wood/promise/list.do");
			System.out.println("성공");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
		
} catch (ParseException e) {
	
	e.printStackTrace();
}
		
		
	
	}

}
