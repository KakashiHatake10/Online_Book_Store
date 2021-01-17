package com.example.bean;

public class Order_info {
	
	public int qty;
	public int login_id;
	public int price;
	private String title, description, imgloc;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgloc() {
		return imgloc;
	}

	public void setImgloc(String imgloc) {
		this.imgloc = imgloc;
	}


	public int getLogin_id() {
		return login_id;
	}

	public void setLogin_id(int login_id) {
		this.login_id = login_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
}
