package com.ztus;

import java.sql.*;


public class ConnectionManager {

	static Connection connection;
	static String url;
	
	public static Connection getConnection() {
	
	try {
		String url = "jdbc:mysql://localhost/projekt";
		Class.forName("com.mysql.cj.jdbc.Driver");
		String user = "root";
		String pw = "root";
		connection = DriverManager.getConnection(url, user, pw);
	}catch(SQLException e) {
		e.printStackTrace();
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	return connection;
	}
	
}
