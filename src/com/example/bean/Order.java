package com.example.bean;

import java.sql.Date;

public class Order {
	public int customer_id;
	public int total_amount;
	public String Status;
	public int card_no;
	public String strDate;
	public String expected;
	public Date Pay_date;
	public int transaction;
	public int productStatus;

	public int getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(int productStatus) {
		this.productStatus = productStatus;
	}

	public int getTransaction() {
		return transaction;
	}

	public void setTransaction(int transaction) {
		this.transaction = transaction;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public int getCard_no() {
		return card_no;
	}

	public void setCard_no(int card_no) {
		this.card_no = card_no;
	}

	public String getStrDate() {
		return strDate;
	}

	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}

	public String getExpected() {
		return expected;
	}

	public void setExpected(String expected) {
		this.expected = expected;
	}

	public Date getPay_date() {
		return Pay_date;
	}

	public void setPay_date(Date pay_date) {
		Pay_date = pay_date;
	}

}
