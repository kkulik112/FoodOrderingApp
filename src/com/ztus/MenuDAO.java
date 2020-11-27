package com.ztus;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MenuDAO {

	static Connection currentCon = null;
	static ResultSet resultSet = null;
		
	public static ArrayList<MenuItem> getMenuItems() throws NoSuchAlgorithmException {
		
		Statement statement = null;
		String searchQuery = "SELECT * FROM menu ORDER BY type";
		System.out.println(searchQuery);
		ArrayList<MenuItem> itemList = new ArrayList<MenuItem>();
		
		try {
			currentCon = ConnectionManager.getConnection();
			statement = currentCon.createStatement();
			resultSet = statement.executeQuery(searchQuery);
			
			while(resultSet.next()) {
				MenuItem menuItem = new MenuItem(resultSet.getString("type"), resultSet.getString("name"), resultSet.getDouble("price"));
				itemList.add(menuItem);
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
		
		return itemList;
	}
	
	
	
	
}
