package com.project.wood.recommend.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;

public class RecommendDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public RecommendDAO() {
		this.conn = DBUtil.open("13.124.238.159", "team", "java1234");
	}

}
