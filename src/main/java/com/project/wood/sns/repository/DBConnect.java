package com.project.wood.sns.repository;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private Connection conn;
		
		//생성자
	public DBConnect() {
		try {
			//드라이버로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//접속할 DB정보
			String url="jdbc:oracle:thin:@localhost:1521:xe"; //@localhost:1521:xe - localhost : IP주소 / 1521:port 번호 / xe: Oracle database client의 고유한 service name이다.
			//접속하고 Connection 객체의 참조값 얻어오기(DB 연동의 핵심 객체)
			conn=DriverManager.getConnection(url, "team", "java1234"); //getConnection(url, "계정아이디", "계정비번")
			System.out.println("oracle DB 접속성공");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//메소드
	public Connection getConn() {
		return conn;
	}
}
