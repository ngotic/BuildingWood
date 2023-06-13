package com.project.wood.carpool;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.project.wood.carpool.repository.CarpoolApplyDTO;
import com.project.wood.carpool.repository.CarpoolDAO;
import com.project.wood.carpool.repository.CarpoolDTO;

@WebServlet("/carpool/apply.do")
public class Apply extends HttpServlet {

	CarpoolDAO adao = new CarpoolDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Apply.java
		
		String carpoolseq = req.getParameter("carpoolseq");
		String applyid = req.getParameter("applyid");
		
		/* System.out.println("applyid : " + applyid); */
		
		JSONObject obj = new JSONObject();
		
		int applyList = adao.applyCarpoolList(carpoolseq, applyid);
		
		if (applyList == 0) {
			int result = adao.applyCarpool(carpoolseq, applyid);
			obj.put("result", result);
		} else {
			obj.put("result", -1);
		}
		
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();

	}

}
