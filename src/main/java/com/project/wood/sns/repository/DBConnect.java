package com.project.wood.sns.repository;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private Connection conn;
		
		//������
	public DBConnect() {
		try {
			//����̹��ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//������ DB����
			String url="jdbc:oracle:thin:@13.124.238.159:1521:xe"; //@localhost:1521:xe - localhost : IP�ּ� / 1521:port ��ȣ / xe: Oracle database client�� ������ service name�̴�.
			//�����ϰ� Connection ��ü�� ������ ������(DB ������ �ٽ� ��ü)
			conn=DriverManager.getConnection(url, "team", "java1234"); //getConnection(url, "�������̵�", "�������")
			System.out.println("oracle DB ���Ӽ���");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//�޼ҵ�
	public Connection getConn() {
		return conn;
	}
}
