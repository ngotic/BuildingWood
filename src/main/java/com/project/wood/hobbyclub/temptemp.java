package com.project.wood.hobbyclub;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.hobbyclub.repository.ClubBoardDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;


/*
 * @WebServlet("/club/detail.do") public class temptemp extends HttpServlet {
 * 
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException { //View.java ClubDAO cdao = new
 * ClubDAO(); String hseq = req.getParameter("hseq"); String id =
 * (String)req.getSession().getAttribute("id");
 * 
 * ClubBoardDTO cbdto= cdao.readClubBoard(hseq, id);
 * 
 * req.setAttribute("cbdto", cbdto); System.out.println(cbdto);
 * RequestDispatcher dispatcher =
 * req.getRequestDispatcher("/WEB-INF/views/club/detail.jsp");
 * dispatcher.forward(req, resp);
 * 
 * }
 * 
 * }
 */