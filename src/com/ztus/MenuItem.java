package com.ztus;

import java.io.Serializable;

public class MenuItem implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String type;
	private String name;
	private double price;
	
	public MenuItem() {
		this.type = "";
		this.name = "";
		this.price = 0.0;
	}
	
	public MenuItem(String type, String name, double price) {
		super();
		this.type = type;
		this.name = name;
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String toString(){
		return "Type: " + this.type + ", Name: " + this.name + ", price: " + this.price;
	}
	

}
