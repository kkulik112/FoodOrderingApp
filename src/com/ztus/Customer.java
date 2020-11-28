package com.ztus;

import java.io.Serializable;


public class Customer implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String email;
	private String password;
	private String hash;
	private boolean isValidUser;
	
	public String getName() {
		int atIndex = this.getEmail().indexOf('@');
		return this.getEmail().substring(0, atIndex);
	}
	
	public Customer() {
		this.email = "";
		this.password= "";
	}
	
	public Customer(String email, String password) {
		this.email = email;
		this.password= password;
	}
	
	public boolean isValid() {
		return isValidUser;
	}
	public void setValid(boolean value) {
		isValidUser = value;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}
	
	
	
}
