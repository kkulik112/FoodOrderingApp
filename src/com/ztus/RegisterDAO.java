package com.ztus;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class RegisterDAO {

	static Connection currentCon = null;
	static ResultSet resultSet = null;
	
	public static void addUser(String email, String hash, String name, String lastname, String phonenumber, String province, String country, String city, String zipcode) {
		Statement statement = null;
		Charset charset = StandardCharsets.UTF_8;
		String addQuery = "INSERT INTO konto " + "(email, password) " + "VALUES ('"+email+"','"+hash+"')";
		String getIdQuery = "SELECT id FROM konto WHERE email='"+email+"'";
		System.out.println(addQuery);
		int account_id=0;
		try {
			currentCon = ConnectionManager.getConnection();
			statement = currentCon.createStatement();
			statement.executeUpdate(addQuery);
			ResultSet rs = statement.executeQuery(getIdQuery);
			while(rs.next()) {
				account_id = rs.getInt("id");
			}
			String insertUserDetails = "INSERT INTO klient (imie, nazwisko, numerTelefonu, wojewodztwo, kraj, miasto, kodPocztowy, konto_id) VALUES "
					+ "('"+name+"','"+lastname+"','"+phonenumber+"','"+province+"','"+country+"','"+city+"','"+zipcode+"',"+account_id+")";
			System.out.println(new String(insertUserDetails.getBytes(charset), charset));
			statement.executeUpdate(insertUserDetails);
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
		String searchQuery = "SELECT email FROM konto WHERE email='" + email + "'";
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
