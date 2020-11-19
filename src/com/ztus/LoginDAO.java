package com.ztus;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDAO {

	static Connection currentCon = null;
	static ResultSet resultSet = null;
		
	public static Customer login(Customer customer) {
		
		Statement statement = null;
		String email = customer.getEmail();
		String password = customer.getPassword();
		String searchQuery = "SELECT * FROM customer WHERE email='" + email + "' AND password='" + password + "'";
		System.out.println(searchQuery);
		
		try {
			currentCon = ConnectionManager.getConnection();
			statement = currentCon.createStatement();
			resultSet = statement.executeQuery(searchQuery);
			boolean userExists = resultSet.next();
			
			if(!userExists) {
				System.out.println("User with given credentials does not exist!");
				customer.setValid(false);
			}
			
			else if(userExists) {
				//String firstName = resultSet.getString("FirstName");
				//String lastName = resultSet.getString("LastName");
				//customer.setFirstName = firstName;
				//customer.setLastName = lastName;
				System.out.println("User exists!");
				customer.setValid(true);
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
		
		return customer;
	}
	
}
