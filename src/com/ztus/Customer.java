package com.ztus;

import java.io.Serializable;
import java.util.ArrayList;


public class Customer implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String email;
	private String password;
	private String hash;
	private boolean isValidUser;
	//private ArrayList<MenuItem> cart;
	private Cart cart;
	
	public String getName() {
		int atIndex = this.getEmail().indexOf('@');
		return this.getEmail().substring(0, atIndex);
	}
	
	public Customer() {
		this.email = "";
		this.password= "";
		//this.cart = new ArrayList<>();
		this.cart = new Cart();
	}
	
	public Customer(String email, String password) {
		this.email = email;
		this.password= password;
		//this.cart = new ArrayList<>();
		this.cart = new Cart();
	}
	
	/*
	public ArrayList<MenuItem> getCart(){
		return this.cart;
	}
	*/
	
	public Cart getCart() {
		return this.cart;
	}
	
	/*
	public void addToCart(MenuItem item) {
		this.cart.add(item);
	}
	*/
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
