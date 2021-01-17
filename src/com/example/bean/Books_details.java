package com.example.bean;

public class Books_details {
	private String title, author, description, imgloc;
	private int bookid, categoryid, qyt, price, publisherid;

	public String getimgloc() {
		return imgloc;
	}

	public void setimgloc(String imgloc) {
		this.imgloc = imgloc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPublisherid() {
		return publisherid;
	}

	public void setPublisherid(int i) {
		this.publisherid = i;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getQyt() {
		return qyt;
	}

	public void setQyt(int qyt) {
		this.qyt = qyt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}