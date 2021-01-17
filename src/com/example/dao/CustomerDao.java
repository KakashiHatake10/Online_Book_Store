package com.example.dao;

import java.util.List;

import com.example.bean.Books_details;
import com.example.bean.Login_Bean;
import com.example.bean.Order;
import com.example.bean.Order_info;

public interface CustomerDao {
	public Login_Bean login(String user, String pass);

	public int register(String name, String email, String address, int phone, int pass);

	public List<Books_details> getPhoto();

	public List<Books_details> getPhotoById(int Customer_id);

	public List<Books_details> getBookId(int Customer_id);

	public int change_pass(String old_pass, int new_pass, int l_id);

	public int Temp_Cart(int id, int qty, int login_id, int price);

	List<Order_info> cart(int log);

	public int payment(int Customer_id, int amount, int card_no);

	public List<Order> myOrder(int Customer_id);

	public int feedback_Submit(String fname, String lname, String email, String msg, String f_type);

}
