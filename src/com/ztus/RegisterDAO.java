package com.ztus;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class RegisterDAO {

	static Connection currentCon = null;
	static ResultSet resultSet = null;
	
	public static void addUser(String email, String password) {
		Statement statement = null;
		String addQuery = "INSERT INTO customer " + "(email, password, cust_id) " + "VALUES ('" + email + "', '" + password + "', NULL)";
		System.out.println(addQuery);
		
		try {
			currentCon = ConnectionManager.getConnection();
			statement = currentCon.createStatement();
			statement.executeUpdate(addQuery);
		}catch(Exception e) {
			System.out.println("Some exception has occurred." + e);
		}
		finally {
			if(statement != null) {
				try {
					statement.close();
				}catch(Exception e) {
					statement = null;
				}
			}
			if(currentCon != null) {
				try {
					currentCon.close();
				}catch(Exception e) {
					currentCon = null;
				}
			}
		}
	}
	
	public static boolean alreadyExists(String email) {
		boolean result = false;
		Statement statement = null;
		String searchQuery = "SELECT email FROM customer WHERE email='" + email + "'";
		System.out.println(searchQuery);
		
		try {
			currentCon = ConnectionManager.getConnection();
			statement = currentCon.createStatement();
			resultSet = statement.executeQuery(searchQuery);
			if(resultSet.next()) {
				result = true;
			} else {
				result = false;
			}
		}catch(Exception e) {
			System.out.println("Some exception has occurred." + e);
		}
		finally {
			if(resultSet != null) {
				try {
					resultSet.close();
				}catch(Exception e) {
					resultSet = null;
				}
			}
			if(statement != null) {
				try {
					statement.close();
				}catch(Exception e) {
					statement = null;
				}
			}
			if(currentCon != null) {
				try {
					currentCon.close();
				}catch(Exception e) {
					currentCon = null;
				}
			}
		}
		
		return result;
		
	}
}
