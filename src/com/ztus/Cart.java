package com.ztus;

import java.util.ArrayList;

public class Cart {
	private ArrayList<MenuItem> content;
	private double total;
	
	public Cart() {
		this.content = new ArrayList<>();
		this.total = 0.0;
	}
	
	public Cart(ArrayList<MenuItem> content, double total) {
		this.content = content;
		this.total = total;
	}
	
	public ArrayList<MenuItem> getContent(){
		return this.content;
	}
	
	public void addItem(MenuItem item) {
		this.content.add(item);
	}
	
	public void removeItem(MenuItem item) {
		//TODO probably won't work since it would not be the same object
		this.content.remove(item);
	}
	
	public double getTotal() {
		double result = 0.0;
		for(MenuItem item : content) {
			result += item.getPrice();
		}
		return result;
	}
	
	public int getSize() {
		return this.content.size();
	}
}
