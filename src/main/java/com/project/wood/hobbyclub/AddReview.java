package com.project.wood.hobbyclub;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.wood.hobbyclub.repository.ClubAssessmentDTO;
import com.project.wood.hobbyclub.repository.ClubDAO;

/*
 * @WebServlet("/club/addreview.do") public class AddReview extends HttpServlet
 * {
 * 
 * ClubDAO cdao = new ClubDAO();
 * 
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException { //AddReview.java String clubseq
 * = req.getParameter("clubseq"); String score = req.getParameter("score");
 * String review = req.getParameter("review"); String id =
 * req.getParameter("id");
 * 
 * ClubAssessmentDTO dto = new ClubAssessmentDTO(); dto.setClubseq(clubseq);
 * dto.setScore(score); dto.setReview(review); dto.setId(id); int result=
 * cdao.addReview(dto); } }
 */